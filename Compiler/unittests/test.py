


import pytest
import sys
import os
sys.path.append(os.path.abspath("/Users/kyle/Documents/Programming/nand2tetris/Compiler"))
from JSymbolTable import JSymbolTable, IdentifierKind

@pytest.fixture
def table() -> JSymbolTable:
    t = JSymbolTable()
    t.define('var1', 'int', IdentifierKind.VAR)
    t.define('var2', 'str', IdentifierKind.VAR)
    t.define('arg1', 'int', IdentifierKind.ARGUMENT)
    t.define('arg2', 'int', IdentifierKind.ARGUMENT)
    t.define('field1', 'boolean', IdentifierKind.FIELD)
    t.define('field2', 'int', IdentifierKind.FIELD)
    t.define('static1', 'Square', IdentifierKind.STATIC)
    t.define('static2', 'int', IdentifierKind.STATIC)
    t.define('class1', 'Square', IdentifierKind.CLASS)
    t.define('class2', 'Point', IdentifierKind.CLASS)
    t.define('const1', 'int', IdentifierKind.CONSTRUCTOR)
    t.define('const2', 'int', IdentifierKind.CONSTRUCTOR)
    t.define('meth1', 'int', IdentifierKind.METHOD)
    t.define('meth2', 'int', IdentifierKind.METHOD)
    t.define('func1', 'int', IdentifierKind.FUNCTION)
    t.define('func2', 'int', IdentifierKind.FUNCTION)
    return t


def test_var_count(table: JSymbolTable):
    vars = table.var_count(IdentifierKind.VAR)
    args = table.var_count(IdentifierKind.ARGUMENT)
    flds = table.var_count(IdentifierKind.FIELD)
    statics = table.var_count(IdentifierKind.STATIC)
    constructors = table.var_count(IdentifierKind.CONSTRUCTOR)
    meths = table.var_count(IdentifierKind.METHOD)
    funcs = table.var_count(IdentifierKind.FUNCTION)
    classes = table.var_count(IdentifierKind.CLASS)
    assert vars == 2 and args == 2 and flds == 2 and statics == 2 and constructors == 2 and meths == 2 and funcs == 2 and classes == 2


def test_kind_of(table):
    var1_kind = table.kind_of('var1')
    arg2_kind = table.kind_of('arg2')
    field1_kind = table.kind_of('field1')
    static1_kind = table.kind_of('static1')
    clas = table.kind_of('class1')
    const = table.kind_of('const2')
    meth = table.kind_of('meth1')
    func = table.kind_of('func1')
    assert (var1_kind == IdentifierKind.VAR 
            and arg2_kind == IdentifierKind.ARGUMENT 
            and field1_kind == IdentifierKind.FIELD 
            and static1_kind == IdentifierKind.STATIC 
            and clas == IdentifierKind.CLASS
            and const == IdentifierKind.CONSTRUCTOR 
            and meth == IdentifierKind.METHOD 
            and func == IdentifierKind.FUNCTION)


def test_type_of(table):
    var2 = table.type_of('var2')
    arg1 = table.type_of('arg1')
    field1 = table.type_of('field1')
    static1 = table.type_of('static1')
    unknown = table.type_of('unknown')
    clas = table.type_of('class1')
    const = table.type_of('const2')
    meth = table.type_of('meth2')
    func = table.type_of('func2')

    assert (var2 == 'str' and arg1 == 'int' and field1 == 'boolean' 
            and static1 == 'Square' and unknown is None and clas == 'Square'
            and const == 'int' and meth == 'int' and func == 'int')


def test_index_of(table):
    var1 = table.index_of('var1')
    arg2 = table.index_of('arg2')
    field2 = table.index_of('field2')
    static2 = table.index_of('static2')
    unknown = table.index_of('unknown')
    clas = table.index_of('class2')
    const = table.index_of('const2')
    meth = table.index_of('meth2')
    func = table.index_of('func1')
    assert (var1 == 0 and arg2 == 1 and field2 == 1 and static2 == 1 
            and unknown is None and clas == 1 and const == 1 and meth == 1
            and func == 0)
