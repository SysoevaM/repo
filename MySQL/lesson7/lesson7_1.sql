/* Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине. */

SELECT u.`name`
FROM users AS u
RIGHT JOIN
orders AS o
ON u.id = o.user_id;