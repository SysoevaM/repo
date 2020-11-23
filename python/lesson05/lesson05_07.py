# Создать вручную и заполнить несколькими строками текстовый файл, в котором каждая строка должна содержать данные о
# фирме: название, форма собственности, выручка, издержки.
# Далее реализовать список. Он должен содержать словарь с фирмами и их прибылями, а также словарь со средней прибылью.
# Если фирма получила убытки, также добавить ее в словарь (со значением убытков).
# Итоговый список сохранить в виде json-объекта в соответствующий файл.

import json

count_firm = 0
average_profit = 0
dict_firm = {}
list_firm = []

with open("les05_07.txt") as f_out:
    print(f'Исходный файл:\n{f_out.read()}')
    f_out.seek(0)

    for el in f_out:
        el = el.split()
        name_firm = el[0]
        profit = float(el[2]) - float(el[3])
        if profit > 0:
            average_profit += profit
            count_firm += 1
        dict_firm.update({name_firm: profit})
    f_out.close()
    average_profit = round(average_profit / count_firm, 2)
    list_firm.append(dict_firm)
    list_firm.append({'average_profit': average_profit})
    print(list_firm)

# запись json
with open("les05_07_result.json", "w", encoding='utf-8') as f_in:
    json.dump(list_firm, f_in, ensure_ascii=False)
    json_str = json.dumps(list_firm)
    print(json_str)
