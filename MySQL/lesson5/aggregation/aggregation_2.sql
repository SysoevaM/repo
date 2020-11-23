/* Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, 
что необходимы дни недели текущего года, а не года рождения. */

SELECT COUNT(*) AS sum, DATE_FORMAT(CONCAT(2020,'-', month(birthday_at),'-', day(birthday_at)), '%W') AS age
FROM users
GROUP BY age
ORDER BY sum DESC;