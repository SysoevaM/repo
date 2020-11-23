start_distance = float(input("Введите дистанцию в км за первую пробежку >>>"))
final_distance = float(input("Введите дистанцию в км, которую хотите пробегать >>>"))

distance = start_distance
count = 1

if final_distance < start_distance:
    print("Вы пробежали в первый день больше, чем хотели. Результат достигнут!")
elif final_distance == start_distance:
    print("Вы пробежали в первый день столько, сколько хотели. Результат достигнут!")
# если нужны дальнейшие тренировки
else:
    while True:
        print(str(count) + "-ый день: " + str(round(distance, 2)))

        # проверяем, достигнут ли результат
        if distance // final_distance < 1:

            # ежедневное наращивание результата
            distance = distance * 1.1
            count += 1
        else:
            print("Ответ: на {0}-ый день спортсмен достиг не менее {1} км".format(str(count), str(round(final_distance, 2))))
            exit()
