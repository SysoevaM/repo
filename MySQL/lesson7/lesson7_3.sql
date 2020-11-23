/* Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов. */

/* создание таблицы cities */
CREATE TABLE IF NOT EXISTS cities (
`label` VARCHAR(200) NOT NULL,
`name` VARCHAR(200) NOT NULL,
PRIMARY KEY (`label`));

/* заполнение таблицы cities */
INSERT INTO cities (`label`, `name`)
VALUES
("Moscow", "Москва"), 
("Paris", "Париж"), 
("New-York", "Нью-Йорк"),
("Praga", "Прага"),
("Rome", "Рим");

/* создание таблицы flights */
CREATE TABLE IF NOT EXISTS flights (
`id` INT NOT NULL AUTO_INCREMENT,
`from` VARCHAR(200) NOT NULL,
`to` VARCHAR(200) NOT NULL,
PRIMARY KEY (`id`));
 
/* заполнение таблицы flights */
INSERT INTO flights (`from`, `to`)
VALUES
("Moscow", "Rome"), 
("Moscow", "New-York"), 
("Rome", "Moscow"),
("Paris", "Moscow"),
("Moscow", "Praga");

/* запрос рейсов */
SELECT
(SELECT name FROM cities WHERE label = f.from) AS `from`,
(SELECT name FROM cities WHERE label = f.to) AS `to`
FROM flights AS f;