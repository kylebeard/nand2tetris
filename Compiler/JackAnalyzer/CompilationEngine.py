from typing import NoReturn, TextIO
from exceptions import JackSyntaxError
from JackTokenizer import JackTokenizer
from GrammarType import *
from Keywords import *
from TokenType import TokenType

# test


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

        self.advance()

    @grammar_rule(CLASS_GRAMMAR)
    def compile_class(self) -> None:
        """
        'class' className '{' classVarDec* subroutineDec* '}'
        """
        self.eat(CLASS_KEYWORD)
        print(f'Compiling `{self.token}` class...')
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

        self.eat(STATIC, FIELD)
        self.eat(*var_types)
        self.compile_varDecList()
        self.eat(';')

    @grammar_rule(SUBROUTINE_DEC)
    def compile_subroutineDec(self) -> None:
        """
        grammar: ('constructor'|'function'|'method') (void' | type) subroutineName
                 '(' parameterList ')' subroutineBody
        """
        self.eat(CONSTRUCTOR, FUNCTION, METHOD)
        self.eat(VOID, *var_types)
        print(f'Compiling `{self.token}` subroutine... ')
        self.eat(TokenType.IDENTIFIER)
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

        self.eat(*var_types)
        self.eat(TokenType.IDENTIFIER)

        if self.token == ',':
            self.paramList_helper()

    def paramList_helper(self) -> None:
        self.eat(',')
        self.eat(*var_types)
        self.eat(TokenType.IDENTIFIER)
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
        self.eat(*var_types, TokenType.IDENTIFIER)
        self.compile_varDecList()
        self.eat(';')

    def compile_varDecList(self) -> None:
        self.eat(TokenType.IDENTIFIER)

        if self.maybe_eat(','):
            self.compile_varDecList()

    @grammar_rule(STATEMENTS)
    def compile_statements(self) -> None:
        while self.token in [LET, IF, DO, WHILE, RETURN]:
            method = getattr(self, f'compile_{self.token}')
            method()

    @grammar_rule(LET_STATEMENT)
    def compile_let(self) -> None:
        self.eat(LET)
        self.eat(TokenType.IDENTIFIER)

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
            self.eat(TokenType.IDENTIFIER)
            if self.maybe_eat('['):
                self.compile_expr()
                self.eat(']')
            elif self.token in ('.', '('):
                self.compile_subroutineCall()

            # otherwise it's just a plain varName

    def compile_subroutineCall(self) -> None:
        """
        subroutineName '(' expressionList ')' 
        | (className| varName) '.' subroutineName '(' expressionList ')'        
        """
        if self.maybe_eat('.'):
            self.eat(TokenType.IDENTIFIER)

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

        self.write_token()
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
            self.write_token()
            self.advance()

        return found

    def write_token(self):
        self.writeln(self.input.to_xml())

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


class Dummy:
    def __init__(self) -> None:
        self.x = '1'

    def amethod(self) -> None:
        print('amethod')


if __name__ == '__main__':
    dummy = Dummy()
    getattr(dummy, 'amethod')()
    # attr()
