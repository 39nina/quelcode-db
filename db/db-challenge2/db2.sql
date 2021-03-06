BEGIN;
CREATE TABLE users_data (
user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
mail VARCHAR(100) NOT NULL,
pass VARCHAR(100) NOT NULL,
user_name VARCHAR(100) NOT NULL,
introduce VARCHAR(1000),
tel_work VARCHAR(13),
tel_mobile VARCHAR(13),
is_deleted TINYINT(1) NOT NULL DEFAULT 0,
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL
);
CREATE TABLE chatrooms_join (
chatroom_id INTEGER REFERENCES chatrooms(chatroom_id),
join_user_id INTEGER REFERENCES users_data(user_id),
joined_on DATETIME NOT NULL,
PRIMARY KEY(chatroom_id, join_user_id)
);
CREATE TABLE chatrooms (
chatroom_id INTEGER PRIMARY KEY AUTO_INCREMENT,
chatroom_name VARCHAR(100) NOT NULL,
summary VARCHAR(1000) NOT NULL,
is_permitted_sending_file TINYINT(1) NOT NULL DEFAULT 1,
is_directchat TINYINT(1) NOT NULL DEFAULT 0,
is_deleted TINYINT(1) NOT NULL DEFAULT 0,
creator_id INTEGER NOT NULL REFERENCES user_data(user_id),
changer_id INTEGER NOT NULL REFERENCES user_data(user_id),
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL
);
CREATE TABLE posts (
post_id INTEGER PRIMARY KEY AUTO_INCREMENT,
post_detail VARCHAR(1000) NOT NULL,
file_name VARCHAR(100),
chatroom_id INTEGER NOT NULL REFERENCES chatroom(chatroom_id),
is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
poster_id INTEGER NOT NULL REFERENCES user_data(user_id),
changer_id INTEGER NOT NULL REFERENCES user_data(user_id),
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL
);
CREATE TABLE tasks (
task_id INTEGER PRIMARY KEY AUTO_INCREMENT,
task_detail VARCHAR(1000) NOT NULL,
task_maneger_id INTEGER NOT NULL REFERENCES user_data(user_id),
chatroom_id INTEGER NOT NULL REFERENCES chatroom(chatroom_id),
closed_on DATETIME,
is_closed TINYINT(1) DEFAULT 0 NOT NULL,
is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
creator_id INTEGER NOT NULL REFERENCES user_data(user_id),
changer_id INTEGER NOT NULL REFERENCES user_data(user_id),
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL
);
COMMIT;
