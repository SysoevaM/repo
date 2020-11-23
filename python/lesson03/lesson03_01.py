#Реализовать функцию, принимающую два числа (позиционные аргументы) и выполняющую их деление.
#Числа запрашивать у пользователя, предусмотреть обработку ситуации деления на ноль.

def division(dividend, divider):
    # проверка делителя на 0
    try:
        result = dividend / divider
        return result
    except ZeroDivisionError:
        print("Делить на 0 нельзя!")


# проверка введенных значений: если не число, то выводим сообщение
try:
    number1, number2 = input("Введите числа для деления через пробел >>>").split()
    print(f'{number1} : {number2} = {division(float(number1), float(number2))}')
except ValueError:
    print("Числа для деления не были введены!")
