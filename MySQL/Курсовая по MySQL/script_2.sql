/* клиенты, которые не пользовались залом более года и клиенты с датой окончания абонемента < 30 дней */
SELECT CONCAT(c.first_name, ' ',  c.last_name, ' ', c.middle_name) 'ФИО', 
		c.phone 'телефон', sc.end_date 'дата окончания абонемента', 
        IF(DATEDIFF(sc.end_date, NOW()) > 0, DATEDIFF(sc.end_date, NOW()), 0) 'осталось дней'
FROM clients c
JOIN services_clients sc
ON sc.client_id = c.id
	AND sc.service_id IN (2, 3, 4, 5) 
	AND (DATE_ADD(sc.end_date, INTERVAL 1 YEAR) <= NOW()  
	OR DATE_ADD(sc.end_date, INTERVAL -30 DAY) < NOW() AND sc.end_date > NOW())
GROUP BY c.phone
ORDER BY sc.end_date DESC;