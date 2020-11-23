CREATE DEFINER=`root`@`localhost` FUNCTION `FIBONACCI`(num INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE sum, el1, el2, i INT DEFAULT 0;
    SET el2 = 1;
    SET i = 2;
	IF num > 1 THEN
		WHILE i <= num DO
			SET sum = el1 + el2;
            SET el1 = el2;
			SET el2 = sum;
            SET i = i + 1;
        END WHILE;
    ELSEIF num = 1 THEN
		SET sum = 1;
	END IF;
    RETURN sum;
END