BEGIN;
UPDATE chatrooms
SET is_permitted_sending_file = 0, changer_id = 1, updated_at = CURRENT_TIMESTAMP
WHERE chatroom_id NOT IN
(SELECT DISTINCT(chatroom_id) FROM chatrooms_join
 WHERE join_user_id = 1)
AND is_deleted = 0;
COMMIT;
