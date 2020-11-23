/* Выведите список товаров products и разделов catalogs, который соответствует товару. */

SELECT p.name, p.description, p.price, c.`name` AS name_catalog
FROM products AS p
LEFT JOIN
catalogs AS c
ON p.catalog_id = c.id;