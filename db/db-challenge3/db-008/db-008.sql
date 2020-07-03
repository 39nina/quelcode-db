SELECT U.user_name, C.chatroom_name, SUBSTRING(joined_on, 1, 10)
FROM chatrooms_join AS J
JOIN users_data AS U
ON J.join_user_id = U.user_id
JOIN chatrooms AS C
ON J.chatroom_id = C.chatroom_id
WHERE U.is_deleted = 0
AND C.is_deleted = 0
ORDER BY joined_on ASC
