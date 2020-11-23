/* расписание на ноябрь для 1го тренера*/
DROP TABLE IF EXISTS temp;
CREATE TEMPORARY TABLE temp (`date` DATE);

CALL `range`("2020-11-01", "2020-11-30");

SELECT DISTINCT t.`date` '', 
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '08:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '08:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '09:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '09:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '10:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '10:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '11:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '11:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '12:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '12:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '13:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '13:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '14:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '14:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '15:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '15:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '16:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '16:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '17:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '17:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '18:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '18:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '19:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '19:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '20:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '20:00',
IF(t.`date` = DATE_FORMAT(c.`datetime`, '%Y-%m-%d') AND DATE_FORMAT(c.`datetime`, '%H:%i') = '21:00', CONCAT(cl.last_name, ' ', LEFT(cl.first_name, 1),'.' ,  LEFT(cl.middle_name, 1)), '') as '21:00'
FROM fit.temp t
LEFT JOIN fit.calendar c 
ON DATE_FORMAT(c.`datetime`, '%Y-%m-%d') = t.`date` AND c.trainer_id = 1
LEFT JOIN fit.clients cl 
ON cl.id = c.client_id; 