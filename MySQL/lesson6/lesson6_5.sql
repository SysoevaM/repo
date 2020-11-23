/* Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети. */

SELECT id,
(SELECT count(id) FROM messages WHERE from_user_id = users.id OR to_user_id = users.id) + 
(SELECT count(from_user_id) FROM likes WHERE from_user_id = users.id) + 
(SELECT count(user_id) FROM media WHERE user_id = users.id) AS total
FROM vk.users
ORDER BY total
LIMIT 10;