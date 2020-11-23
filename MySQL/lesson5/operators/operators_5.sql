/* (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, 
заданном в списке IN. */

SELECT id, name, FIELD(id, 5, 1, 2) as idx 
FROM catalogs 
WHERE id IN (5, 1, 2)
ORDER BY idx;