from enum import Enum


class Segment(Enum):
    constant = 'constant'
    local = 'local'
    argument = 'argument'
    this = 'this'
    that = 'that'
    pointer = 'pointer'
    temp = 'temp'
    static = 'static'
    # values = [constant, local, argument, this, that, pointer, temp,
    #   static]
