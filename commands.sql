-- create a new entry into the database
-- this requires three commands due to having three related tables

INSERT INTO website VALUES ('https://www.hartford.edu', 'UHart Website');
INSERT INTO user VALUES ('https://www.hartford.edum', 'Henry', 'Farmer', 'HFARMER', 'farmer@hartford.edu');
INSERT INTO pass (website_URL, username, p_word, comment) VALUES ('https://www.hartford.edu', 'HFARMER', AES_ENCRYPT('5555', @key_str, @init_vector), 'School account');

-- get password associated with url of one of the entries

SELECT p_word FROM pass WHERE website_URL = 'https://www.youtube.com';

-- get all password-related data from URLs starting with 'https'

SELECT * FROM pass WHERE website_URL LIKE 'https://%';

-- change a URL associated with one of the passwords 
-- start a transaction to update all tables individually, then commit the changes
-- disables autocommit for duration of transaction, then re-enables after commit 

SET autocommit = OFF;

START TRANSACTION;

UPDATE website SET website_URL = 'https://www.discord.com' WHERE website_url = 'https://www.apple.com';
UPDATE user SET website_URL = 'https://www.discord.com' WHERE website_url = 'https://www.apple.com';
UPDATE pass SET website_URL = 'https://www.discord.com' WHERE website_url = 'https://www.apple.com';

COMMIT;

SET autocommit = ON;

-- update any password

UPDATE pass SET p_word = AES_ENCRYPT('new password', @key_str, @init_vector) WHERE website_URL = 'https://www.youtube.com';

-- remove a URl

SET autocommit = OFF;

START TRANSACTION;

DELETE FROM website WHERE website_URL = 'https://www.youtube.com';
DELETE FROM user WHERE website_URL = 'https://www.youtube.com';
DELETE FROM pass WHERE website_URL = 'https://www.youtube.com';

COMMIT;

SET autocommit = ON;

-- remove a password

DELETE FROM pass WHERE p_word WHERE p_word = AES_ENCRYPT('bobrules!', @key_str, @init_vector);
