/* Создайте представление, которое выводит название name товарной позиции из таблицы 
products и соответствующее название каталога name из таблицы catalogs. */

DROP VIEW IF EXISTS view_catalogs;

CREATE VIEW view_catalogs AS SELECT p.name AS 'product_name', c.name AS 'catalog_name'
FROM products AS p, catalogs AS c 
WHERE p.catalog_id = c.id;

SELECT * FROM view_catalogs;