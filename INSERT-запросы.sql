DROP TABLE IF EXISTS Genres CASCADE;
DROP TABLE IF EXISTS Singers CASCADE;
DROP TABLE IF EXISTS Albums CASCADE;
DROP TABLE IF EXISTS SingersGenre CASCADE;
DROP TABLE IF EXISTS SingersAlbums CASCADE;
DROP TABLE IF EXISTS Songs CASCADE;
DROP TABLE IF EXISTS Collections CASCADE;
DROP TABLE IF EXISTS CollectionsSongs CASCADE;

CREATE TABLE IF NOT EXISTS Genres
(
	id SERIAL PRIMARY KEY,
    title VARCHAR(40) DEFAULT 'NoName' NOT NULL
);


CREATE TABLE IF NOT EXISTS Singers
(
	id SERIAL PRIMARY KEY,
    name VARCHAR(20) DEFAULT 'NoName' NOT NULL,
    surname VARCHAR(20) DEFAULT 'NoSurname' NOT NULL,
	nickname VARCHAR(50) DEFAULT 'NoName' NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums
(
	id SERIAL PRIMARY KEY,
    name_album VARCHAR(50) NOT NULL,
    date_release DATE CHECK (date_release > '1900-01-01') NOT NULL
);

CREATE TABLE IF NOT EXISTS SingersGenre
(
	id SERIAL PRIMARY KEY,
    genre_id INT,
    singer_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genres (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (singer_id) REFERENCES Singers (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS SingersAlbums
(
	id SERIAL PRIMARY KEY,
    singer_id INT,
    album_id INT,
    FOREIGN KEY (singer_id) REFERENCES Singers (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (album_id) REFERENCES Albums (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Songs
(
	id SERIAL PRIMARY KEY,
    album_id INT,
    name_song VARCHAR(50) CHECK (name_song != '') NOT NULL,
    date_release DATE CHECK (date_release > '1900-01-01') NOT NULL,
    duration INT CHECK (duration > 0) NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Collections
(
	id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    year_release INT NOT NULL

);

CREATE TABLE IF NOT EXISTS CollectionsSongs
(
	id SERIAL PRIMARY KEY,
    song_id INT,
    collection_id INT,
    FOREIGN KEY (song_id) REFERENCES Songs (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (collection_id) REFERENCES Collections (id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Singers (name, surname, nickname)
VALUES ('Глеб', 'Викторов', 'Три дня дождя'),
	   ('Серафим', 'Сидорин', 'Мукка'),
	   ('Арсен', 'Магомадов', 'Лизер'),
	   ('Максим', 'Корж', 'Макс Корж'),
       ('Иван', 'Засидкевич', 'Dabro');

INSERT INTO Genres (title)
VALUES ('Рэп'),
	   ('Рок'),
	   ('Хип-Хоп');

INSERT INTO Albums (name_album, date_release)
VALUES ('Melancholia', '2023-10-19'),
	   ('Мертвые цветы', '2022-12-22'),
	   ('Жить в кайф', '2013-10-21'),
	   ('Не ангел', '2019-04-19'),
       ('Мой путь', '2020-01-24');    

INSERT INTO Songs (album_id, name_song, date_release, duration)
VALUES (4, 'Молодым', '2019-04-19', 208),
	   (3, 'Мотылёк', '2013-10-21', 236),
	   (1, 'За край', '2023-10-19', 201),
	   (3, 'Жить в кайф', '2013-10-21', 236),
	   (2, 'Мертвые цветы', '2022-12-22', 174),
	   (2, 'После тебя', '2022-12-22', 246),
	   (1, 'Кристаллические лярвы', '2023-10-19', 223),
	   (4, 'Из этого города', '2019-04-19', 271),
       (5, 'Мой путь', '2020-01-24', 237); 

INSERT INTO Collections (title, year_release)
VALUES ('Сборник 1', '2023'),
	   ('Сборник 2', '2019'),
	   ('Сборник 3', '2021'),
	   ('Сборник 4', '2023');

INSERT INTO CollectionsSongs (song_id, collection_id)
VALUES (1, 2),
	   (7, 3),
	   (8, 2),
	   (4, 1),
	   (2, 4),
	   (5, 2);

INSERT INTO SingersGenre (genre_id, singer_id)
VALUES (2, 1),
	   (2, 2),
	   (1, 3),
	   (3, 4),
	   (3, 5),
	   (1, 1);

INSERT INTO SingersAlbums (singer_id, album_id)
VALUES (1, 1),
	   (2, 2),
	   (3, 4),
	   (4, 3),
	   (5, 5);