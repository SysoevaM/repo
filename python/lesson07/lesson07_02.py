# Реализовать проект расчета суммарного расхода ткани на производство одежды. Основная сущность (класс) этого проекта —
# одежда, которая может иметь определенное название. К типам одежды в этом проекте относятся пальто и костюм. У этих
# типов одежды существуют параметры: размер (для пальто) и рост (для костюма). Это могут быть обычные числа: V и H,
# соответственно.
# Для определения расхода ткани по каждому типу одежды использовать формулы: для пальто (V/6.5 + 0.5), для костюма
# (2*H + 0.3). Проверить работу этих методов на реальных данных.
# Реализовать общий подсчет расхода ткани. Проверить на практике полученные на этом уроке знания: реализовать
# абстрактные классы для основных классов проекта, проверить на практике работу декоратора @property.

from abc import ABC, abstractmethod


# базовый класс
class Clothes(ABC):
    _name = "clothes"

    @abstractmethod
    def consumption(self):
        pass


# класс пальто
class Coat(Clothes):
    _name = "coat"

    def __init__(self, size: int):
        self.size = size

    # расчет расхода ткани
    @property
    def consumption(self):
        return round(self.size / 6.5 + 0.5, 2)

    # сложение расходов разных экземпляров
    def __add__(self, other):
        return round(self.consumption + other.consumption, 2)


# класс костюма
class Costume(Clothes):
    _name = "costume"

    def __init__(self, growth: int):
        self.growth = growth

    # расчет расхода ткани
    @property
    def consumption(self):
        return 2 * self.growth + 0.3

    # сложение расходов разных экземпляров
    def __add__(self, other):
        return round(self.consumption + other.consumption, 2)


# проверка методов
user_size = 50
cloth_coat = Coat(user_size)

print(f'Расход ткани на пальто при {user_size} размере: {cloth_coat.consumption}')

user_growth = 5
cloth_costume = Costume(user_growth)

print(f'Расход ткани на костюм при росте {user_growth}: {cloth_costume.consumption}')

print(f'Общий расход ткани: {cloth_coat + cloth_costume}')
