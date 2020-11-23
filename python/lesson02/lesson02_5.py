elem = None
rating = []

# Вводим значение и сразу сортируем в нужном порядке
while True:
    elem = input("Введите рейтинг. Для выхода нажмите 'q'. >>>")
    if elem.isdigit() is True and elem != 'q':
        rating.append(int(elem))
        rating.sort(reverse=True)
        print(f'Рейтинг: {rating}')
    # если введенное значние буква q, то навыход
    elif elem.isdigit() is False and elem == 'q':
        break
    # если введенное значние - буква, но не q
    else:
        print("Введено некорректное значение!")
