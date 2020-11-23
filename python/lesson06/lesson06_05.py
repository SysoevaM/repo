# Реализовать класс Stationery (канцелярская принадлежность). Определить в нем атрибут title (название) и метод draw
# (отрисовка). Метод выводит сообщение “Запуск отрисовки.” Создать три дочерних класса Pen (ручка), Pencil (карандаш),
# Handle (маркер). В каждом из классов реализовать переопределение метода draw. Для каждого из классов метод должен
# выводить уникальное сообщение. Создать экземпляры классов и проверить, что выведет описанный метод для каждого
# экземпляра.

# базовый класс
class Stationery:
    title: str

    def draw(self):
        print('Запуск отрисовки.')


class Pen(Stationery):

    def __init__(self):
        self.title = "pen"

    def draw(self):
        print(f'Запуск отрисовки {self.title}')


class Pencil(Stationery):

    def __init__(self):
        self.title = "pencil"

    def draw(self):
        print(f'Запуск карандашной отрисовки {self.title}')


class Handle(Stationery):

    def __init__(self):
        self.title = "handle"

    def draw(self):
        print(f'Запуск маркерной отрисовки {self.title}')


# создание экземпляров и вызов переопределенных методов
user_class1 = Pen()
user_class1.draw()

user_class2 = Pencil()
user_class2.draw()

user_class3 = Handle()
user_class3.draw()
