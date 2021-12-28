
def decorator(fn):
    def wrapper(x, y):
        print('before')
        fn(x, y)
        print('after')

    return wrapper


@decorator
def regular(x, y):
    print(x, y)


regular(1, 2)
