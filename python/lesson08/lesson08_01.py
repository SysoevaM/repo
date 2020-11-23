# Реализовать класс «Дата», функция-конструктор которого должна принимать дату в виде строки формата «день-месяц-год».
# В рамках класса реализовать два метода. Первый, с декоратором @classmethod, должен извлекать число, месяц, год и
# преобразовывать их тип к типу «Число». Второй, с декоратором @staticmethod, должен проводить валидацию числа, месяца
# и года (например, месяц — от 1 до 12). Проверить работу полученной структуры на реальных данных.

dict_month = {1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30,
              12: 31}


class Date:
    date: str

    def __init__(self, date: str):
        self.date = date

    @classmethod
    def date_int(cls, content):
        try:
            list_date = [int(el) for el in str(content.date).split("-")]
            return list_date
        except ValueError:
            return f"Передано некорректное значение!"

    @staticmethod
    def validate(check_date: list):
        if check_date[2] > 0:
            days = dict_month.get(check_date[1])
            if days is not None:
                if check_date[0] < 0 or check_date[0] > days and check_date[2] % 4 != 0:
                    print(f"В месяце {check_date[1]} количество дней должно быть от 1 до {days} дней.")
                    return False
                elif check_date[0] < 0 or check_date[0] > days + 1 and check_date[1] == 2 and check_date[2] % 4 == 0:
                    print(f"В месяце {check_date[1]} количество дней должно быть от 1 до {days + 1} дней.")
                    return False
                else:
                    return True
            else:
                print(f"Введенный месяц некорректен. Значение должно быть от 1 до 12.")
                return False
        else:
            print(f"Введенный год меньше 0.")
            return False


# проверка
user_date = Date("30-02-2020")
user_date_int = Date.date_int(user_date)

print(user_date_int)

print(Date.validate(user_date_int))
