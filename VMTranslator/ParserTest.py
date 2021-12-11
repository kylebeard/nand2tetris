from VMParser import Parser
proj8Path = '/Users/kyle/Documents/Programming/nand2tetris/projects/08'
basic = f'{proj8Path}/ProgramFlow/BasicLoop/BasicLoop.vm'
fib = f'{proj8Path}/ProgramFlow/FibonacciSeries/FibonacciSeries.vm'
with open(fib, 'r') as file:
    parser = Parser(file)
    print(parser.current_command)
    hasmore = parser.has_more_commands()
    print(hasmore)
    while parser.has_more_commands():
        parser.advance()
        print(parser.current_command)
        t = parser.command_type()
        a1 = parser.arg1()
        a2 = parser.arg2()
        print(f'{t} {a1} {a2}')
        print('')


# class TestStatisticalFunctions(unittest.TestCase):


# unittest.main()  # Calling from the command line invokes all tests
