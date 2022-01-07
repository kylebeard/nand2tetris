from typing import NamedTuple, NoReturn, TextIO, Tuple
from ArithmeticCommand import ArithmeticCommand
from Segment import Segment
from JSymbolTable import JSymbolTable, VarKind, JSymbol
from exceptions import JackSyntaxError
from JackTokenizer import JackTokenizer
from GrammarType import *
from Keywords import *
from TokenType import TokenType
from VMWriter import VMWriter


def grammar_rule(rule):
    """Ensures the first and last thing that happens when a grammar rule is compiled is pushing and popping the rule from the stack. Call the decorator with the grammar rule as it's argument. """
    def decorator(fn):
        def wrapper(self):
            self.push_rule(rule)
            rv = fn(self)
            self.pop_rule()
            return rv
        return wrapper
    return decorator


CurrFunc = NamedTuple('CurrFunc', [('kind', str), ('name', str)])


class CompliationEngine:
    """
    Building a compiler for Jack language in the nand2tetris course.
    Note to self - All the helper methods are needed to avoid duplicate xml tags
                   on a recursive call. This could be fixed by adding the xml tag
                   outside of the fuction itself. Add <expression> right before
                   a call to compile_expr(), rather than at the beginning of compile_expr().
    """

    def __init__(self, input: JackTokenizer, writer: VMWriter) -> None:
        self.input = input
        self.writer = writer
        self.classname = ''  # the class we are compiling
        # the constructor, method or function we are compiling (returnVal, name)
        self.curr_func = CurrFunc('', '')
        self.rule: str = ''  # current grammar rule we are compiling
        self.rule_stack: List[str] = []
        self.token: str = ''
        self.token_type: TokenType = TokenType.NONE
        self.sym_table = JSymbolTable()
        self.while_counter = 0
        self.if_counter = 0
        self.advance()

    @grammar_rule(CLASS_GRAMMAR)
    def compile_class(self) -> None:
        """
        'class' className '{' classVarDec* subroutineDec* '}'
        """
        self.eat(CLASS_KEYWORD)
        print(f'Compiling `{self.token}` class...')
        self.classname = self.token
        self.eat(TokenType.IDENTIFIER)
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
        self.if_counter = 0
        self.while_counter = 0
        func_kind = self.token
        self.eat(CONSTRUCTOR, FUNCTION, METHOD)
        self.eat(VOID, *var_types)

        print(f'Compiling `{self.token}` subroutine... ')
        self.curr_func = CurrFunc(func_kind, self.token)
        self.eat(TokenType.IDENTIFIER)
        self.eat('(')
        self.compile_paramList()
        self.eat(')')
        self.compile_subroutineBody()
        self.curr_func = CurrFunc('', '')
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
        self.def_symbol(self.token, typee, VarKind.ARGUMENT)
        self.eat(TokenType.IDENTIFIER)

        while self.maybe_eat(','):
            typee = self.token
            self.eat(*var_types)
            self.def_symbol(self.token, typee, VarKind.ARGUMENT)
            self.eat(TokenType.IDENTIFIER)

    @grammar_rule(SUBROUTINE_BODY)
    def compile_subroutineBody(self) -> None:
        """
        grammar: '{' varDec* statements '}'
        """
        self.eat('{')
        while self.token == VAR:
            self.compile_varDec()

        nlocals = self.sym_table.var_count(VarKind.VAR)
        if self.curr_func is None:
            self.error('curr_func is empty in compile_subroutineBody')

        full_name = f'{self.classname}.{self.curr_func.name}'
        self.writer.write_function(full_name, nlocals)
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
        self.def_symbol(self.token, typee, kind)
        self.eat(TokenType.IDENTIFIER)

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
        var = self.token
        self.eat(TokenType.IDENTIFIER)

        if self.maybe_eat('['):
            raise NotImplementedError('arrays not implemented')
            self.compile_expr()
            self.eat(']')

        self.eat('=')
        self.compile_expr()
        sym = self.sym_table.get(var)
        self.writer.write_pop(sym.kind.value, sym.index)

        self.eat(';')

    @grammar_rule(IF_STATEMENT)
    def compile_if(self) -> None:
        """
        grammar:
        'if' '(' expression ')' '{' statements '}' ('else' '{' statements '}')?
        """

        if_true = f'IF_TRUE{self.if_counter}'
        if_false = f'IF_FALSE{self.if_counter}'
        if_end = f'IF_END{self.if_counter}'
        self.if_counter += 1

        self.eat(IF)
        self.eat('(')
        self.compile_expr()
        self.eat(')')
        self.writer.write_if(if_true)
        self.writer.write_goto(if_false)
        self.writer.write_label(if_true)
        self.eat('{')
        self.compile_statements()
        self.eat('}')
        if self.token == ELSE:
            self.writer.write_goto(if_end)
        self.writer.write_label(if_false)
        if self.maybe_eat(ELSE):
            self.eat('{')
            self.compile_statements()
            self.eat('}')
            self.writer.write_label(if_end)

    @grammar_rule(WHILE_STATEMENT)
    def compile_while(self) -> None:
        """
        'while' '(' expression ')''{' statements '}'
        """
        start_label = f'WHILE_START{self.while_counter}'
        true_label = f'WHILE_TRUE{self.while_counter}'
        end_label = f'WHILE_END{self.while_counter}'
        self.while_counter += 1

        self.eat(WHILE)
        self.eat('(')

        # start of the loop in vm
        self.writer.write_label(start_label)
        self.compile_expr()

        self.eat(')')

        self.writer.write_if(true_label)
        self.writer.write_goto(end_label)
        self.writer.write_label(true_label)

        self.eat('{')
        self.compile_statements()
        self.eat('}')

        self.writer.write_goto(start_label)

        self.writer.write_label(end_label)

    @grammar_rule(DO_STATEMENT)
    def compile_do(self) -> None:
        """
        'do' subroutineCall';'
        """
        self.eat(DO)
        name = self.token
        self.eat(TokenType.IDENTIFIER)

        self.compile_subroutineCall(name)
        self.eat(';')
        # do statements don't use the return value, so dump it in Temp Segment
        self.writer.write_pop(Segment.Temp, 0)

    @grammar_rule(RETURN_STATEMENT)
    def compile_return(self) -> None:
        """'return' expression? ';'"""
        self.eat(RETURN)
        if self.maybe_eat(';'):
            self.writer.write_push(Segment.Constant, 0)
        else:
            self.compile_expr()
            self.eat(';')

        self.writer.write_return()

    @grammar_rule(EXPRESSION)
    def compile_expr(self) -> None:
        """
        term (op term)*
        """
        self.compile_term()
        if self.token in binary_ops:
            op = self.token
            self.advance()
            self.compile_expr()
            # '+', '-', '*', '/', '&', '|', '<', '>', '='
            if op == '+':
                self.writer.write_arithmetic(ArithmeticCommand.ADD)
            elif op == '-':
                self.writer.write_arithmetic(ArithmeticCommand.SUB)
            elif op == '*':
                self.writer.write_call('Math.multiply', 2)
            elif op == '/':
                self.writer.write_call('Math.divide', 2)
            elif op == '&':
                self.writer.write_arithmetic(ArithmeticCommand.AND)
            elif op == '|':
                self.writer.write_arithmetic(ArithmeticCommand.OR)
            elif op == '<':
                self.writer.write_arithmetic(ArithmeticCommand.LT)
            elif op == '>':
                self.writer.write_arithmetic(ArithmeticCommand.GT)
            elif op == '=':
                self.writer.write_arithmetic(ArithmeticCommand.EQ)

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
        if self.token_type == TokenType.INT_CONST:
            self.writer.write_push(Segment.Constant, int(self.token))
            self.advance()
        elif self.token_type == TokenType.STR_CONST:
            raise NotImplementedError('STR_CONST not implemented yet.')
        elif self.token in keyword_constants:
            if self.token == TRUE:
                self.writer.write_push(Segment.Constant, 1)
                self.writer.write_arithmetic(ArithmeticCommand.NEG)
            elif self.token in (FALSE, NULL):
                self.writer.write_push(Segment.Constant, 0)
            elif self.token == THIS:
                raise NotImplementedError('"this" keyword not implemented yet.')
            self.advance()
        elif self.maybe_eat('('):
            self.compile_expr()
            self.eat(')')
        elif self.token in unary_ops:
            op = self.token
            self.advance()
            self.compile_term()
            if op == '-':
                self.writer.write_arithmetic(ArithmeticCommand.NEG)
            elif op == '~':
                self.writer.write_arithmetic(ArithmeticCommand.NOT)
            else:
                self.error(f'a unary op: {unary_ops}')
        else:
            # we have to "look ahead" to know what type of expression this is
            # e.g., array access, subroutine call, or regular variable access
            name = self.token
            if self.token_type != TokenType.IDENTIFIER:
                self.error(TokenType.IDENTIFIER.value)

            self.advance()
            if self.token == '[':
                raise NotImplementedError('arrays not implemented')
                self.eat('[')
                self.compile_expr()
                self.eat(']')
            elif self.token in ('.', '('):
                self.compile_subroutineCall(name)
            else:  # otherwise it's just a plain varName
                sym = self.sym_table.get(name)
                self.writer.write_push(sym.kind.value, sym.index)

    def compile_subroutineCall(self, name) -> None:
        """
        subroutineName '(' expressionList ')'
        | (className| varName) '.' subroutineName '(' expressionList ')'
        """
        if self.maybe_eat('.'):
            name += f'.{self.token}'
            self.eat(TokenType.IDENTIFIER)

        self.eat('(')
        nargs = self.compile_exprList()
        self.eat(')')
        self.writer.write_call(name, nargs)

    @grammar_rule(EXPRESSIONLIST)
    def compile_exprList(self) -> int:
        """(expression (',' expression)* )?"""
        if self.token == ')':
            return 0

        self.compile_expr()
        nargs = 1
        while self.maybe_eat(','):
            nargs += 1
            self.compile_expr()
        return nargs

    def eat(self, *args: str | TokenType) -> None:
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

        self.advance()

    def maybe_eat(self, *args: str | TokenType) -> bool:
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
            self.advance()

        return found

    def error(self, expected: str) -> NoReturn:
        raise JackSyntaxError(
            f'\nERROR: Invalid {self.rule} \nExpected {expected} \nCurrent Token: {self.token} \nCurrent line: {self.input.get_line()} ')

    def advance(self):
        if self.input.has_more_tokens():
            self.input.advance()
            self.token = self.input.token_value()
            self.token_type = self.input.token_type()
        else:
            print(
                '>>>WARNING: self.advance() was called when the analyzer had no more tokens.')

    def push_rule(self, rule: str) -> None:
        """pushes `rule` onto the rule_stack"""
        self.rule_stack.append(rule)
        self.rule = rule

    def pop_rule(self) -> None:
        rule = self.rule_stack.pop()
        self.rule = self.rule_stack[-1] if self.rule_stack else ''

    def def_symbol(self, name, typee, kind) -> int:
        self.sym_table.define(name, typee, kind)
        return self.sym_table.index_of(name)


class Dummy:
    def __init__(self) -> None:
        self.x = '1'

    def amethod(self) -> None:
        print('amethod')


def mock(e: str):
    print(f'Expected: {e}')


if __name__ == '__main__':

    mock(f'{unary_ops}')
