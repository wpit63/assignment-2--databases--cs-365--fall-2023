
DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords;

USE passwords;

CREATE TABLE website (
    website_URL VARCHAR(128) NOT NULL,
    website_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (website_URL)
);

CREATE TABLE user (
    f_name VARCHAR(64) NOT NULL,
    l_name VARCHAR(64) NOT NULL,
    username VARCHAR(64) NOT NULL,
    email VARCHAR(128) NOT NULL,
    PRIMARY KEY (website_URL, username)
);

CREATE TABLE password (
    p_word VARCHAR(128) NOT NULL,
    t_stamp DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (website_URL, username, p_word)
);
