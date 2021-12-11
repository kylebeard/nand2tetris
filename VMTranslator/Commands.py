""" Classes for defining types of VM commands """

from enum import Enum, unique


@unique
class CommandType(Enum):
    """ VM Command Types """
    ARITHMETIC = "arithmetic"
    PUSH = "push"
    POP = "pop"
    LABEL = "label"
    GOTO = 'goto'
    IF_GOTO = 'if-goto'
    FUNCTION = 'function'
    RETURN = 'return'
    CALL = 'call'

    @classmethod
    def getCommandType(cls, cmd: str) -> 'CommandType':
        if cmd in Arithmetic.values:
            return cls.ARITHMETIC

        match cmd:
            case cls.PUSH.value: return cls.PUSH
            case cls.POP.value: return cls.POP
            case cls.LABEL.value: return cls.LABEL
            case cls.GOTO.value: return cls.GOTO
            case cls.IF_GOTO.value: return cls.IF_GOTO
            case cls.FUNCTION.value: return cls.FUNCTION
            case cls.RETURN.value: return cls.RETURN
            case cls.CALL.value: return cls.CALL


# command_map = {
#     CommandType.PUSH.value: CommandType.PUSH,
#     CommandType.POP.value: CommandType.POP,
#     CommandType.LABEL.value: CommandType.LABEL,
#     CommandType.GOTO.value: CommandType.GOTO,
#     CommandType.IF_GOTO.value: CommandType.IF_GOTO,
#     CommandType.FUNCTION.value: CommandType.FUNCTION,
#     CommandType.RETURN.value: CommandType.RETURN,
#     CommandType.CALL.value: CommandType.CALL
# }


class Arithmetic():
    ADD = "add"  # done
    SUB = "sub"  # done
    NEG = "neg"  # done
    EQ = "eq"  # done
    GT = "gt"  # done
    LT = "lt"  # done
    AND_ = "and"  # done
    NOT_ = "not"  # done
    OR_ = "or"  # done
    values = [ADD, SUB, NEG, EQ, GT, LT, AND_, NOT_, OR_]


if __name__ == "__main__":
    cmd = 'eq'
    cmd_t = CommandType.getCommandType(cmd)
    print(cmd_t)
