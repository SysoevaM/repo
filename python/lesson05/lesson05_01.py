# Создать программно файл в текстовом формате, записать в него построчно данные, вводимые пользователем.
# Об окончании ввода данных свидетельствует пустая строка.

with open("les04_01.txt", "w") as f_obj:
    user_text = input('Введите текст для записи в файл >>> ').split()
    f_obj.writelines(el + '\n' for el in user_text)
    f_obj.close()