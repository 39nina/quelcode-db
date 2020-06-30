BEGIN;
CREATE TABLE user_data (
user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
mail VARCHAR(100) NOT NULL,
pass VARCHAR(100) NOT NULL,
user_name VARCHAR(100) NOT NULL,
introduce VARCHAR(1000),
tel_work VARCHAR(13),
tel_mobile VARCHAR(13),
delete_flg TINYINT NOT NULL DEFAULT 0,
created_at DATETIME NOT NULL,
update_at DATETIME NOT NULL
);
CREATE TABLE chat_join (
chatroom_id INTEGER NOT NULL,
part_id INTEGER NOT NULL,
part_time DATETIME NOT NULL,
PRIMARY KEY(chatroom_id, part_id)
);
CREATE TABLE chatroom (
chatroom_id INTEGER PRIMARY KEY AUTO_INCREMENT,
chatroom_name VARCHAR(100) NOT NULL,
summary VARCHAR(1000) NOT NULL,
file_permit_flg TINYINT NOT NULL DEFAULT 1,
dc_flg TINYINT NOT NULL DEFAULT 0,
delete_flg TINYINT NOT NULL DEFAULT 0,
creator_id INTEGER NOT NULL REFERENCES user_data(user_id),
changer_id INTEGER NOT NULL REFERENCES user_data(user_id),
created_at DATETIME NOT NULL,
update_at DATETIME NOT NULL
);
CREATE TABLE post (
post_id INTEGER PRIMARY KEY AUTO_INCREMENT,
post_detail VARCHAR(1000) NOT NULL,
file_name VARCHAR(100),
chatroom_id INTEGER NOT NULL REFERENCES chatroom(chatroom_id),
delete_flg TINYINT DEFAULT 0 NOT NULL,
poster_id INTEGER NOT NULL REFERENCES user_data(user_id),
changer_id INTEGER NOT NULL REFERENCES user_data(user_id),
created_at DATETIME NOT NULL,
update_at DATETIME NOT NULL
);
CREATE TABLE task (
task_id INTEGER PRIMARY KEY AUTO_INCREMENT,
task_detail VARCHAR(1000) NOT NULL,
task_maneger_id INTEGER NOT NULL REFERENCES user_data(user_id),
chatroom_id INTEGER NOT NULL REFERENCES chatroom(chatroom_id),
deadline DATETIME,
close_flg TINYINT DEFAULT 0 NOT NULL,
delete_flg TINYINT DEFAULT 0 NOT NULL,
creator_id DATETIME NOT NULL REFERENCES user_data(user_id),
changer_id DATETIME NOT NULL REFERENCES user_data(user_id),
created_at DATETIME NOT NULL,
update_at DATETIME NOT NULL
);
COMMIT;
