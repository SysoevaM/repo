/* Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом
 VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать 
 поля к типу DATETIME, сохранив введённые ранее значения. */

/* создание временной таблица */
CREATE TABLE users_new (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at varchar(20),
  updated_at varchar(20)
) COMMENT = 'Покупатели';

/* заполнение временной таблица */
INSERT INTO users_new (name, birthday_at, created_at, updated_at) 
VALUES
  ('Геннадий', '1990-10-05', '20.10.2017 8:10', '20.11.2019 15:36'),
  ('Наталья', '1984-11-12', '01.12.2018 23:04', '05.06.2020 15:53'),
  ('Александр', '1985-05-20', '26.08.2014 7:09', '01.12.2019 01:06'),
  ('Сергей', '1988-02-14', '20.03.2018 10:10', '02.04.2020 17:05'),
  ('Иван', '1998-01-12', '01.12.2018 23:04', '03.04.2020 17:09'),
  ('Мария', '1992-08-29', '26.08.2014 7:09', '01.12.2019 04:08');

/* замена формата времени */
UPDATE  users_new
SET 
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');
    
/* преобразование типа данных */
ALTER TABLE users_new
CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE users_new
CHANGE updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;







