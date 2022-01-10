from typing import List, NoReturn
from enum import Enum
from exceptions import JackError
from Segment import Segment


class VarKind(Enum):
    VAR = Segment.Local
    ARGUMENT = Segment.Argument
    STATIC = Segment.Static
    FIELD = Segment.This
    locals = [VAR, ARGUMENT]
    globals = [STATIC, FIELD]
    all_kinds = [VAR, ARGUMENT, STATIC, FIELD]


class IdentifierKind(Enum):
    VAR = 'var'
    ARGUMENT = 'argument'
    STATIC = 'static'
    FIELD = 'field'
    CLASS = 'class'
    #   SUBROUTINE = 'subroutine'
    FUNCTION = 'function'
    METHOD = 'method'
    CONSTRUCTOR = 'constructor'
    all_kinds = [
        VAR,
        ARGUMENT,
        STATIC,
        FIELD,
        CLASS,
        FUNCTION,
        METHOD,
        CONSTRUCTOR]


class JSymbol:
    def __init__(self, name: str, type_: str, kind: VarKind, index) -> None:
        self.name = name
        self.kind = kind
        self.type = type_
        self.index = index

    def __str__(self) -> str:
        return f'JSymbol({self.name}, {self.type}, {self.kind}, {self.index})'

    def __eq__(self, __o) -> bool:
        locls = [VarKind.VAR, VarKind.ARGUMENT]
        globls = [VarKind.FIELD, VarKind.STATIC]
        both_local = self.kind in locls and __o.kind in locls
        both_global = self.kind in globls and __o.kind in globls
        same_name = self.name == __o.name
        return (both_local or both_global) and same_name


class JSymbolTable:
    def __init__(self) -> None:
        self.globals: List[JSymbol] = []
        self.locals: List[JSymbol] = []

    def symbols(self) -> List[JSymbol]:
        return self.locals + self.globals

    def start_subroutine(self) -> None:
        """
        Starts a new subroutine scope (i.e., resets the local symbol table).
        """
        self.locals.clear()

    def exists(self, name: str) -> bool:
        return any(sym.name == name for sym in self.locals + self.globals)

    def get(self, name: str) -> JSymbol:
        """
        returns the JSymbol associated with 'name'
        raises an exception if no symbol is found
        """
        for sym in self.locals + self.globals:
            if sym.name == name:
                return sym
        self.error(f'variable {name} not found')

    def define(self, name: str, type_: str, kind: VarKind) -> None:
        """
        Defines a new identifier of the given name, type, and kind,
        and assigns it a running index. STATIC and FIELD identifiers have a class scope,
        while ARG and VAR identifiers have a subroutine scope.
        """
        index = self.var_count(kind)
        new_symbol = JSymbol(name, type_, kind, index)
        if new_symbol in self.symbols():
            self.error(f'{name} is already defined')

        if kind in (VarKind.VAR, VarKind.ARGUMENT):
            self.locals.append(new_symbol)
        else:
            self.globals.append(new_symbol)

    def var_count(self, kind: VarKind) -> int:
        """
        Returns the number of variables of the given kind already defined.
        """
        return len(list(filter(lambda x: x.kind == kind, self.symbols())))

    def kind_of(self, name: str) -> VarKind:
        """ Returns the kind of the named identifier. """
        return self.get(name).kind

    def type_of(self, name: str) -> str:
        """
        Returns the type (int, char, boolean or name of class)
        of the named identifier.
        """
        return self.get(name).type

    def index_of(self, name: str) -> int:
        """ Returns the index assigned to the named identifier. """
        return self.get(name).index

    def error(self, msg: str) -> NoReturn:
        raise JackError(msg)


if __name__ == '__main__':
    s1 = JSymbol('x', 'int', VarKind.VAR, 0)
    s2 = JSymbol('x', 'str', VarKind.VAR, 1)
    s5 = JSymbol('x', 'Point', VarKind.ARGUMENT, 0)
    s6 = JSymbol('x', 'int', VarKind.STATIC, 0)
    s7 = JSymbol('a', 'int', VarKind.VAR, 3)
    s3 = JSymbol('y', 'int', VarKind.VAR, 2)
    s4 = JSymbol('z', 'int', VarKind.FIELD, 0)
    symlist = [s1, s3, s4]
    print(f'{s2 in symlist = } (True)')
    print(f'{s5 in symlist = } (True)')
    print(f'{s6 in symlist = } (False)')
    print(f'{s7 in symlist = } (False)')
