SELECT U.user_name, P1.created_at, C.chatroom_name
FROM users_data AS U
JOIN posts AS P1
ON P1.poster_id = U.user_id
JOIN chatrooms AS C
ON P1.chatroom_id = C.chatroom_id
JOIN
(SELECT MAX(P2.created_at) AS created_at_last, P2.chatroom_id
 FROM posts AS P2
 JOIN users_data AS U2
 ON P2.poster_id = U2.user_id
 WHERE P2.is_deleted = 0
 AND U2.is_deleted = 0
 GROUP BY chatroom_id) AS P3
ON P3.created_at_last = P1.created_at
ORDER BY P1.chatroom_id ASC;
