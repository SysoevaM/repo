products = []
attribute = {}
product_list = []
count = 1

# заполняем таблицу товаров характеристиками: название, цена, количество, единица измерения
while True:
    name = input("Введите название товара или 'q' для окончания ввода. >>>")
    if name != 'q':
        try:
            price = float(input("Введите цену товара (дробная часть отделеятся точной). >>>"))
        except ValueError:
            print ("Цена должна быть числом (разделитель целой и дробной расчи - точка)! Попробуйте ввести значения "
                   "характеристики товара заново.")
            continue

        try:
            quantity = int(input("Введите количество товара. >>>"))
        except ValueError:
            print ("Количество должно быть целым числом! Попробуйте ввести значения характеристики товара заново."")
            continue

        unit = input("Введите единицу измерения товара.  >>>")

        # Записываем характеристики товара в словарь
        attribute.update({"название": name, "цена": round(price, 2), "количество": quantity, "единица измерения": unit})

        # теперь пишем в список
        product_list = [count, attribute.copy()]

        # превращаем список в кортеж
        t_product_list = tuple(product_list)

        # записываем в список товаров
        products.append(t_product_list)

        attribute.clear()
        product_list.clear()

        count += 1

    # если введенное значние буква q, то навыход
    else:
        break

print(f'\nСписок товаров: {products}')

# словарь с характеристиками
analytics = {}

# множества характеристик
name_list = set()
price_list = set()
quantity_list = set()
unit_list = set()

for attr in products:
    # получаем характеристики товара
    name_prod = list(attr)[1].setdefault("название")
    price_prod = list(attr)[1].setdefault("цена")
    quantity_prod = list(attr)[1].setdefault("количество")
    unit_prod = list(attr)[1].setdefault("единица измерения")

    # добавляем каждую характеристику в множество
    name_list.add(name_prod)
    price_list.add(price_prod)
    quantity_list.add(quantity_prod)
    unit_list.add(unit_prod)

# записываем все в словарь, но не множества, а списки (по условию задачи зачем-то...)
analytics.update({"название": list(name_list), "цена": list(price_list), "количество": list(quantity_list),
                  "единица измерения": list(unit_list)})

print(f'\nСловарь характеристик: {analytics}')
