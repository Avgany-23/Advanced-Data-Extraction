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
	   (3, 2),
	   (4, 1),
	   (2, 4),
	   (5, 2);

INSERT INTO SingersGenre (genre_id, singer_id)
VALUES (2, 1),
	   (2, 2),
	   (1, 3),
	   (3, 4),
	   (3, 5);

INSERT INTO SingersAlbums (singer_id, album_id)
VALUES (1, 1),
	   (2, 2),
	   (3, 4),
	   (4, 3),
	   (5, 5);