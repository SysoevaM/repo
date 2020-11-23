/* Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем. */

SELECT IF(from_user_id = 96, to_user_id, from_user_id) AS user_id, count(id) AS count
FROM vk.messages
WHERE 
(from_user_id = 96 AND
to_user_id IN (SELECT IF(from_user_id = 96, to_user_id, from_user_id) FROM vk.friend_requests WHERE status = 1 AND (from_user_id = 96 OR to_user_id = 96))) or
(to_user_id = 96 AND
from_user_id IN (SELECT IF(from_user_id = 96, to_user_id, from_user_id) FROM vk.friend_requests WHERE status = 1 AND (from_user_id = 96 OR to_user_id = 96)))
GROUP BY IF(from_user_id = 96, to_user_id, from_user_id)
ORDER BY count DESC
LIMIT 1;