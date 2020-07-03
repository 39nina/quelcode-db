BEGIN;
UPDATE users_data
SET is_deleted = 1, updated_at = CURRENT_TIMESTAMP
WHERE tel_work IS NULL
AND tel_mobile IS NULL;
COMMIT;
