# Начните работу над проектом «Склад оргтехники». Создайте класс, описывающий склад. А также класс «Оргтехника»,
# который будет базовым для классов-наследников. Эти классы — конкретные типы оргтехники (принтер, сканер, ксерокс).
# В базовом классе определить параметры, общие для приведенных типов. В классах-наследниках реализовать параметры,
# уникальные для каждого типа оргтехники.
#
# Продолжить работу над первым заданием. Разработать методы, отвечающие за приём оргтехники на склад и передачу в
# определенное подразделение компании. Для хранения данных о наименовании и количестве единиц оргтехники, а также
# других данных, можно использовать любую подходящую структуру, например словарь
#
# Продолжить работу над вторым заданием. Реализуйте механизм валидации вводимых пользователем данных. Например, для
# указания количества принтеров, отправленных на склад, нельзя использовать строковый тип данных.

# обработка исключения нехватки места на складе

class NotPlaces(Exception):
    def __init__(self, brand: str, type_oe: str, quantity: int, quantity_places: int):
        self.quantity = quantity
        self.quantity_places = quantity_places
        self.brand = brand
        self.type = type_oe

    def __str__(self):
        return f'Не достаточно места на складе для {self.type} {self.brand}. Осталось: {self.quantity_places}, ' \
               f'требуется: {self.quantity}'


# обработка исключения техники для передачи со склада в подразделение
class NotQuantity(Exception):
    def __init__(self, brand: str, type_oe: str, quantity: int, need_quantity: int):
        self.quantity = quantity if quantity is not None else 0
        self.need_quantity = need_quantity
        self.brand = brand
        self.type = type_oe

    def __str__(self):
        return f'Недостаточное количество на складе {self.type} {self.brand}. Осталось: {self.quantity}, требуется: {self.need_quantity}'


# ошибка валидации
class NotInt(Exception):
    def __init__(self, value, cls):
        self.value = value
        self.cls = cls

    def __str__(self):
        return f"значение \"{self.value}\" не является типом \"{self.cls}\"."


# базовый класс оргтехники
class OfficeEquipment:
    brand: str

    def __init__(self, brand: str):
        self.brand = brand


# дочерний класс Printer
class Printer(OfficeEquipment):
    type = "принтер"

    def __init__(self, brand: str):
        super().__init__(brand)


# дочерний класс Scanner
class Scanner(OfficeEquipment):
    type = "сканер"

    def __init__(self, brand: str):
        super().__init__(brand)


# дочерний класс Xerox
class Xerox(OfficeEquipment):
    type = "ксерокс"

    def __init__(self, brand: str):
        super().__init__(brand)


# класс подразделение
class Subdivision:
    dict_off_eq: dict

    def __init__(self, subdivision: str):
        self.name = subdivision
        self.dict_off_eq = {}

    # печать остатков
    def __repr__(self):
        dict_new: dict = {}
        for key, value in self.dict_off_eq.items():
            key_new = key.type + " \"" + key.brand + "\""
            dict_new.update({key_new: value})
        return f"{dict_new}"


# класс склада
"""Класс склада
   :param max_places: максимальное количество мест на складе
   :param places: свободное место
   :param dit_off_eq: словарь с оргтехникой и количеством на складе"""


class Stock:
    def __init__(self, max_places=0):
        self.max_places = max_places
        self.places = max_places
        self.dict_off_eq = {}

    # печать остатков
    def __repr__(self):
        dict_new: dict = {}
        for key, value in self.dict_off_eq.items():
            key_new = "" + key.type + " \"" + key.brand + "\""
            dict_new.update({key_new: value})
        return f"{dict_new}"

    # размещение на складе
    def place(self, dict_off_eq: dict):

        for key, value in dict_off_eq.items():

            # проверка типа количества
            if not isinstance(value, int):
                raise NotInt(value, "int")

            # проверка мест на складе. Для простоты  откатываем размещение позиции полностью, если для нее
            # не хватает места на складе
            elif int(value) > self.places:
                raise NotPlaces(key.brand, key.type, int(value), self.places)

            # размещение на складе
            else:
                # пересчет на складе
                value += self.dict_off_eq.get(key) if self.dict_off_eq.get(key) is not None else 0
                self.dict_off_eq.update({key: value})

                # пересчет мест на складе
                self.places -= value

    # передача техники в подразделение
    def addItem(self, org_sub_off_eq: dict, subdivision: Subdivision):

        for key, value in org_sub_off_eq.items():

            # проверка количества на складе. Для простоты откатываем перемещение позиции полностью, если на складе
            # недостаточное количество
            if self.dict_off_eq.get(key) is None or int(value) > self.dict_off_eq.get(key):
                raise NotQuantity(key.brand, key.type, self.dict_off_eq.get(key), int(value))
            else:
                value += subdivision.dict_off_eq.get(key) if subdivision.dict_off_eq.get(key) is not None else 0

                # перемещение в подразделение
                subdivision.dict_off_eq.update({key: value})

                # пересчет на складе
                self.dict_off_eq.update({key: (self.dict_off_eq.get(key) - value)}) if self.dict_off_eq.get(
                    key) - value != 0 else self.dict_off_eq.pop(key)

                # пересчет мест на складе
                self.places += value


printer1 = Printer("Epson")
printer2 = Printer("Samsung")
xerox1 = Xerox("Epson")
subdivision1 = Subdivision("Managers")

stock = Stock(10)

try:
    stock.place({printer1: 1, printer2: 2, xerox1: 3})
except NotPlaces as err1:
    print(
        f'Не достаточно места на складе для {err1.type} {err1.brand}. Осталось: {err1.quantity_places}, требуется: {err1.quantity}')
except NotInt as err2:
    print(f"Ошибка валидации: начение \"{err2.value}\" не является типом \"{err2.cls}\".")

print(f'Количество на складе до передачи: {stock}')

print(f'Количество свободных мест на складе:{stock.places}\n')

try:
    stock.addItem({printer1: 1, printer2: 1}, subdivision1)
    stock.addItem({xerox1: 1}, subdivision1)
except NotQuantity as err:
    print(
        f'Недостаточное количество на складе {err.type} {err.brand}. Осталось: {err.quantity}, требуется: {err.need_quantity}')

print(f'Количество на складе после передачи: {stock}')

print(f'Техника в подразделении: {subdivision1}')

print(f'Количество свободных мест на складе: {stock.places}')
