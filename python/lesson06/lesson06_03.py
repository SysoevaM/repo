# Реализовать базовый класс Worker (работник), в котором определить атрибуты: name, surname, position (должность),
# income (доход). Последний атрибут должен быть защищенным и ссылаться на словарь, содержащий элементы: оклад и премия,
# например, {"wage": wage, "bonus": bonus}. Создать класс Position (должность) на базе класса Worker. В классе Position
# реализовать методы получения полного имени сотрудника (get_full_name) и дохода с учетом премии (get_total_income).
# Проверить работу примера на реальных данных (создать экземпляры класса Position, передать данные, проверить значения
# атрибутов, вызвать методы экземпляров).

# базовый класс
class Worker:
    name: str
    surname: str
    position: str
    _income = dict(wage="", bonus="")


# дочерний класс Position
class Position(Worker):
    def __init__(self, name: str, surname: str, position: str, user_wage, user_bonus):
        self.name = name
        self.surname = surname
        self.position = position
        self._income = {"wage": float(user_wage), "bonus": float(user_bonus)}

    def get_full_name(self):
        return f"{self.name} {self.surname}"

    def get_total_income(self):
        return self._income.get("wage") + self._income.get("bonus")


# тестирование методов дочернего класса
worker = Position("Иван", "Иванов", "Менеджер", 100, 20)

print(f'{worker.get_full_name()} получает: {worker.get_total_income()}')
