

class PyTestFile:
    classVar = "classVar"
    def __init__(self):
        self.one = 1
        self.two = 2
        self.three = 3

    def foo(self):
        print(self.one, self.two, self.three)
    
    @staticmethod
    def staticFoo(message):
        print(classVar)

    @classmethod
    def classFoo(cls, message):
        print(cls.classVar) 
    
if __name__ == '__main__':
    ptf = PyTestFile()
    print(ptf.classVar)
    # ptf.foo()
    ptf.staticFoo("changes class var")
    PyTestFile.classFoo("Changed Class Variable")
    # print(ptf.classVar)
    