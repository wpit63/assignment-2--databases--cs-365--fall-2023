
DROP DATABASE IF EXISTS passwords;
CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4;
USE passwords;

SET time_zone='+00:00';

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('key string', 128));
SET @init_vector = RANDOM_BYTES(16);
SET @salt = RANDOM_BYTES(8);

-- example password insert
-- INSERT INTO user (
--     url
--     username
--     AES_ENCRYPT('string', @key_str, @init_vector, '', @salt)  
-- )

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
    p_word VARCHAR(128) NOT NULL,
    comment CHAR(240),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (website_URL, username, p_word)
);

INSERT INTO website VALUES (
    'https://www.youtube.com',
    'YouTube'
);

INSERT INTO user VALUES (
    'https://www.youtube.com',
    'Billy',
    'Bob',
    'Billy Channel',
    'billy@gmail.com'
);

INSERT INTO pass VALUES (
    'https://www.youtube.com'
    'Billy Channel',
    'My YouTube Channel Account'
    AES_ENCRYPT('bobrules!', @key_str, @init_vector, '', @salt)   
);