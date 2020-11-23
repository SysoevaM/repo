/* Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей. */

SELECT 
    count(media_id) AS count_likes,
    (SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) 
    FROM profiles 
    WHERE users_id IN (SELECT user_id FROM media WHERE id = likes.media_id)) as age
FROM likes
GROUP BY media_id
/*WITH ROLLUP*/
ORDER BY (
    SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) 
    FROM profiles 
    WHERE users_id IN (
       SELECT user_id 
       FROM media 
       WHERE id = likes.media_id))
LIMIT 10;