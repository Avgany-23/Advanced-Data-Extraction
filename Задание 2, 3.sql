-- ЗАДАНИЕ 2
-- 1. Название и продолжительность самого длительного трека.
SELECT name_song
FROM Songs
ORDER BY duration DESC
LIMIT 1

	
-- 2. Название треков, продолжительность которых не менее 3,5 минут.
SELECT name_song
FROM Songs
WHERE duration >= 60 * 3 + 30

	
-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title
FROM Collections
WHERE year_release BETWEEN 2018 AND 2020

	
-- 4.Исполнители, чьё имя состоит из одного слова.
SELECT *
FROM  Singers
WHERE NOT nickname LIKE '% %'

	
-- 5.Название треков, которые содержат слово «мой» или «my».
-- Через регулярки
SELECT *
FROM  Songs
WHERE LOWER(name_song) ~* '\s(my|мой)\s|^(my|мой)\s|\s(my|мой)$|(мой|my)'
-- Череле ILIKE 
SELECT *
FROM  Songs
WHERE name_song ILIKE 'my%'
OR name_song ILIKE '%my%'
OR name_song ILIKE '%my'
OR name_song ILIKE 'my'
OR name_song ILIKE 'мой%'
OR name_song ILIKE '%мой%'
OR name_song ILIKE '%мой'
OR name_song ILIKE 'мой'
-- Через string_to_array 
SELECT *
FROM  Songs
WHERE string_to_array(LOWER(name_song), ' ') && ARRAY ['мой', 'my']


-- ЗАДАНИЕ 3
-- 1.Количество исполнителей в каждом жанре.
SELECT (SELECT title 
        FROM Genres 
        WHERE id = SingersGenre.genre_id) AS genre,   
       COUNT(*) AS count_singers 
FROM  SingersGenre
GROUP BY genre_id


-- 2.Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(*)
FROM  Albums JOIN Songs ON Songs.album_id = Albums.id
WHERE Albums.date_release BETWEEN '2019-01-01' AND '2020-12-31'


-- 3.Средняя продолжительность треков по каждому альбому.
SELECT name_album, ROUND(AVG(duration), 1) AS average_second_songs_album
FROM  Albums JOIN Songs ON Songs.album_id = Albums.id
GROUP BY name_album
ORDER BY average_second_songs_album 


-- 4.Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT *
FROM Singers
WHERE 2020 NOT IN (SELECT EXTRACT(YEAR FROM date_release::date) 
	FROM Albums 
	WHERE id = ANY (SELECT album_id FROM SingersAlbums WHERE singer_id = Singers.id))  


-- 5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT title
FROM Collections JOIN CollectionsSongs ON CollectionsSongs.collection_id = Collections.id
JOIN Songs ON song_id = Songs.id
JOIN Albums ON album_id = Albums.id
JOIN SingersAlbums ON SingersAlbums.album_id = Albums.id
JOIN Singers ON Singers.id = singer_id
WHERE nickname = 'Лизер'
