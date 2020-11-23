# Реализовать проект «Операции с комплексными числами». Создайте класс «Комплексное число», реализуйте перегрузку
# методов сложения и умножения комплексных чисел. Проверьте работу проекта, создав экземпляры класса (комплексные
# числа) и выполнив сложение и умножение созданных экземпляров. Проверьте корректность полученного результата.


# ошибка валидации
class NotFloat(Exception):
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return f"значение \"{self.value}\" не является типом float."


# комплексные числа x + iy
class ComplexNumber:
    def __init__(self, xy: list):
        if isinstance(xy[0], str):
            raise NotFloat(xy[0])
        elif isinstance(xy[1], str):
            raise NotFloat(xy[1])
        else:
            self.x = xy[0]
            self.y = xy[1]

    # сложение
    def __add__(self, other):
        return ComplexNumber([self.x + other.x, self.y + other.y])

    # вычитание
    def __sub__(self, other):
        return ComplexNumber([self.x - other.x, self.y - other.y])

    # умножение
    def __mul__(self, other):
        return ComplexNumber([self.x * other.x - self.y * other.y, self.y * other.x + self.x * other.y])

    # печать
    def __str__(self):
        if self.y < 0:
            return f"{self.x} - {abs(self.y)}i"
        elif self.y == 0:
            return f"{self.x}"
        else:
            return f"{self.x} + {self.y}i"


# проверка
num1 = [1, "л"]
num2 = [2, -1]
num3 = [2, 1]
num4 = [3, 2]

try:
    # complex_num1 = ComplexNumber(num1)
    complex_num2 = ComplexNumber(num2)
    complex_num3 = ComplexNumber(num3)
    complex_num4 = ComplexNumber(num4)
    complex_num5 = complex_num3 + complex_num2
    complex_num6 = complex_num3 * complex_num4

    print(f'Сложение: ({complex_num3}) + ({complex_num2}) = {complex_num5}')
    print(f'Умножение:({complex_num3}) * ({complex_num4}) = {complex_num6}')
except NotFloat as err:
    print(err)
