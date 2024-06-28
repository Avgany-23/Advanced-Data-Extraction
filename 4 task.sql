-- 1.Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT name_album
FROM Albums JOIN SingersAlbums ON album_id = Albums.id
JOIN Singers ON singer_id = Singers.id
WHERE (SELECT COUNT(*) FROM SingersGenre WHERE singer_id = Singers.id) >= 2;


-- 2.Наименования треков, которые не входят в сборники.
SELECT name_song
FROM CollectionsSongs RIGHT JOIN Songs ON Songs.id = CollectionsSongs.song_id
WHERE CollectionsSongs.id IS NULL;


-- 3.Исполнитель или исполнители, написавшие самый короткий по 
-- продолжительности трек, — теоретически таких треков может быть несколько.

WITH MinSong AS
(SELECT duration
FROM Singers JOIN SingersAlbums ON Singers.id = singer_id
JOIN Albums ON Albums.id = album_id
JOIN Songs ON Songs.album_id = Albums.id
ORDER BY duration
LIMIT 1)

SELECT name, surname, nickname
FROM Singers JOIN SingersAlbums ON Singers.id = singer_id
JOIN Albums ON Albums.id = album_id
JOIN Songs ON Songs.album_id = Albums.id
WHERE duration = (SELECT * FROM MinSong);


-- 4.Названия альбомов, содержащих наименьшее количество треков.
WITH MinSong AS
(SELECT COUNT(*) AS count
FROM Albums JOIN Songs ON album_id = Albums.id
GROUP BY name_album
ORDER BY count
LIMIT 1)

SELECT name_album
FROM Albums JOIN Songs ON album_id = Albums.id
GROUP BY name_album
HAVING COUNT(*) = (SELECT * FROM MinSong);