/* Определить кто больше поставил лайков (всего) - мужчины или женщины? */

SELECT 
(SELECT gender FROM profiles WHERE users_id = likes.from_user_id) AS gender,
count(from_user_id)
FROM likes
WHERE (SELECT gender FROM profiles WHERE users_id = likes.from_user_id) IN ('f', 'm')
GROUP BY gender;