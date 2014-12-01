# Вычислить надобно нам.
if __name__ == '__main__':
    x = input('Введите число > 0: ')
    if not x.isdigit() or int(x) < 0:
        print('Не то число.')
    else:
        x = int(x)
        z_1 = x ** 2
        z_2 = z_1 ** 4
        z_3 = z_2 ** 2
        z_4 = z_3 ** 2
        print(x * z_1 * z_2 * z_3 * z_4)
        print(x ** 59)
