def dictionary_helper(file_name):
    temp_dictionary = {}
    with open(file_name, "r", encoding="utf-8-sig") as file:
        for line in file:
            word = line.strip().lower()
            if len(word) not in temp_dictionary:
                temp_dictionary[len(word)] = []
                temp_dictionary[len(word)].append(word)
            else:
                temp_dictionary[len(word)].append(word)
    return temp_dictionary


def check_word_in_list(temp_word, temp_set_of_words):
    for character in temp_word:
        for item_1 in temp_set_of_words:
            if character == item_1:
                temp_set_of_words.remove(item_1)
                break
        else:
            return False
    return True


# Проверка, является ли строчка числом.
# Хотя, можно было проверить через метод строчки isdigit(), что меньше по количеству строчек кода, но одна
# лишняя операция.
def represents_int(string_to_convert):
    try:
        result_value = int(string_to_convert)
        return result_value
    except ValueError:
        return None

# Циклов do...while в Питоне нет.
if __name__ == "__main__":
    main_dictionary = dictionary_helper("slovar.txt")  # Распределение слов по длине один раз.
    list_of_words = []
    number_of_digit = 0
    while True:
        good_words = []
        while True:
            number_of_digit = represents_int(input('Введите число доступных букв: ').strip())
            if number_of_digit:
                print(number_of_digit)
                break
            else:
                print("Введите число, а не букву или символ!")
        list_of_words = list(input("Введите множество букв: ").strip().lower().replace(" ", ""))
        if number_of_digit not in main_dictionary:
            print('В словаре нет нужных слов.')
        else:
            good_words = [item for item in main_dictionary[number_of_digit] if check_word_in_list(item, list_of_words[:])]
            print(good_words)
        if input('Продолжить? (y/n)').strip().lower() == 'n':
            break
    input('Тыкните любую кнопку.')