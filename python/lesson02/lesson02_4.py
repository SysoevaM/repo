user_string = input("Введте строку >>> ")

# получаем массив
mas_string = user_string.split()

count = 1
# бежим по массиву и выводим строки
for elem in mas_string:
    print(f'{count} строка: {elem[0:10]}')
    count += 1
