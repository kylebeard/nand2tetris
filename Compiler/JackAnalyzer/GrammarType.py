from enum import Enum
from typing import List

from Keywords import TRUE, FALSE, NULL, THIS, INT, CHAR, BOOLEAN
from TokenType import TokenType

# class GrammarType(Enum):
# Program Structure
CLASS_GRAMMAR = 'class'
CLASS_VAR_DEC = 'classVarDec'
# TYPE = 'type'
SUBROUTINE_DEC = 'subroutineDec'
PARAMETER_LIST = 'parameterList'
SUBROUTINE_BODY = 'subroutineBody'
VAR_DEC = 'varDec'
# CLASS_NAME = 'className'
# SUBROUTINE_NAME = 'subroutineName'
# VAR_NAME = 'varName'

# Statements
STATEMENTS = 'statements'
# STATEMENT = 'statement'
LET_STATEMENT = 'letStatement'
IF_STATEMENT = 'ifStatement'
WHILE_STATEMENT = 'whileStatement'
DO_STATEMENT = 'doStatement'
RETURN_STATEMENT = 'returnStatement'

# Expressions
EXPRESSION = 'expression'
TERM = 'term'
# SUBROUTINECALL = 'subroutineCall'
EXPRESSIONLIST = 'expressionList'
# OP = 'symbol'
# UNARYOP = 'symbol'
# KEYWORDCONSTANT = 'keyword'
keyword_constants = [
    TRUE,
    FALSE,
    NULL,
    THIS
]

var_types: List[str | TokenType] = [INT, CHAR, BOOLEAN, TokenType.IDENTIFIER]
unary_ops = ['-', '~']
binary_ops = ['+', '-', '*', '/', '&', '|', '<', '>', '=']
