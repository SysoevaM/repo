CREATE DEFINER=`root`@`localhost` TRIGGER `products_BEFORE_UPDATE` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
	IF (NEW.`name` IS NULL AND NEW.`description` IS NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Название или описание должно быть обязательно заполнено!';
	END IF;
END