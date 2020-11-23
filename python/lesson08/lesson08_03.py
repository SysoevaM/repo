# Создайте собственный класс-исключение, который должен проверять содержимое списка на наличие только чисел. Проверить
# работу исключения на реальном примере. Необходимо запрашивать у пользователя данные и заполнять список только числами.
# Класс-исключение должен контролировать типы данных элементов списка.

class NotInt(Exception):
    def __init__(self, number):
        self.number = number

    def __str__(self):
        return f"значение \"{self.number}\" не является числом."


# проверка
user_list = []
while True:
    input_number: str = input("Введите число. Для выхода нажмите 'q'")
    if input_number != 'q':
        try:
            if input_number.isnumeric():
                user_list.append(input_number)
            else:
                raise NotInt(input_number)
        except NotInt as err:
            print(f'Ошибка ввода: {err}')
    else:
        break

print(user_list)
