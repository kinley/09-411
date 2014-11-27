# Открывает и сортирует словарь
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


# Проверяет вхождение слова во множество букв (не использовал множества,
# так как не учитываются повторения, например, нн)
def find_word(temp_word, temp_set_of_words):
    flag = True
    for character in temp_word:
        flag = True
        for item_1 in temp_set_of_words:
            if character == item_1:
                temp_set_of_words.remove(item_1)
                flag = False
                break
        if flag:
            break
    return flag


if __name__ == "__main__":
    main_dictionary = dictionary_helper("slovar.txt")
    set_of_words = []
    good_words = []
    number_of_digit = 0
    while True:
        while True:
            number_of_digit = input("Введите число доступных букв: ")
            if number_of_digit.isdigit():
                number_of_digit = int(number_of_digit)
                break
            else:
                print("Введите число, а не букву или символ!")
        set_of_words = list(input("Введите множество букв: ").strip().lower().replace(" ", ""))
        break
    if number_of_digit not in main_dictionary:
        print('В словаре нет нужных слов!')
        exit(1)
    for item in main_dictionary[number_of_digit]:
        if not find_word(item, set_of_words[:]):
            good_words.append(item)
    print(good_words)
    input('Тыкните любую кнопку.')