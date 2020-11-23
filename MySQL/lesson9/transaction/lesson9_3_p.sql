CREATE DEFINER=`root`@`localhost` PROCEDURE `range`(start_date date, end_date date)
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE temp_date DATE DEFAULT start_date;
  WHILE temp_date < end_date DO
    SET temp_date = DATE_ADD(start_date, interval i day);
	INSERT INTO temp VALUE (temp_date);
	SET i = i + 1;
  END WHILE;
END