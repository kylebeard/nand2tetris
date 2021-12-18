

from typing import List


class Keywords():
    CLASS = 'class'
    CONSTRUCTOR = 'constructor'
    FUNCTION = 'function'
    METHOD = 'method'
    FIELD = 'field'
    STATIC = 'static'
    VAR = 'var'
    INT = 'int'
    CHAR = 'char'
    BOOLEAN = 'boolean'
    VOID = 'void'
    TRUE = 'true'
    FALSE = 'false'
    NULL = 'null'
    THIS = 'this'
    LET = 'let'
    DO = 'do'
    IF = 'if'
    ELSE = 'else'
    WHILE = 'while'
    RETURN = 'return'

    allKeywords = [
        CLASS,
        CONSTRUCTOR,
        FUNCTION,
        METHOD,
        FIELD,
        STATIC,
        VAR,
        INT,
        CHAR,
        BOOLEAN,
        VOID,
        TRUE,
        FALSE,
        NULL,
        THIS,
        LET,
        DO,
        IF,
        ELSE,
        WHILE,
        RETURN
    ]


if __name__ == '__main__':
    s = 'if'
    print(s in Keywords.allKeywords)
