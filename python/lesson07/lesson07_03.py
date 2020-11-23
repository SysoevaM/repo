# Реализовать программу работы с органическими клетками, состоящими из ячеек. Необходимо создать класс Клетка.
# В его конструкторе инициализировать параметр, соответствующий количеству ячеек клетки (целое число). В классе
# должны быть реализованы методы перегрузки арифметических операторов: сложение (add()), вычитание (sub()), умножение
# (mul()), деление (truediv()). Данные методы должны применяться только к клеткам и выполнять увеличение, уменьшение,
# умножение и целочисленное (с округлением до целого) деление клеток, соответственно.

class Cell:
    def __init__(self, quantity: int):
        self.quantity = quantity

    # вывод ячеек для заданного количества в ряду
    def make_order(self, quantity_row: int):
        s = ''
        for i in range(1, self.quantity + 1):
            s = s + '*\n' if i % quantity_row == 0 else s + '*'
        return s

    # сложение клеток
    def __add__(self, other):
        if isinstance(other, type(self)):
            return self.quantity + other.quantity
        else:
            return f'Ошибка!'

    # вычитание клеток
    def __sub__(self, other):
        if isinstance(other, type(self)):
            return self.quantity - other.quantity if self.quantity - other.quantity > 0 else f'Ошибка!'

        else:
            return f'Ошибка!'

    # умножение клеток
    def __mul__(self, other):
        if isinstance(other, type(self)):
            return self.quantity * other.quantity
        else:
            return f'Ошибка!'

    # деление клеток
    def __truediv__(self, other):
        if isinstance(other, type(self)):
            return round(self.quantity / other.quantity)
        else:
            return f'Ошибка!'


# проверка перегрузки операторов
user_cell = Cell(14)
user_cell2 = Cell(6)

print(f'{user_cell.quantity} + {user_cell2.quantity} = {user_cell + user_cell2}')
print(f'{user_cell.quantity} - {user_cell2.quantity} = {user_cell - user_cell2}')
print(f'{user_cell2.quantity} - {user_cell.quantity} = {user_cell2 - user_cell}')
print(f'{user_cell.quantity} * {user_cell2.quantity} = {user_cell * user_cell2}')
print(f"{user_cell.quantity} : {user_cell2.quantity} = {user_cell / user_cell2}\n")

print(f'{type(user_cell)} + {int}:\n{user_cell.quantity} + {6} = '
      f'{user_cell + 6}\n')

user_quantity_cell = 6

print(f'количество ячеек: {user_cell.quantity}, количество ячеек в ряду: {user_quantity_cell}'
      f' {user_cell.make_order(user_quantity_cell)}')
