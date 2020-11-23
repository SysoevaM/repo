CREATE DEFINER=`root`@`localhost` TRIGGER `products_AFTER_INSERT` AFTER INSERT ON `products` FOR EACH ROW BEGIN
	INSERT INTO `logs` (name_table, id_line, name_value, create_at)
    VALUE ('products', NEW.id, NEW.`name`, NEW.created_at);
END