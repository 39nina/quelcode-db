SELECT COUNT(*) AS 投稿数, C.chatroom_name
FROM posts AS P
JOIN chatrooms AS C
ON P.chatroom_id = C.chatroom_id
JOIN users_data AS U
ON P.poster_id = U.user_id
WHERE U.is_deleted = 0
AND P.is_deleted = 0
GROUP BY P.chatroom_id
ORDER BY COUNT(*) DESC;

