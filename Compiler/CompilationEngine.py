from typing import NoReturn, TextIO
from JSymbolTable import VarKind, JSymbol
from exceptions import JackSyntaxError
from JackTokenizer import JackTokenizer
from GrammarType import *
from Keywords import *
from TokenType import TokenType
from JSymbolTable import JSymbolTable


def grammar_rule(rule):
    """Ensures the first and last thing that happens when a grammar rule is compiled is pushing and popping the rule from the stack. Call the decorator with the grammar rule as it's argument. """
    def decorator(fn):
        def wrapper(self):
            self.push_rule(rule)
            fn(self)
            self.pop_rule()
        return wrapper
    return decorator


class CompliationEngine:
    """
    Building a compiler for Jack language in the nand2tetris course.
    Note to self - All the helper methods are needed to avoid duplicate xml tags
                   on a recursive call. This could be fixed by adding the xml tag
                   outside of the fuction itself. Add <expression> right before
                   a call to compile_expr(), rather than at the beginning of compile_expr().
    """

    def __init__(self, input: JackTokenizer, outfile: TextIO) -> None:
        self.input = input
        self.outfile = outfile
        self.rule: str = ''  # current grammar rule we are compiling
        self.rule_stack: List[str] = []
        self.token: str = ''
        self.token_type: TokenType = TokenType.NONE
        self.sym_table = JSymbolTable()
        self.advance()

    @grammar_rule(CLASS_GRAMMAR)
    def compile_class(self) -> None:
        """
        'class' className '{' classVarDec* subroutineDec* '}'
        """
        self.eat(CLASS_KEYWORD)
        print(f'Compiling `{self.token}` class...')

        self.eat(TokenType.IDENTIFIER, tag='classDef')
        self.eat('{')
        while self.token in (STATIC, FIELD):
            self.compile_classVarDec()
        while self.token != '}':
            self.compile_subroutineDec()
        self.eat('}')
        print('class compilation finished.')

    @grammar_rule(CLASS_VAR_DEC)
    def compile_classVarDec(self) -> None:  # sourcery skip: class-extract-method
        """
        Compiles a static or field variable declaration.
        Grammar:
         - ('static'|'field' ) type varName (',' varName)* ';'
        """
        kind_ = self.token
        self.eat(STATIC, FIELD)
        kind = VarKind.STATIC if kind_ == 'static' else VarKind.FIELD

        typee = self.token
        self.eat(*var_types)

        self.compile_varDecList(typee, kind)
        self.eat(';')

    @grammar_rule(SUBROUTINE_DEC)
    def compile_subroutineDec(self) -> None:
        """
        grammar: ('constructor'|'function'|'method') (void' | type) subroutineName
                 '(' parameterList ')' subroutineBody
        """
        self.sym_table.start_subroutine()

        func_kind = self.token
        self.eat(CONSTRUCTOR, FUNCTION, METHOD)
        self.eat(VOID, *var_types)

        print(f'Compiling `{self.token}` subroutine... ')
        self.eat(TokenType.IDENTIFIER, tag=func_kind)
        self.eat('(')
        self.compile_paramList()
        self.eat(')')
        self.compile_subroutineBody()
        print('subroutine compilation finished.')

    @grammar_rule(PARAMETER_LIST)
    def compile_paramList(self) -> None:
        """
        grammer: ( (type varName) (',' type varName)*)?
        """
        # no parameter list
        if self.token == ')':
            return

        typee = self.token
        self.eat(*var_types)
        tag = self.def_symbol(self.token, typee, VarKind.ARGUMENT)
        self.eat(TokenType.IDENTIFIER, tag=tag)

        if self.token == ',':
            self.paramList_helper()

    def paramList_helper(self) -> None:
        self.eat(',')
        typee = self.token
        self.eat(*var_types)
        tag = self.def_symbol(self.token, typee, VarKind.ARGUMENT)
        self.eat(TokenType.IDENTIFIER, tag=tag)
        if self.token == ',':
            self.paramList_helper()

    @grammar_rule(SUBROUTINE_BODY)
    def compile_subroutineBody(self) -> None:
        """
        grammar: '{' varDec* statements '}'
        """
        self.eat('{')
        while self.token == VAR:
            self.compile_varDec()

        self.compile_statements()

        self.eat('}')

    @grammar_rule(VAR_DEC)
    def compile_varDec(self) -> None:
        """
        Compiles a variable declaration.
        Grammar:
         - 'var' type varName (',' varName)* ';'
        """
        self.eat(VAR)
        typee = self.token
        self.eat(*var_types)
        self.compile_varDecList(typee, VarKind.VAR)
        self.eat(';')

    def compile_varDecList(self, typee: str, kind: VarKind) -> None:
        """
        typee: int,char,boolean,class name
        kind: arg,static,field
        """
        tag = self.def_symbol(self.token, typee, kind)
        self.eat(TokenType.IDENTIFIER, tag=tag)

        if self.maybe_eat(','):
            self.compile_varDecList(typee, kind)

    @grammar_rule(STATEMENTS)
    def compile_statements(self) -> None:
        while self.token in [LET, IF, DO, WHILE, RETURN]:
            method = getattr(self, f'compile_{self.token}')
            method()

    @grammar_rule(LET_STATEMENT)
    def compile_let(self) -> None:
        self.eat(LET)
        tag = self.set_symbol_stmnt(self.token)
        self.eat(TokenType.IDENTIFIER, tag=tag)

        if self.maybe_eat('['):
            self.compile_expr()
            self.eat(']')

        self.eat('=')
        self.compile_expr()
        self.eat(';')

    @grammar_rule(IF_STATEMENT)
    def compile_if(self) -> None:
        """
        grammar:
        'if' '(' expression ')' '{' statements '}' ('else' '{' statements '}')?
        """
        self.eat(IF)
        self.eat('(')
        self.compile_expr()
        self.eat(')')

        self.eat('{')
        self.compile_statements()
        self.eat('}')

        if self.token != ELSE:
            return

        # else block
        self.eat(ELSE)
        self.eat('{')
        self.compile_statements()
        self.eat('}')

    @grammar_rule(WHILE_STATEMENT)
    def compile_while(self) -> None:
        """
        'while' '(' expression ')''{' statements '}'
        """
        self.eat(WHILE)
        self.eat('(')
        self.compile_expr()
        self.eat(')')

        self.eat('{')
        self.compile_statements()
        self.eat('}')

    @grammar_rule(DO_STATEMENT)
    def compile_do(self) -> None:
        """
        'do' subroutineCall';'
        """
        self.eat(DO)
        self.eat(TokenType.IDENTIFIER)

        self.compile_subroutineCall()
        self.eat(';')

    @grammar_rule(RETURN_STATEMENT)
    def compile_return(self) -> None:
        """'return' expression? ';'"""
        self.eat(RETURN)
        if self.token != ';':
            self.compile_expr()
        self.eat(';')

    @grammar_rule(EXPRESSION)
    def compile_expr(self) -> None:
        """
        term (op term)*
        """
        self.expr_helper()

    def expr_helper(self) -> None:
        self.compile_term()
        if self.maybe_eat(*binary_ops):
            self.expr_helper()

    @grammar_rule(TERM)
    def compile_term(self) -> None:
        """
        integerConstant 
        | stringConstant 
        | keywordConstant 
        | varName 
        | varName '[' expression ']' 
        | subroutineCall 
        | '(' expression ') ' 
        | unary Op term

        """
        if self.maybe_eat(TokenType.INT_CONST, TokenType.STR_CONST, *keyword_constants):
            return
        elif self.maybe_eat('('):
            self.compile_expr()
            self.eat(')')
        elif self.maybe_eat(*unary_ops):
            self.compile_term()
        else:
            # we have to "look ahead" to know what type of expression this is
            # array access, subroutine call, regular variable access
            name = self.token
            if self.token_type != TokenType.IDENTIFIER:
                self.error(TokenType.IDENTIFIER.value)

            self.advance()
            sym: JSymbol
            if self.token == '[':
                maybe_sym = self.sym_table.get(name)
                if maybe_sym is None:
                    self.error(f'An existing variable. `{name}` is not defined')
                sym = maybe_sym
                tag = self.fmt_tag(sym.kind, sym.index, 'accessed')
                self.writeln(f'<{tag}> {name} </{tag}>')

                self.eat('[')
                self.compile_expr()
                self.eat(']')
            elif self.token in ('.', '('):
                tag = TokenType.IDENTIFIER.value if self.token == '.' else 'subroutineCall'
                self.writeln(f'<{tag}> {name} </{tag}>')
                self.compile_subroutineCall()
            else:  # otherwise it's just a plain varName
                maybe_sym = self.sym_table.get(name)
                if maybe_sym is None:
                    self.error(f'An existing variable. `{name}` is not defined')

                sym = maybe_sym
                tag = self.fmt_tag(sym.kind, sym.index, 'accessed')
                self.writeln(f'<{tag}> {name} </{tag}>')

    def compile_subroutineCall(self) -> None:
        """
        subroutineName '(' expressionList ')' 
        | (className| varName) '.' subroutineName '(' expressionList ')'        
        """
        if self.maybe_eat('.'):
            self.eat(TokenType.IDENTIFIER, tag='subroutineCall')

        self.eat('(')
        self.compile_exprList()
        self.eat(')')

    @grammar_rule(EXPRESSIONLIST)
    def compile_exprList(self) -> None:
        """(expression (',' expression)* )?"""
        self.exprList_helper()

    def exprList_helper(self) -> None:
        if self.token == ')':
            return

        self.compile_expr()
        if self.maybe_eat(','):
            self.exprList_helper()

    def eat(self, *args: str | TokenType, tag='') -> None:
        """
        VERY IMPORTANT FUNCTION
        It checks that the token or token_type is in one of the arguments, 
        throwing an error if it isn't, and advancing to the next token if it is. 
        """
        found = any(
            self.token == arg or self.token_type == arg
            for arg in args
        )

        if not found:
            self.error(f'{args}')

        self.write_token(tag)
        self.advance()

    def maybe_eat(self, *args: str | TokenType, tag: str = '') -> bool:
        """
        Same as `eat()` but it doesn't throw an error if none 
        of the arguments match self.token or self.token_type

        returns true if one of the arguments was found, false otherwise.
        """
        found = any(
            self.token == arg or self.token_type == arg
            for arg in args
        )

        if found:
            self.write_token(tag)
            self.advance()

        return found

    def write_token(self, tag=''):
        if not tag:
            self.writeln(self.input.to_xml())
        else:
            self.writeln(f'<{tag}> {self.token} </{tag}>')

    def writeln(self, *lines: str):
        for line in lines:
            self.outfile.write(line + '\n')

    def error(self, expected: str) -> NoReturn:
        raise JackSyntaxError(
            f'\nERROR: Invalid {self.rule} \nExpected {expected} \nCurrent Token: {self.token} \nCurrent line: {self.input.get_line()} ')

    def advance(self):
        if self.input.has_more_tokens():
            self.input.advance()
            self.token = self.input.token_value()
            self.token_type = self.input.token_type()
        else:
            print('>>>WARNING: self.advance() was called when the analyzer had no more tokens.')

    def push_rule(self, rule: str) -> None:
        """pushes `rule` onto the rule_stack"""
        self.rule_stack.append(rule)
        self.rule = rule
        self.tag()

    def pop_rule(self) -> None:
        self.end_tag()
        rule = self.rule_stack.pop()
        self.rule = self.rule_stack[-1] if self.rule_stack else ''

    def tag(self) -> None:
        self.writeln(f'<{self.rule}>')

    def end_tag(self) -> None:
        self.writeln(f'</{self.rule}>')

    def def_symbol(self, name, typee, kind) -> str:
        self.sym_table.define(name, typee, kind)
        index = self.sym_table.index_of(name)
        return self.fmt_tag(kind, index, 'def')

    def set_symbol_stmnt(self, name: str) -> str:
        sym = self.sym_table.get(name)
        if sym is None:
            self.error(f'An existing varialbe. variable "{name}" does not exist.')
        else:
            sym_: JSymbol = sym
        return self.fmt_tag(sym_.kind, sym_.index, 'set')

    def fmt_tag(self, kind: VarKind, index: int | None, context: str) -> str:
        if index is None:
            self.error('int')
        return f'{kind.value}::{index}::{context}'


class Dummy:
    def __init__(self) -> None:
        self.x = '1'

    def amethod(self) -> None:
        print('amethod')


if __name__ == '__main__':
    i = 0
    for _ in range(200):
        for _ in range(200):
            i += 1
    print(i)
