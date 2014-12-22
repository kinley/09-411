def prime_word_finder(to_number):
    """
    to_number - число, до которого проверяем, не включая.
    Вовзращает массив.
    ----------------------------------------------------------------------------------------------
    result_arr[2:] создает новый объект, по которому и бежит i, поэтому можно не проверять i > 0
    """
    result_arr = list(range(to_number))
    result_arr[1] = 0  # Для того, чтобы в генераторе при return не создавать новый объект result_arr[2:].
    for i in result_arr[2:]:
        for j in range(2 * i, to_number, i):
            result_arr[j] = 0
    return [item for item in result_arr if item != 0]


if __name__ == '__main__':
    number = int(input('Введите число, не включая: '))
    print(prime_word_finder(number))
