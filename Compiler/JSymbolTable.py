from typing import List, NoReturn
from enum import Enum
from exceptions import JackVariableNotFoundError


class VarKind(Enum):
    VAR = 'var'
    ARGUMENT = 'argument'
    STATIC = 'static'
    FIELD = 'field'
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


class JSymbolTable:
    def __init__(self) -> None:
        self.globals: List[JSymbol] = []
        self.locals: List[JSymbol] = []

    def symbols(self) -> List[JSymbol]:
        return self.globals + self.locals

    def start_subroutine(self) -> None:
        """
        Starts a new subroutine scope
        (i.e., resets the subroutine's
        symbol table).
        """
        self.locals.clear()

    def get(self, name: str) -> JSymbol:
        """helper function to get a symbol by name
        start searching locals first, then globals"""
        for sym in self.locals + self.globals:
            if sym.name == name:
                return sym
        self.error('variable {name} not found')

    def define(self, name: str, type_: str, kind: VarKind) -> None:
        """
        Defines a new identifier of the
        given name, type, and kind,
        and assigns it a running index.
        STATIC and FIELD identifiers
        have a class scope, while ARG
        and VAR identifiers have a
        subroutine scope.
        """
        index = self.var_count(kind)
        new_symbol = JSymbol(name, type_, kind, index)

        if kind in (VarKind.VAR, VarKind.ARGUMENT):
            self.locals.append(new_symbol)
        else:
            self.globals.append(new_symbol)

    def var_count(self, kind: VarKind) -> int:
        """
        Returns the number of
        variables of the given kind
        already defined in the current
        scope.
        """

        var_list = list(filter(lambda x: x.kind == kind, self.symbols()))
        return len(var_list)

    def kind_of(self, name: str) -> VarKind:
        """
        Returns the kind of the named
        identifier in the current scope.
        If the identifier is unknown in
        the current scope, returns
        NONE.
        """
        sym = self.get(name)
        return sym.kind

    def type_of(self, name: str) -> str:
        """
        Returns the type (int, char, boolean or name of class)
        of the named identifier in the current scope.
        """
        sym = self.get(name)
        return sym.type

    def index_of(self, name: str) -> int:
        """
        Returns the index assigned to the named identifier.
        """
        sym = self.get(name)
        return sym.index

    def error(self, msg: str) -> NoReturn:
        raise JackVariableNotFoundError(msg)


if __name__ == '__main__':
    s1 = JSymbol('var1', 'int', VarKind.VAR, 0)
    s2 = JSymbol('var2', 'int', VarKind.VAR, 1)
    s3 = JSymbol('var3', 'int', VarKind.VAR, 2)
    s4 = JSymbol('var1', 'int', VarKind.FIELD, 0)
    l1 = [s1, s2]
    l2 = [s3, s4]
    for sym in l1 + l2:
        print(sym)
