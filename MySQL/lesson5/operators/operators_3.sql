/* В таблице складских запасов storehouses_products в поле value могут встречаться 
самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения 
значения value. Однако нулевые запасы должны выводиться в конце, после всех записей. */

/* заполнение таблицы storehouses */
INSERT INTO storehouses (name) 
VALUES
  ('Склад 1'),
  ('Склад 2'),
  ('Склад 3');
  
/* заполнение таблицы storehouses_products */
INSERT INTO storehouses_products (storehouse_id, product_id, value) 
VALUES
  (1, 1, 6),
  (1, 3, 0),
  (1, 4, 3),
  (2, 2, 0),
  (2, 3, 7),
  (3, 4, 0),
  (3, 5, 1),
  (3, 2, 9);

/* выборка в заданном порядке */  
SELECT id, storehouse_id, product_id, value, IF(value > 0, 0 , 1) AS flag
FROM storehouses_products
ORDER BY flag, value;