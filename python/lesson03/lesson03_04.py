# Программа принимает действительное положительное число x и целое отрицательное число y.
# Необходимо выполнить возведение числа x в степень y. Задание необходимо реализовать в виде
# функции my_func(x, y). При решении задания необходимо обойтись без встроенной функции возведения
# числа в степень.
# Подсказка: попробуйте решить задачу двумя способами. Первый — возведение в степень с помощью
# оператора **. Второй — более сложная реализация без оператора **, предусматривающая использование цикла.


# функция возведения в степень без **
def my_func(x, y):
    result = 1
    for i in range(0, y, -1):
        result *= 1 / x
    return result


try:
    user_number1, user_number2 = input("Введите число и степень >>>").split()

    user_number1 = int(user_number1)
    user_number2 = int(user_number2)

    if user_number2 < 0 and user_number1 > 0:
        print(f'{user_number1} в степени {user_number2} равен:{my_func(user_number1, user_number2)}')
        print(user_number1 ** user_number2)
    else:
        print("Введены некорректные данные! Число, возводимое в степень должно быть положительное, степень числа "
              "должна быть отрицательной!")
except ValueError:
    print("Введены некорректные данные! Число, возводимое в степень должно быть положительное, степень числа "
          "должна быть отрицательной!")