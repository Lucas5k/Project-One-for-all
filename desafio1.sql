DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans (
	id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plan VARCHAR(35) NOT NULL
);

CREATE TABLE users (
	id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(55) NOT NULL,
    age INT(50) NOT NULL,
    plans_id INT(100) NOT NULL,
	FOREIGN KEY (plans_id) REFERENCES plans (id)
);

CREATE TABLE plan_values (
	id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	plan_value DECIMAL(3,2) NOT NULL
);

CREATE TABLE plans_users (
	id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,	
	users_id INT(100) NOT NULL,
	plan_value_id INT(100) NOT NULL,
	signature_date DATE,
    FOREIGN KEY (users_id) REFERENCES users (id),
	FOREIGN KEY (plan_value_id) REFERENCES plan_values (id)
);

CREATE TABLE artists (
	id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artist VARCHAR(55)
);

CREATE TABLE followers_of_an_artist (
    users_id INT(100) NOT NULL,
    artist_id INT(100) NOT NULL,
	CONSTRAINT PRIMARY KEY AUTO_INCREMENT(users_id, artist_id),
    FOREIGN KEY (users_id) REFERENCES users (id),
    FOREIGN KEY (artist_id) REFERENCES artists (id)
);

CREATE TABLE albums (
	id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(255) NOT NULL,
    artist_id INT(100) NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (id)
);

CREATE TABLE release_years (
	id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_release YEAR NOT NULL
);

CREATE TABLE songs (
	id INT(255) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    albums_id INT(100) NOT NULL,
    song TEXT(1000000) NOT NULL,
    release_year_id INT(100) NOT NULL,
	duration INT(100) NOT NULL,
    FOREIGN KEY (albums_id) REFERENCES albums (id),
    FOREIGN KEY (release_year_id) REFERENCES release_years (id)
);

CREATE TABLE reproduction_history (
	users_id INT(100) NOT NULL,
    song_id INT(100) NOT NULL,
    CONSTRAINT PRIMARY KEY AUTO_INCREMENT(users_id, song_id),
	reproduction_date DATETIME,
    FOREIGN KEY (song_id) REFERENCES songs (id),
    FOREIGN KEY (users_id) REFERENCES users (id)
);

INSERT INTO plans (plan) VALUES
	('gratuito'),
    ('familiar'),
    ('universitario'),
    ('pessoal');
 
 INSERT INTO users (name, age, plans_id) VALUES
	('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill', 20, 3),
    ('Roger', 45, 4),
    ('Norman', 58, 4),
    ('Patrick', 33, 2),
    ('Vivian', 26, 3),
    ('Carol', 19, 3),
    ('Angelina', 42, 2),
    ('Paul', 46, 2);

INSERT INTO plan_values (plan_value) VALUES
	(0),
    (7.99),
    (5.99),
    (6.99);

INSERT INTO plans_users (users_id, signature_date, plan_value_id) VALUES
	(1, '2019-10-20', 1),
    (2, '2017-12-30', 2),
    (3, '2019-06-05', 3),
    (4, '2020-05-13', 4),
    (5, '2017-02-17', 4),
    (6, '2017-01-06', 2),
    (7, '2018-01-05', 3),
    (8, '2018-02-14', 3),
    (9, '2018-04-29', 2),
    (10, '2017-01-17', 2);
    
INSERT INTO artists (artist) VALUES
	('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon'),
    ('Tyler Isle'),
    ('Fog');

INSERT INTO followers_of_an_artist (artist_id, users_id) VALUES
	(1, 1),
    (4, 1),
    (3, 1),
    (1, 2),
    (3, 2),
    (2, 3),
    (1, 3),
    (4, 4),
    (5, 5),
    (6, 5),
    (6, 6),
    (3, 6),
    (1, 6),
    (2, 7),
    (5, 7),
    (1, 8),
    (5, 8),
    (6, 9),
    (4, 9),
    (3, 9),
    (2, 10),
    (6, 10);
    
INSERT INTO albums (album, artist_id) VALUES
	('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4),
    ('Library of liberty', 4),
    ('Chained Down', 5),
    ('Cabinet of fools', 5),
    ('No guarantees', 5),
    ('Apparatus', 6);
    
INSERT INTO release_years (date_release) VALUES
	('1990'),
    ('1993'),
    ('1995'),
    ('1998'),
    ('2001'),
    ('2003'),
    ('2007'),
    ('2012'),
    ('2015');
    
INSERT INTO songs (albums_id, song, release_year_id, duration) VALUES
	(1, 'Soul For Us', 1, 200),
    (1, 'Reflections Of Magic', 1, 163),
    (1, 'Dance With Her Own', 1, 116),
    (2, 'Troubles Of My Inner Fire', 2, 203),
    (2, 'Time Fireworks', 2, 152),
    (3, 'Magic Circus', 3, 105),
    (3, 'Honey, So Do I', 3, 207),
    (3, 'Sweetie, Let s Go Wild', 3, 139),
    (3, 'She Knows', 3, 244),
    (4, 'Fantasy For Me', 4, 100),
    (4, 'Celebration Of More', 4, 146),
    (4, 'Rock His Everything', 4, 223),
    (4, 'Home Forever', 4, 231),
    (4, 'Diamond Power', 4, 241),
    (4, 'Lets Be Silly', 4, 132),
    (5, 'Thang Of Thunder', 5, 240),
    (5, 'Words Of Her Life', 5, 185),
    (5, 'Without My Streets', 5, 176),
    (6, 'Need Of The Evening', 6, 190),
    (6, 'History Of My Roses', 6, 222),
    (6, 'Without My Love', 6, 111),
	(6, 'Walking And Game', 6, 123),
    (6, 'Young And Father', 6, 197),
    (7, 'Finding My Traditions', 7, 179),
	(7, 'Walking And Man', 7, 229),
    (7, 'Hard And Time', 7, 135),
    (7, 'Honey, Im A Lone Wolf', 7, 150),
	(8, 'She Thinks I Wont s Stay Tonight', 8, 166),
    (8, 'He Heard You re Bad For Me', 8, 154),
    (8, 'He Hopes We Can t Stay', 8, 210),
    (8, 'I Know I Know', 8, 117),
    (9, 'He s Walking Away', 9, 159),
    (9, 'He s Trouble', 9, 138),
    (9, 'I Heard I Want To Bo Alone', 9, 120),
    (9, 'I Ride Alone', 9, 151),
    (10, 'Honey', 9, 79),
    (10, 'You Cheated On Me', 9, 95),
    (10, 'Wouldn t It Be Nice', 9, 213),
    (10, 'Baby', 9, 136),
    (10, 'You Make Me Feel So..', 9, 83);
    
INSERT INTO reproduction_history (users_id, song_id, reproduction_date) VALUES
	(1, 36, '2020-02-28 10:45:55'),
    (1, 25, '2020-05-02 05:30:35'),
    (1, 23, '2020-03-06 11:22:33'),
    (1, 14, '2020-08-05 08:05:17'),
    (1, 15, '2020-09-14 16:32:22'),
    (2, 34, '2020-01-02 07:40:33'),
    (2, 24, '2020-05-16 06:16:22'),
    (2, 21, '2020-10-09 12:27:48'),
    (2, 39, '2020-09-21 13:14:46'),
    (3, 6, '2020-11-13 16:55:13'),
    (3, 3, '2020-12-05 18:38:30'),
    (3, 26, '2020-07-30 10:00:00'),
    (4, 2, '2021-08-15 17:10:10'),
    (4, 35, '2021-07-10 15:20:30'),
    (4, 27, '2021-01-09 01:44:33'),
    (5, 7, '2020-07-03 13:33:28'),
    (5, 12, '2017-02-24 21:14:22'),
    (5, 14, '2020-08-06 15:23:43'),
    (5, 1, '2020-11-10 13:52:27'),
    (6, 38, '2019-02-07 20:33:48'),
    (6, 29, '2017-01-24 00:31:17'),
    (6, 30, '2017-10-12 12:35:20'),
    (6, 22, '2018-05-29 14:56:41'),
    (7, 5, '2018-05-09 22:30:49'),
    (7, 4, '2020-07-27 12:52:58'),
    (7, 11, '2018-01-16 18:40:43'),
    (8, 39, '2018-03-21 16:56:40'),
    (8, 40, '2020-10-18 13:38:05'),
    (8, 32, '2019-05-25 08:14:03'),
    (8, 33, '2021-08-15 21:37:09'),
    (9, 16, '2021-05-24 17:23:45'),
    (9, 17, '2018-12-07 22:48:52'),
    (9, 8, '2021-03-14 06:14:26'),
    (9, 9, '2020-04-01 03:36:00'),
    (10, 20, '2017-02-06 08:21:34'),
    (10, 21, '2017-12-04 05:33:43'),
    (10, 12, '2017-07-27 05:24:49'),
    (10, 13, '2017-12-25 01:03:57');