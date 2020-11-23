CREATE DEFINER=`root`@`localhost` TRIGGER `users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW BEGIN
	INSERT INTO `logs` (name_table, id_line, name_value, create_at)
    VALUE ('users', NEW.id, NEW.`name`, NEW.created_at);
END