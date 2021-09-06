CREATE DATABASE classics;

DROP USER IF EXISTS 'classicsUser'@'localhost';
CREATE USER 'classicsUser'@'localhost' IDENTIFIED BY 'booksRlife';

GRANT ALL PRIVILEGES ON classics.* to 'classicsUser'@'localhost';
FLUSH PRIVILEGES;

USE classics;

CREATE TABLE authors (
id INT auto_increment,
authorName VARCHAR(255),
createdAt DATETIME DEFAULT NOW(),
updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY(id)
);

CREATE TABLE novels (
id INT auto_increment,
title VARCHAR(255),
authorId INT,
createdAt DATETIME DEFAULT NOW(),
updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (ID),
FOREIGN KEY(authorID) REFERENCES authors(id)
);

CREATE TABLE genres (
id INT auto_increment,
genreName VARCHAR(255),
createdAt DATETIME DEFAULT NOW(),
updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY(id)
);

CREATE TABLE novelGenres (
novelId INT,
genreId INT,
createdAt DATETIME DEFAULT NOW(),
updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (novelId, genreId),
FOREIGN KEY(novelId) REFERENCES novels(id),
FOREIGN KEY(genreId) REFERENCES genres(id)
);