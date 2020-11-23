# Реализовать класс Matrix (матрица). Обеспечить перегрузку конструктора класса (метод init()), который должен принимать
# данные (список списков) для формирования матрицы.
# Подсказка: матрица — система некоторых математических величин, расположенных в виде прямоугольной схемы.
# Следующий шаг — реализовать перегрузку метода str() для вывода матрицы в привычном виде.
# Далее реализовать перегрузку метода add() для реализации операции сложения двух объектов класса Matrix (двух матриц).
# Результатом сложения должна быть новая матрица.

from itertools import zip_longest


class Matrix:
    def __init__(self, mas: list):
        self.matrix = mas

    # вывод матрицы без скобок
    def __str__(self):
        str_el = ""
        for el1 in self.matrix:
            for el2 in el1:
                str_el = str_el + str(el2) + " "
            str_el = str_el + "\n"
        return str_el

    # сложение матриц
    def __add__(self, other):
        sum_list = []

        for i in range(len(self.matrix)):
            # сложение построчно списков
            result = [x + y for x, y in zip_longest(other.matrix[i], self.matrix[i], fillvalue=0)]

            sum_list.append(result)

        return Matrix(sum_list)

    def __repr__(self):
        return self.__str__()


# проверка методов
user_matrix1 = Matrix([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])

user_matrix2 = Matrix([
    [9, 8, 7],
    [6, 5, 4],
    [3, 2, 1]
])

print(f'Матрица 1:\n{user_matrix1}')
print(f'Матрица 2:\n{user_matrix2}')

sum_matrix = user_matrix1 + user_matrix2

print(f'Результат сложения двую матриц\n{user_matrix1}+\n{user_matrix2}=\n{sum_matrix}')
