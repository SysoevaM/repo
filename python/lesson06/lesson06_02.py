# Реализовать класс Road (дорога), в котором определить атрибуты: length (длина), width (ширина).
# Значения данных атрибутов должны передаваться при создании экземпляра класса. Атрибуты сделать защищенными.
# Определить метод расчета массы асфальта, необходимого для покрытия всего дорожного полотна. Использовать формулу:
# длина*ширина*масса асфальта для покрытия одного кв метра дороги асфальтом, толщиной в 1 см*число см толщины полотна.
# Проверить работу метода.

class Road:
    _length: float
    _width: float

    def __init__(self, length: float, width: float):
        self._length = length
        self._width = width

    def weight_asphalt(self, weight: float, thickness: float):
        return self._width * self._length * weight * thickness


# тестирование метода рассчеа массы асфальта
user_weigh: float = 600
user_length: float = 1000
user_width: float = 10
user_thickness: float = 6

user_weight_asphalt = Road(user_length, user_width)

print(f'Масса всего полотна дороги равна: {user_weight_asphalt.weight_asphalt(user_weigh, user_thickness)} кг')
