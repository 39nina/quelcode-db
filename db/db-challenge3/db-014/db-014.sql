BEGIN;
DELETE FROM chatrooms_join
WHERE join_user_id IN
(SELECT user_id FROM users_data
 WHERE is_deleted = 1);
COMMIT;
