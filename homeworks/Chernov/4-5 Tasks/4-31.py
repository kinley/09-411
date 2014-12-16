import math


def function_a(x):
    return math.cos(x) + math.sin(x)


def function_b(x):
    return pow(math.e, 2 * x) - pow(math.e, x) - math.log(abs(x) + 1, math.e)*math.cos(x)


def function_c(x):
    return pow(x, 3) + 3 * pow(x, 2) - 1


def worker(a, b, precision, func_using):
    if not func_using(a):
        return func_using(a)
    elif not func_using(b):
        return func_using(b)
    while abs(b - a) > 2 * precision:
        c = (a + b) / 2
        if func_using(c) == 0:
            return c
        if func_using(a) * func_using(c) < 0:
            b = c
        else:
            a = c
    return (a + b) / 2


def main():
    main_precision = 0.0001
    result = worker(math.pi/4, 5 * math.pi/4, main_precision, function_a)
    print('Результат функции a): {0}'.format(result))
    result = worker(0, 1, main_precision, function_b)
    print('Результат функции b): {0}'.format(result))
    result = worker(-3, -2, main_precision, function_c)
    print('Результат функции c-1): {0}'.format(result))
    result = worker(-1, 0, main_precision, function_c)
    print('Результат функции c-2): {0}'.format(result))
    result = worker(0, 1, main_precision, function_c)
    print('Результат функции c-3): {0}'.format(result))

if __name__ == '__main__':
    main()