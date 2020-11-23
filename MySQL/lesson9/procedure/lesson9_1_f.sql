CREATE DEFINER=`root`@`localhost` FUNCTION `hello`(us_time DATETIME) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE time_hour INT;
    SET time_hour = HOUR(us_time);
    
	IF (time_hour >= 6 and time_hour < 12) THEN
		RETURN "Доброе утро";
	ELSEIF (time_hour >= 12 and time_hour < 18) THEN
		RETURN "Добрый день";
	ELSEIF (time_hour >= 18) and (time_hour < 24) THEN
        RETURN "Добрый вечер";
	ELSEIF (time_hour >= 0) and (time_hour < 6) THEN
		 RETURN "Доброй ночи";
  END IF;
END