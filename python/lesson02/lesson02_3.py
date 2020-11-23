season = {'winter': [12, 1, 2], 'spring': [3, 4, 5], 'summer': [6, 7, 8], 'autumn': [9, 10, 11]}

month_user = int(input("Введите номер месяца от 1 до 12, чтобы узнать время года >>> "))

# проверяем введенное значение
if month_user < 0 or month_user > 12:
    print("Введенное значение не корректно!")
else:
    # пробегаем по сезонам из словаря
    for i in season:
        # проверяем вхождение месяца
        if month_user in season[i]:
            print(i)
            break
