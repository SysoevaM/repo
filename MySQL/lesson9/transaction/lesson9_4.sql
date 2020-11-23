/* Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, 
оставляя только 5 самых свежих записей. */

 /* создаем таблицу дат */
 CREATE TABLE calendar (
 id SERIAL PRIMARY KEY,
 created_at DATE NOT NULL);
 
  /* заполняем таблицу дат */
 INSERT INTO calendar (created_at)
 VALUES
 ('2018-08-01'),
 ('2018-08-04'),
 ('2018-08-16'),
 ('2018-08-16'),
 ('2018-08-19'),
 ('2018-08-25'),
 ('2018-10-21'),
 ('2018-09-06'),
 ('2019-03-17');
 
/* создаем временную таблицу для 5 позиций */
DROP TABLE IF EXISTS view_calendar;
CREATE TEMPORARY TABLE view_calendar AS SELECT DISTINCT created_at 
FROM  calendar
ORDER BY created_at DESC
LIMIT 5;

/* определяем нижнюю границу даты */
SELECT @date_min := created_at 
FROM  view_calendar
ORDER BY created_at
LIMIT 1;

/* удаляем все, кроме первых 5 свежих записей */
DELETE
FROM  calendar
WHERE created_at < @date_min;

SELECT * 
FROM calendar