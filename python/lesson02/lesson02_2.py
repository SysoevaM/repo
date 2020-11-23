listing = []
elem = None

# вводим значения
while True:
    elem = input("Ведите значения для листа. Для выхода нажмите 'q'. >>>")
    if elem == "q":
        break
    else:
        listing.extend(elem)

print("Исходный лист: " + str(listing))

count = 0
# бежим по листу и копируем нужные значения в новый, меняя соседние местами
while count < len(listing) - 1:
    # меняем элементы местами
    listing[count], listing[count + 1] = listing[count + 1], listing[count]
    count += 2

print("Модифицированный лист: " + str(listing))
