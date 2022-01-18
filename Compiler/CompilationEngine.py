from typing import NamedTuple, NoReturn, TextIO, Tuple
from ArithmeticCommand import ArithmeticCommand
from exceptions import JackError
from Segment import Segment
from JSymbolTable import JSymbolTable, VarKind, JSymbol
from exceptions import JackSyntaxError
from JackTokenizer import JackTokenizer
from GrammarType import *
from Keywords import *
from TokenType import TokenType
from VMWriter import VMWriter

Function = NamedTuple('Function', [('kind', str), ('name', str)])


class CompliationEngine:
    """
    Building a compiler for Jack language in the nand2tetris course.
    """

    def __init__(self, input: JackTokenizer, writer: VMWriter) -> None:
        self.input = input
        self.writer = writer
        self.classname = ''  # the class we are compiling
        # the constructor, method or function (kind) we are compiling (kind,
        # name)
        self.curr_func = Function('', '')
        self.has_return = False
        self.token: str = ''
        self.token_type: TokenType = TokenType.NONE
        self.sym_table = JSymbolTable()
        self.while_counter = 0
        self.if_counter = 0
        self.advance()

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
        if self.token == VAR:
            raise JackError(
                f"Cannot have var declaration outside of function scope. Current Token: {self.token}\nCurrent Line: {self.input.get_line()}")
        while self.token != '}':
            self.compile_subroutineDec()
        self.eat('}')
        print('class compilation finished.')

    def compile_classVarDec(self) -> None:  # sourcery skip: class-extract-method
        """
        Compiles a static or field variable declaration.
        Grammar:
         - ('static'|'field' ) type varName (',' varName)* ';'
        """
        kind_ = self.token
        self.eat(STATIC, FIELD)
        kind = VarKind.STATIC if kind_ == 'static' else VarKind.FIELD

        type_ = self.token
        self.eat(*var_types)

        self.compile_varDecList(type_, kind)
        self.eat(';')

    def compile_subroutineDec(self) -> None:
        """
        grammar: ('constructor'|'function'|'method') (void' | type) subroutineName
                 '(' parameterList ')' subroutineBody
        """
        self.has_return = False
        self.sym_table.start_subroutine()
        self.if_counter = 0
        self.while_counter = 0
        func_kind = self.token
        self.eat(CONSTRUCTOR, FUNCTION, METHOD)
        self.eat(VOID, *var_types)

        print(f'Compiling {self.token}() ... ')

        self.curr_func = Function(kind=func_kind, name=self.token)
        self.eat(TokenType.IDENTIFIER)
        self.eat('(')
        self.compile_paramList()
        self.eat(')')

        self.compile_subroutineBody()

        if not self.has_return:
            raise JackError(
                f"No return statement found in {self.classname}.{self.curr_func.name}")
        self.curr_func = Function('', '')
        # print('subroutine compilation finished.')

    def compile_paramList(self) -> None:
        """
        grammer: ( (type varName) (',' type varName)*)?
        """
        if self.curr_func.kind == METHOD:
            # first argument to a method is always 'this'
            # (the object on which this method is called)
            # we never actually access 'this' through the symbol table
            # but I add it to keep the indices of the arguments correct
            self.def_symbol('this', self.classname, VarKind.ARGUMENT)

        # no parameter list
        if self.token == ')':
            return

        type_ = self.token
        self.eat(*var_types)
        self.def_symbol(self.token, type_, VarKind.ARGUMENT)
        self.eat(TokenType.IDENTIFIER)

        while self.maybe_eat(','):
            type_ = self.token
            self.eat(*var_types)
            self.def_symbol(self.token, type_, VarKind.ARGUMENT)
            self.eat(TokenType.IDENTIFIER)

    def compile_subroutineBody(self) -> None:
        """
        grammar: '{' varDec* statements '}'
        """
        self.eat('{')
        while self.token == VAR:
            # doesn't generate any code, just add them to the symbol table
            self.compile_varDec()

        nlocals = self.sym_table.var_count(VarKind.VAR)
        full_name = f'{self.classname}.{self.curr_func.name}'
        self.writer.function(full_name, nlocals)

        if self.curr_func.kind == CONSTRUCTOR:
            object_size = self.sym_table.var_count(VarKind.FIELD)
            self.writer.push(Segment.Constant, object_size)
            self.writer.call('Memory.alloc', 1)
            self.writer.pop(Segment.Pointer, 0)
        elif self.curr_func.kind == METHOD:
            # 'this' is always passed as the first argument
            self.writer.push(Segment.Argument, 0)
            self.writer.pop(Segment.Pointer, 0)
        self.compile_statements()

        self.eat('}')

    def compile_varDec(self) -> None:
        """
        Compiles a variable declaration.
        Grammar:
         - 'var' type varName (',' varName)* ';'
        """
        self.eat(VAR)
        type_ = self.token
        self.eat(*var_types)
        self.compile_varDecList(type_, VarKind.VAR)
        self.eat(';')

    def compile_varDecList(self, type_: str, kind: VarKind) -> None:
        """
        type_: int,char,boolean,class name
        kind: arg,static,field
        """
        self.def_symbol(self.token, type_, kind)
        self.eat(TokenType.IDENTIFIER)

        if self.maybe_eat(','):
            self.compile_varDecList(type_, kind)

    def compile_statements(self) -> None:
        while self.token in [LET, IF, DO, WHILE, RETURN]:
            if self.token == RETURN:
                self.has_return = True

            method = getattr(self, f'compile_{self.token}')
            method()

    def compile_let(self) -> None:
        self.eat(LET)
        sym = self.sym_table.get(self.token)
        self.eat(TokenType.IDENTIFIER)

        if self.maybe_eat('['):
            self.writer.push(sym.kind.value, sym.index)
            self.compile_expr()
            self.eat(']')
            self.writer.arithmetic(ArithmeticCommand.ADD)
            self.eat('=')
            self.compile_expr()
            self.writer.pop(Segment.Temp, 0)
            self.writer.pop(Segment.Pointer, 1)
            self.writer.push(Segment.Temp, 0)
            self.writer.pop(Segment.That, 0)
        else:
            self.eat('=')
            self.compile_expr()
            self.writer.pop(sym.kind.value, sym.index)

        self.eat(';')

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
        self.writer.if_goto(if_true)
        self.writer.goto(if_false)
        self.writer.label(if_true)
        self.eat('{')
        self.compile_statements()
        self.eat('}')
        if self.token == ELSE:
            self.writer.goto(if_end)
        self.writer.label(if_false)
        if self.maybe_eat(ELSE):
            self.eat('{')
            self.compile_statements()
            self.eat('}')
            self.writer.label(if_end)

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
        self.writer.label(start_label)
        self.compile_expr()

        self.eat(')')

        self.writer.if_goto(true_label)
        self.writer.goto(end_label)
        self.writer.label(true_label)

        self.eat('{')
        self.compile_statements()
        self.eat('}')

        self.writer.goto(start_label)

        self.writer.label(end_label)

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
        self.writer.pop(Segment.Temp, 0)

    def compile_return(self) -> None:
        """'return' expression? ';'"""
        self.eat(RETURN)
        if self.maybe_eat(';'):
            self.writer.push(Segment.Constant, 0)
        else:
            self.compile_expr()
            self.eat(';')

        self.writer.return_()

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
                self.writer.arithmetic(ArithmeticCommand.ADD)
            elif op == '-':
                self.writer.arithmetic(ArithmeticCommand.SUB)
            elif op == '*':
                self.writer.call('Math.multiply', 2)
            elif op == '/':
                self.writer.call('Math.divide', 2)
            elif op == '&':
                self.writer.arithmetic(ArithmeticCommand.AND)
            elif op == '|':
                self.writer.arithmetic(ArithmeticCommand.OR)
            elif op == '<':
                self.writer.arithmetic(ArithmeticCommand.LT)
            elif op == '>':
                self.writer.arithmetic(ArithmeticCommand.GT)
            elif op == '=':
                self.writer.arithmetic(ArithmeticCommand.EQ)

    def compile_term(self) -> None:
        """
        integerConstant | stringConstant | keywordConstant
        | varName
        | varName '[' expression ']'
        | subroutineCall
        | '(' expression ') '
        | unary Op term

        """
        if self.token_type == TokenType.INT_CONST:
            self.writer.push(Segment.Constant, int(self.token))
            self.advance()

        elif self.token_type == TokenType.STR_CONST:
            string_length = len(self.token)
            self.writer.push(Segment.Constant, string_length)
            self.writer.call('String.new', 1)
            for char in self.token:
                char_code = ord(char)
                self.writer.push(Segment.Constant, char_code)
                self.writer.call('String.appendChar', 2)
            self.advance()

        elif self.token in keyword_constants:
            if self.token == TRUE:
                self.writer.push(Segment.Constant, 1)
                self.writer.arithmetic(ArithmeticCommand.NEG)
            elif self.token in (FALSE, NULL):
                self.writer.push(Segment.Constant, 0)
            elif self.token == THIS:
                self.writer.push(Segment.Pointer, 0)
            self.advance()

        elif self.maybe_eat('('):
            self.compile_expr()
            self.eat(')')

        elif self.token in unary_ops:
            op = self.token
            self.advance()
            self.compile_term()
            if op == '-':
                self.writer.arithmetic(ArithmeticCommand.NEG)
            elif op == '~':
                self.writer.arithmetic(ArithmeticCommand.NOT)
            else:
                self.error(f'a unary op: {unary_ops}')

        else:
            # we have to "look ahead" to know what type of expression this is
            # an array access, a subroutine call, or regular variable access
            name = self.token
            self.eat(TokenType.IDENTIFIER)
            if self.maybe_eat('['):
                sym = self.sym_table.get(name)
                self.writer.push(sym.kind.value, sym.index)
                self.compile_expr()
                self.eat(']')
                self.writer.arithmetic(ArithmeticCommand.ADD)
                self.writer.pop(Segment.Pointer, 1)
                self.writer.push(Segment.That, 0)
            elif self.token in ('.', '('):
                self.compile_subroutineCall(name)
            else:  # otherwise it's just a plain varName
                sym = self.sym_table.get(name)
                self.writer.push(sym.kind.value, sym.index)

    def compile_subroutineCall(self, name) -> None:
        """
        subroutineName '(' expressionList ')'
        | (className| varName) '.' subroutineName '(' expressionList ')'
        """
        nargs = 0
        if self.maybe_eat('.'):
            if self.sym_table.exists(name):
                # method call e.g. obj.method(arg1,...)
                sym = self.sym_table.get(name)
                # push the object as the first argument
                self.writer.push(sym.kind.value, sym.index)
                nargs = 1
                name = f'{sym.type}.{self.token}'
            else:  # function or constructor call
                name += f'.{self.token}'

            self.eat(TokenType.IDENTIFIER)
        else:
            # method call from within the class (implicit 'this.')
            # e.g. do draw();
            self.writer.push(Segment.Pointer, 0)
            nargs = 1
            name = f'{self.classname}.{name}'

        self.eat('(')
        nargs += self.compile_exprList()
        self.eat(')')
        self.writer.call(name, nargs)

    def compile_exprList(self) -> int:
        """
        Returns the number of expressions in the list
        Grammar: (expression (',' expression)* )?
        """
        if self.token == ')':
            return 0

        self.compile_expr()
        exprs = 1
        while self.maybe_eat(','):
            exprs += 1
            self.compile_expr()
        return exprs

    def eat(self, *args: str | TokenType) -> None:
        """
        Checks that the token or token_type is in one of the arguments,
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
            f'\nERROR: Expected {expected} \nCurrent Token: {self.token} \nCurrent line: {self.input.get_line()} ')

    def advance(self):
        if self.input.has_more_tokens():
            self.input.advance()
            self.token = self.input.token_value()
            self.token_type = self.input.token_type()
        else:
            print(
                '>>>WARNING: self.advance() was called when the tokenizer had no more tokens.')

    def def_symbol(self, name, type_, kind) -> int:
        self.sym_table.define(name, type_, kind)
        return self.sym_table.index_of(name)


if __name__ == '__main__':
    """"""
    print(1e50)
