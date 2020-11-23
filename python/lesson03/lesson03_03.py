# Реализовать функцию my_func(), которая принимает три позиционных аргумента, и возвращает сумму
# наибольших двух аргументов.

# функция суммы наибольших 2 аргументов
def my_func(number1, number2, number3):
    result = max(number1, number2) + max(number2, number3)
    return result


try:
    user_number1, user_number2, user_number3 = input("Введите 3 числа для суммирования наибольших 2х "
                                                     "через пробел >>>").split()
    print(f'сумма равна: {my_func(float(user_number1), float(user_number2), float(user_number3))}')
except ValueError:
    print("Введены некорректные данные!")
