CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_users`(count INT)
BEGIN
	DECLARE user_name VARCHAR(50) DEFAULT 'name ';
    DECLARE birthday DATE DEFAULT '1970-01-01';
    DECLARE i INT DEFAULT 1;

    WHILE i <= count DO
		INSERT INTO users(`name`, birthday_at)
		VALUE(CONCAT(user_name, i), DATE_ADD(birthday, INTERVAL i DAY));
        SET i = i + 1;
	END WHILE;
END