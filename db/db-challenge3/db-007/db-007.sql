SELECT chatroom_id, chatroom_name, summary,
CASE is_permitted_sending_file WHEN 1 THEN '許可'
							   WHEN 0 THEN '禁止'
END, is_directchat, is_deleted, creator_id, created_at, changer_id, updated_at
FROM chatrooms
WHERE is_deleted = 0
AND summary LIKE('%ダイレクトチャット')
ORDER BY chatroom_id ASC;
