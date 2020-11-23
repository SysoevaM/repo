proceeds = int(input("Введите выручку фирмы >>>"))
spending = int(input("Введите издержки фирмы >>>"))

# определяем прибыль
if proceeds - spending > 0:

    # считаем рентабельность
    profitability: float = (proceeds - spending) / proceeds

    print("Поздравляю, в фирме больше рибыли! Рентабельность составляет: " + str(profitability))

    # считаем прибыль на одно сотрудника
    count_clerk = int(input("Введите численность сотрудников >>>"))

    profit_clerk: float = (proceeds - spending) / count_clerk

    print("Прибыль фирмы в расчете на одного сотрудника составляет: " + str(profit_clerk))

elif proceeds - spending == 0:
    print("К сожалению, выручка равна издержкам фирмы. Фирма находится на гране банкротства!")
else:
    print("К сожалению, выручка меньше издержек. Возможно стоит подумать о банкротстве!")
