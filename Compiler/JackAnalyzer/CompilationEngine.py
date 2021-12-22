from typing import TextIO
from exceptions import JackSyntaxError
from JackTokenizer import JackTokenizer
from GrammarType import *
from Keywords import *
from TokenType import TokenType


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
    def __init__(self, input: JackTokenizer, outfile: TextIO) -> None:
        self.input = input
        self.outfile = outfile
        self.rule: str = ''  # current grammar rule we are compiling
        self.rule_stack: List[str] = []
        self.token: str = ''
        self.token_type: TokenType = TokenType.NONE

        self.advance()

    def compile_class(self) -> None:
        self.writeln('<test>')
        self.compile_if()

        self.compile_let()
        self.compile_let()

        # subroutineDec test
        self.compile_subroutineDec()

        # var dec test
        self.compile_classVarDec()
        self.compile_varDec()
        self.writeln('</test>')

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
        self.eat(TokenType.IDENTIFIER)
        self.eat('(')
        self.compile_paramList()
        self.eat(')')
        self.compile_subroutineBody()

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

        if self.token == ',':
            self.write_token()
            self.advance()
            self.compile_varDecList()

    @grammar_rule(STATEMENTS)
    def compile_statements(self) -> None:
        self.statements_helper()

    def statements_helper(self) -> None:
        if self.token in [LET, IF, DO, WHILE, RETURN]:
            func = f'self.compile_{self.token}()'
            print(f'evaluating {func = }')
            eval(func)
            self.statements_helper()

    @grammar_rule(LET_STATEMENT)
    def compile_let(self) -> None:
        self.eat(LET)
        self.eat(TokenType.IDENTIFIER)

        if self.token == '[':
            self.eat('[')
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
        print('WARNING: compile_do needs to be finished')
        self.compile_expr()
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

    def compile_exprList(self) -> None:
        pass

    def eat(self, *args: str | TokenType) -> None:
        found = any(
            self.token == arg or self.token_type == arg
            for arg in args
        )

        if not found:
            self.error(f'{args}')

        self.write_token()
        self.advance()

    def write_token(self):
        self.writeln(self.input.to_xml())

    def writeln(self, *lines: str):
        for line in lines:
            self.outfile.write(line + '\n')

    def error(self, expected: str) -> None:
        raise JackSyntaxError(
            f'\nERROR: Invalid {self.rule} \nExpected {expected} \nCurrent Token: {self.token} \nCurrent line: {self.input.get_line()} ')

    def advance(self):
        if self.input.has_more_tokens():
            self.input.advance()
            self.token = self.input.token_value()
            self.token_type = self.input.token_type()

    def push_rule(self, rule: str) -> None:
        """pushes `rule` onto the rule_stack"""
        self.rule_stack.append(rule)
        print(f'pushing {rule} - {self.rule_stack = }')
        self.rule = rule
        self.tag()

    def pop_rule(self) -> None:
        self.end_tag()
        rule = self.rule_stack.pop()
        print(f'popping {rule} - {self.rule_stack = }')
        self.rule = self.rule_stack[-1] if self.rule_stack else ''

    def tag(self) -> None:
        self.writeln(f'<{self.rule}>')

    def end_tag(self) -> None:
        self.writeln(f'</{self.rule}>')


def test(fun):
    print(fun)
    fun(1, 2)


def printall(x, y):
    print(x, y)


if __name__ == '__main__':
    args = {'filename': 'myfile.txt', 'error': 'an error'}
    message = "can't open '%(filename)s': %(error)s"
    # print(message % args)
