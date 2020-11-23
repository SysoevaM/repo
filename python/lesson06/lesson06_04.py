# Реализуйте базовый класс Car. У данного класса должны быть следующие атрибуты: speed, color, name, is_police (булево).
# А также методы: go, stop, turn(direction), которые должны сообщать, что машина поехала, остановилась, повернула
# (куда).Опишите несколько дочерних классов: TownCar, SportCar, WorkCar, PoliceCar. Добавьте в базовый класс метод
# show_speed, который должен показывать текущую скорость автомобиля. Для классов TownCar и WorkCar переопределите метод
# show_speed. При значении скорости свыше 60 (TownCar) и 40 (WorkCar) должно выводиться сообщение о превышении скорости.
# Создайте экземпляры классов, передайте значения атрибутов. Выполните доступ к атрибутам, выведите результат.
# Выполните вызов методов и также покажите результат.

# базовый класс
class Car:
    speed: int
    color: str
    name: str
    is_police: bool

    def __init__(self, name, color, is_police):
        self.speed = 0
        self.color = color
        self.name = name
        self.is_police = is_police

    def go(self, speed):
        print("Вперед.")
        self.speed = speed

    def stop(self):
        print("Стоп.")
        self.speed = 0

    def turn(self, direction, speed):
        print(f"Поворот {direction}.")
        self.speed = speed

    def show_speed(self):
        print(f'Скорость: {self.speed} км/ч')

    def attr_car(self):
        print(f'Название: {self.name}\nЦвет: {self.color}\nПолицейская машина: {"да" if self.is_police == True else "нет"}')


# дочерний TownCar
class TownCar(Car):
    def __init__(self, name, color):
        super().__init__(name, color, 0)

    def show_speed(self):
        print(f'Превышена скорость на {self.speed - 60} км/ч! Текущая скорость: {self.speed} км/ч') if self.speed > 40 else print(f'Скорость: {self.speed} км/ч')


# дочерний WorkCar
class WorkCar(Car):
    def __init__(self, name, color):
        super().__init__(name, color, 0)

    def show_speed(self):
        print(f'Превышена скорость на {self.speed - 40} км/ч! Текущая скорость: {self.speed} км/ч') if self.speed > 40 else print(f'Скорость: {self.speed} км/ч')


# дочерний SportCar
class SportCar(Car):
    def __init__(self, name, color):
        super().__init__(name, color, 0)


class PoliceCar(Car):
    def __init__(self, name, color):
        super().__init__(name, color, 1)


# тестирование методов класса TownCar
car_1 = TownCar("WV", "red")
print(f'Городская машина:')
car_1.attr_car()
car_1.go(90)
car_1.turn("налево", 60)
car_1.go(80)
car_1.show_speed()
car_1.stop()

# тестирование методов класса SportCar
car_2 = SportCar("Maserati", "white")
print(f'\nСпорткар:')
car_2.attr_car()
car_2.go(200)
car_2.turn("направо", 80)
car_2.go(200)
car_2.show_speed()
car_2.stop()

# тестирование методов класса WorkCar
car_3 = WorkCar("peugeot", "black")
print(f'\nРабочая машина:')
car_3.attr_car()
car_3.go(60)
car_3.turn("налево", 40)
car_3.turn("направо", 50)
car_3.stop()
car_3.show_speed()

# тестирование методов класса PoliceCar
car_4 = PoliceCar("ford", "white")
print(f'\nПолицейская машина:')
car_4.attr_car()
car_4.go(50)
car_4.turn("направо", 40)
car_4.turn("налево", 40)
car_4.show_speed()
car_4.stop()
