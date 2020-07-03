BEGIN;
UPDATE tasks
SET is_closed = 1, changer_id = 1, updated_at = CURRENT_TIMESTAMP
WHERE created_at >= '2020/4/26 09:00'
AND created_at <= '2020/4/26 11:30'
AND is_deleted = 0;
COMMIT;
