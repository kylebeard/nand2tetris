

import pytest
import sys
import os
sys.path.append(os.path.abspath(
    "/Users/kyle/Documents/Programming/nand2tetris/Compiler"))

from JSymbolTable import JSymbolTable, VarKind  # NOQA: E402


@pytest.fixture
def table() -> JSymbolTable:
    t = JSymbolTable()
    t.define('var1', 'int', VarKind.VAR)
    t.define('var2', 'str', VarKind.VAR)
    t.define('arg1', 'int', VarKind.ARGUMENT)
    t.define('arg2', 'int', VarKind.ARGUMENT)
    t.define('field1', 'boolean', VarKind.FIELD)
    t.define('field2', 'int', VarKind.FIELD)
    t.define('static1', 'Square', VarKind.STATIC)
    t.define('static2', 'int', VarKind.STATIC)
    return t


def test_var_count(table: JSymbolTable):
    vars = table.var_count(VarKind.VAR)
    args = table.var_count(VarKind.ARGUMENT)
    flds = table.var_count(VarKind.FIELD)
    statics = table.var_count(VarKind.STATIC)
    assert vars == 2 and args == 2 and flds == 2 and statics == 2


def test_kind_of(table):
    var1_kind = table.kind_of('var1')
    arg2_kind = table.kind_of('arg2')
    field1_kind = table.kind_of('field1')
    static1_kind = table.kind_of('static1')
    assert (var1_kind == VarKind.VAR
            and arg2_kind == VarKind.ARGUMENT
            and field1_kind == VarKind.FIELD
            and static1_kind == VarKind.STATIC)


def test_type_of(table):
    var2 = table.type_of('var2')
    arg1 = table.type_of('arg1')
    field1 = table.type_of('field1')
    static1 = table.type_of('static1')

    assert (var2 == 'str' and arg1 == 'int' and field1 == 'boolean'
            and static1 == 'Square')


def test_index_of(table):
    var1 = table.index_of('var1')
    arg2 = table.index_of('arg2')
    field2 = table.index_of('field2')
    static2 = table.index_of('static2')
    assert (var1 == 0 and arg2 == 1 and field2 == 1 and static2 == 1)
