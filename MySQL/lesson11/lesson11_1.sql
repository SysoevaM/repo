/*Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products 
в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и 
содержимое поля name.*/

/*Создание таблицы log*/
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`(
name_table VARCHAR(100) NOT NULL,
id_line BIGINT NOT NULL,
name_value VARCHAR(255),
create_at DATETIME NOT NULL
) COMMENT = 'log-журнал записи в products и users' ENGINE=ARCHIVE;

/*триггер для products в lesson11_1_tp.sql, для users - lesson11_1_tu.sql*/

/*Заполнение таблицы users*/
INSERT INTO users (`name`, birthday_at)
VALUES
('Евгений', '2001-09-01'),
('Ольга', '2006-04-19');

/*Заполнение таблицы product*/
INSERT INTO products (`name`, `description`, price, catalog_id)
VALUES
('ADM A-689 ZE', 'Процессор для ПК', 10795.00, 1),
('MSI B250M G9O', 'Материнская плата для ПК', 10795.00, 2);
