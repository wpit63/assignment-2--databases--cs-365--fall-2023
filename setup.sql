
DROP DATABASE IF EXISTS passwords;
CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4;
USE passwords;

SET time_zone='+00:00';

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('key string', 512));
SET @init_vector = RANDOM_BYTES(16);
SET @salt = RANDOM_BYTES(8);

CREATE TABLE website (
    website_URL VARCHAR(128) NOT NULL,
    website_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (website_URL)
);

CREATE TABLE user (
    website_URL VARCHAR(128) NOT NULL,
    f_name VARCHAR(64) NOT NULL,
    l_name VARCHAR(64) NOT NULL,
    username VARCHAR(64) NOT NULL,
    email VARCHAR(128) NOT NULL,
    PRIMARY KEY (website_URL, username)
);

CREATE TABLE pass (
    website_URL VARCHAR(128) NOT NULL,
    username VARCHAR(64) NOT NULL,
    p_word VARBINARY(512),
    comment CHAR(240),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (website_URL, username, comment)
);

INSERT INTO website VALUES ('https://www.youtube.com', 'YouTube');
INSERT INTO website VALUES ('https://www.twitter.com', 'Twitter');
INSERT INTO website VALUES ('https://github.com', 'GitHub');
INSERT INTO website VALUES ('https://www.linkedin.com', 'LinkedIn');
INSERT INTO website VALUES ('https://www.microsoft.com', 'Microsoft');
INSERT INTO website VALUES ('https://www.apple.com', 'Apple');
INSERT INTO website VALUES ('https://www.mozilla.org', 'Mozilla');
INSERT INTO website VALUES ('https://www.blogger.com', 'Blogger');
INSERT INTO website VALUES ('https://arca.live', 'Arcalive');
INSERT INTO website VALUES ('https://www.reddit.com', 'Reddit');

INSERT INTO user VALUES ('https://www.youtube.com', 'Billy', 'Bob', 'Billy Channel', 'billy@gmail.com');
INSERT INTO user VALUES ('https://www.twitter.com', 'Victor', 'Mays', 'vmays90', 'victormays@gmail.com');
INSERT INTO user VALUES ('https://github.com', 'Rae', 'Taylor', 'empress5', 'empress5@hotmail.com');
INSERT INTO user VALUES ('https://www.linkedin.com', 'Mari', 'Garcia', 'Mari_G', 'mari@outlook.com');
INSERT INTO user VALUES ('https://www.microsoft.com', 'Karen', 'Aijou', 'starlight_actress', 'kaijou@outlook.com');
INSERT INTO user VALUES ('https://www.apple.com', 'Amelia', 'Watson', 'acedetective', 'watson@gmail.com');
INSERT INTO user VALUES ('https://www.mozilla.org', 'Serika', 'Kuromi', 'plsnoscam', 'catsaysmeow@hotmail.com');
INSERT INTO user VALUES ('https://www.blogger.com', 'Jason', 'Bright', 'rocketman', 'rocketman@gmail.com');
INSERT INTO user VALUES ('https://arca.live', 'John', 'Smith', 'khajituser', 'jdoe@gmail.com');
INSERT INTO user VALUES ('https://www.reddit.com', 'Jack', 'Mann', 'redditor', 'jmann@outlook.com');

INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://www.youtube.com', 'Billy Channel', AES_ENCRYPT('bobrules!', @key_str, @init_vector), 'My YouTube Channel Account');
INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://www.twitter.com', 'vmays90', AES_ENCRYPT('stay_OUT', @key_str, @init_vector), '5/70 alternative accounts');
INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://github.com', 'empress5', AES_ENCRYPT('relaire', @key_str, @init_vector), 'why do i have this');
INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://www.linkedin.com', 'Mari_G', AES_ENCRYPT('sunny', @key_str, @init_vector), 'job pls');
INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://www.microsoft.com', 'starlight_actress', AES_ENCRYPT('mr_white', @key_str, @init_vector), '');
INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://www.apple.com', 'acedetective', AES_ENCRYPT('mythw4tch', @key_str, @init_vector), 'for work');
INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://www.mozilla.org', 'plsnoscam', AES_ENCRYPT('mastershiba', @key_str,  @init_vector), '');
INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://www.blogger.com', 'rocketman', AES_ENCRYPT('glowing1', @key_str, @init_vector), '');
INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://arca.live', 'khajituser', AES_ENCRYPT('letmein', @key_str, @init_vector), 'outsider');
INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://www.reddit.com', 'redditor', AES_ENCRYPT('idiottalk', @key_str, @init_vector), '');