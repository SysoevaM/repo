user_number = int(input("Введите число >>>"))

count = 0
big_number = 0
ten = 10

# начадбное значение -младший разряд
number_current = user_number % ten

# если ввели число < 0, выдаем ошибку
if user_number > 0:

    # бежим по числу, получаем цифру в каждом разряде
    while (user_number // ten) > 0:
        ten = ten * 10
        number_current = user_number % ten // (ten / 10)

        if big_number < number_current:
            big_number = int(number_current)
    print("Самое большое число = " + str(big_number))
else:
    print("Ваше число < 0!")
