DROP DATABASE IF EXISTS classics;
CREATE DATABASE classics;

DROP USER IF EXISTS 'classicsUser'@'localhost';
CREATE USER 'classicsUser'@'localhost' IDENTIFIED BY 'booksRlife';

GRANT ALL PRIVILEGES ON classics.* to 'classicsUser'@'localhost';
FLUSH PRIVILEGES;

USE classics;

CREATE TABLE authors (
id INT auto_increment,
authorName VARCHAR(255) NOT NULL,
createdAt DATETIME DEFAULT NOW(),
updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
deletedAt DATETIME,
PRIMARY KEY(id)
);

CREATE TABLE novels (
id INT auto_increment,
title VARCHAR(255) NOT NULL,
authorId INT NOT NULL,
createdAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
updatedAt DATETIME DEFAULT NOW(),
deletedAt DATETIME,
PRIMARY KEY (ID),
FOREIGN KEY(authorID) REFERENCES authors(id)
);

CREATE TABLE genres (
id INT auto_increment,
genreName VARCHAR(255) NOT NULL,
createdAt DATETIME DEFAULT NOW(),
updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
deletedAt DATETIME,
PRIMARY KEY(id)
);

CREATE TABLE novelGenres (
novelId INT NOT NULL,
genreId INT NOT NULL,
createdAt DATETIME DEFAULT NOW(),
updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
deletedAt DATETIME,
PRIMARY KEY (novelId, genreId),
FOREIGN KEY(novelId) REFERENCES novels(id),
FOREIGN KEY(genreId) REFERENCES genres(id)
);

INSERT INTO authors (authorName) VALUES ("Bram Stoker");
INSERT INTO authors (authorName) VALUES ("Oscar Wilde");
INSERT INTO authors (authorName) VALUES ("Alice Walker");
INSERT INTO authors (authorName) VALUES ("Leo Tolstoy");
INSERT INTO authors (authorName) VALUES ("Charles Dickens");
INSERT INTO authors (authorName) VALUES ("Arthur Miller");
INSERT INTO authors (authorName) VALUES ("Alexandre Dumas");
INSERT INTO authors (authorName) VALUES ("Arthur Conan Doyle");
INSERT INTO authors (authorName) VALUES ("Robert Louis Stevenson");
INSERT INTO authors (authorName) VALUES ("Fyodor Dostoyevsky");
INSERT INTO authors (authorName) VALUES ("Agatha Christie");
INSERT INTO authors (authorName) VALUES ("Ray Bradbury");
INSERT INTO authors (authorName) VALUES ( "George Orwell");
INSERT INTO authors (authorName) VALUES ("H.G. Wells");
INSERT INTO authors (authorName) VALUES ("Chinua Achebe");

INSERT INTO novels (title, authorId) VALUES ("Dracula", 1);
INSERT INTO novels (title, authorId) VALUES ("The Picture of Dorian Gray", 2);
INSERT INTO novels (title, authorId) VALUES ("The Color Purple", 3);
INSERT INTO novels (title, authorId) VALUES ("War and Peace", 4);
INSERT INTO novels (title, authorId) VALUES ("A Tale of Two Cities", 5);
INSERT INTO novels (title, authorId) VALUES ("The Crucible", 6);
INSERT INTO novels (title, authorId) VALUES ("The Three Musketeers", 7);
INSERT INTO novels (title, authorId) VALUES ("The Hound of the Baskervilles", 8);
INSERT INTO novels (title, authorId) VALUES ("The Strange Case of Dr. Jekyll and Mr. Hyde", 9);
INSERT INTO novels (title, authorId) VALUES ("Crime and Punishment", 10);
INSERT INTO novels (title, authorId) VALUES ("Murder on the Orient Express", 11);
INSERT INTO novels (title, authorId) VALUES ("Fahrenheit 451", 12);
INSERT INTO novels (title, authorId) VALUES ("Animal Farm", 13);
INSERT INTO novels (title, authorId) VALUES ("The Time Machine", 14);
INSERT INTO novels (title, authorId) VALUES ("Things Fall Apart", 15);

INSERT INTO genres (genreName) VALUES('Fiction');
INSERT INTO genres (genreName) VALUES('Horror');
INSERT INTO genres (genreName) VALUES('Fantasy');
INSERT INTO genres (genreName) VALUES('Gothic');
INSERT INTO genres (genreName) VALUES('Historical Fiction');
INSERT INTO genres (genreName) VALUES('War');
INSERT INTO genres (genreName) VALUES('Russian Literature');
INSERT INTO genres (genreName) VALUES('Drama');
INSERT INTO genres (genreName) VALUES('Plays');
INSERT INTO genres (genreName) VALUES('Adventure');
INSERT INTO genres (genreName) VALUES('French Literature');
INSERT INTO genres (genreName) VALUES('Mystery');
INSERT INTO genres (genreName) VALUES('Crime');
INSERT INTO genres (genreName) VALUES('Thriller');
INSERT INTO genres (genreName) VALUES('Science Fiction');
INSERT INTO genres (genreName) VALUES('Dystopia');
INSERT INTO genres (genreName) VALUES('Time Travel');
INSERT INTO genres (genreName) VALUES('African Literature');

INSERT INTO novelGenres (novelId, genreId) VALUES(1, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(1, 2);
INSERT INTO novelGenres (novelId, genreId) VALUES(1, 3);
INSERT INTO novelGenres (novelId, genreId) VALUES(2, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(2, 2);
INSERT INTO novelGenres (novelId, genreId) VALUES(2, 4);
INSERT INTO novelGenres (novelId, genreId) VALUES(2, 3);
INSERT INTO novelGenres (novelId, genreId) VALUES(3, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(3, 5);
INSERT INTO novelGenres (novelId, genreId) VALUES(4, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(4, 5);
INSERT INTO novelGenres (novelId, genreId) VALUES(4, 6);
INSERT INTO novelGenres (novelId, genreId) VALUES(4, 7);
INSERT INTO novelGenres (novelId, genreId) VALUES(5, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(5, 5);
INSERT INTO novelGenres (novelId, genreId) VALUES(6, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(6, 5);
INSERT INTO novelGenres (novelId, genreId) VALUES(6, 8);
INSERT INTO novelGenres (novelId, genreId) VALUES(6, 9);
INSERT INTO novelGenres (novelId, genreId) VALUES(7, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(7, 5);
INSERT INTO novelGenres (novelId, genreId) VALUES(7, 10);
INSERT INTO novelGenres (novelId, genreId) VALUES(7, 11);
INSERT INTO novelGenres (novelId, genreId) VALUES(8, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(8, 12);
INSERT INTO novelGenres (novelId, genreId) VALUES(8, 13);
INSERT INTO novelGenres (novelId, genreId) VALUES(8, 14);
INSERT INTO novelGenres (novelId, genreId) VALUES(9, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(9, 12);
INSERT INTO novelGenres (novelId, genreId) VALUES(9, 15);
INSERT INTO novelGenres (novelId, genreId) VALUES(9, 2);
INSERT INTO novelGenres (novelId, genreId) VALUES(10, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(10, 7);
INSERT INTO novelGenres (novelId, genreId) VALUES(10, 12);
INSERT INTO novelGenres (novelId, genreId) VALUES(11, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(11, 12);
INSERT INTO novelGenres (novelId, genreId) VALUES(12, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(12, 15);
INSERT INTO novelGenres (novelId, genreId) VALUES(12, 16);
INSERT INTO novelGenres (novelId, genreId) VALUES(13, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(13, 15);
INSERT INTO novelGenres (novelId, genreId) VALUES(13, 16);
INSERT INTO novelGenres (novelId, genreId) VALUES(14, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(14, 15);
INSERT INTO novelGenres (novelId, genreId) VALUES(14, 17);
INSERT INTO novelGenres (novelId, genreId) VALUES(15, 1);
INSERT INTO novelGenres (novelId, genreId) VALUES(15, 5);
INSERT INTO novelGenres (novelId, genreId) VALUES(15, 18);