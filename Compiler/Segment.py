from enum import Enum


class Segment(Enum):
    Constant = 'constant'
    Local = 'local'
    Argument = 'argument'
    This = 'this'
    That = 'that'
    Pointer = 'pointer'
    Temp = 'temp'
    Static = 'static'
    # values = [constant, local, argument, this, that, pointer, temp,
    #   static]
