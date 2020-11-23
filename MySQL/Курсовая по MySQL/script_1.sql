/* Разрешать 10% скидку на годовые карты для новых посетителей или тех, у кого абонемент истек более 5 лет. */
START TRANSACTION;

/* 1, 2, 5, 6 - не положена скидка, 4 - можно */
SET @id_client = check_client(4);

INSERT INTO services_clients (client_id, service_id, begin_date)
VALUES 
(@id_client, 2, '2020-05-06');

INSERT INTO sale (service_id, quantity, price_withoutvat, discount)
VALUE 
(2, 1, 60000, 0.1);

CALL commit_rollback(@id_client);