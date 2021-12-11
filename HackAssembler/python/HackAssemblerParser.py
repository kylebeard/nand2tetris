
class HackAsseblerParser:
    '''
    Takes in an instruction for the hack assembly language 
    and splits it into it's component values

    author: Kyle Beard
    date: 12/3/19

    There are two types of instructions in the hack assembly language:
    A-instructions : @decimalValue
    C-instructions : destination = computation ; jumpCondition
    For C-instructions the destination and jumpCondition values are optional, 
    you can have one or the other, or both, but not neither. So in addition to the format above
    you can write: 
        destination = computation  or
        computation ; jumpCondition
    '''

    def __init__(self):
        pass

    