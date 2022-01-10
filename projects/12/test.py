
twoToThe = [1]
for i in range(1, 16):
    twoToThe.append(twoToThe[i - 1] + twoToThe[i - 1])
print(twoToThe)
# 5 101 7 111 53 110>1<01 49 110001


def bit(x, i):
    return (x & twoToThe[i]) == twoToThe[i]


def mult(x, y):
    summ = 0
    i = 0
    shiftedX = x
    while i < 16:
        if bit(y, i):
            summ += shiftedX
        shiftedX += shiftedX
        i += 1
    return summ


print(mult(36, 12))
print(36 * 12)
"""
 function int multiply(int x, int y) {
        var int sum, i;
        var int shiftedX;
        let i = 0;
        let shiftedX = x;
        // 0000000000000010
        while (i < 16){
            if (Math.bit(y, i)) {
                let sum = sum + shiftedX;
            }
            let shiftedX = shiftedX + shiftedX;
        }
        return sum;
    }

"""
