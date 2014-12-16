# Вычислить надобно нам.
if __name__ == '__main__':
    x = input('Введите число > 0: ')
    x = int(x)
    result = x
    x = pow(x, 2)
    result *= x
    x = pow(x, 4)
    result *= x
    x = pow(x, 2)
    result *= x
    x = pow(x, 2)
    result *= x
    print(result)