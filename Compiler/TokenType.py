from enum import Enum


class TokenType(Enum):
    KEYWORD = 'keyword'
    SYMBOL = 'symbol'
    IDENTIFIER = 'identifier'
    INT_CONST = 'integerConstant'
    STR_CONST = 'stringConstant'
    NONE = ''
