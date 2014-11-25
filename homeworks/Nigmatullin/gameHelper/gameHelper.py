f = open('dictionary.txt', 'r')

letters = ['а', 'б', 'а', 'к', 'а', 'б']

len_word = 5
flag = True
isPresent = False
lines = f.readlines()

for word in lines:
    word = word.strip()
    if len(word) != len_word:
        continue

    letters_temp = []
    letters_temp.extend(letters)

    flag = True

    for char in word:
        if letters_temp.count(char) > 0:
            letters_temp.remove(char)
        else:
            flag = False
            break

    if flag == True:
        isPresent = True
        print (word)

if isPresent == False:
    print('Нету')
f.close()