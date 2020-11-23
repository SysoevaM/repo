# Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных пробелами.
# Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.


def create_file(name_file, text):
    """Запись данных в файл
       :param name_file: имя файла
       :param text: список значений для записи"""

    with open(name_file, "w") as f_obj:
        f_obj.writelines(' '.join(text))
        f_obj.close()


def sum_el_file(name_file):
    """Подсчет суммы всех чисел из файла
           :param name_file: имя файла"""

    with open(name_file) as f_out:
        list_mun = f_out.read().split()
        result = 0

        # подсчет суммы
        try:
            for el in list_mun:
                result += float(el)
        except ValueError:
            print('Сумма не может быть посчитана, т.к. набор значений содержит в себе нечисловое значение.')

        f_out.close()
    return round(result, 2)


user_text = input('Введите числа для записи >>> ').split()
create_file("les05_05.txt", user_text)
print(f'Сумма всех чисел = {sum_el_file("les05_05.txt")}')
