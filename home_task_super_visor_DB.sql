--количество исполнителей в каждом жанре;
  SELECT g.name, COUNT(e.id)  
    FROM genre g
         JOIN execuant_genre eg 
         ON g.id = eg.genre_id 
         JOIN execuant e 
         ON eg.execuant_id = e.id 
GROUP BY g.name
ORDER BY COUNT(e.id) DESC;

--количество треков, вошедших в альбомы 2019-2020 годов;
  SELECT COUNT(s.id) count_treck 
    FROM album a  
         JOIN song s 
         ON a.id = s.album_id
   WHERE (a.year_of_ussue = 2019 
      OR a.year_of_ussue = 2020)
ORDER BY count_treck DESC;

--средняя продолжительность треков по каждому альбому
  SELECT a.name, AVG(CAST(duration AS time)) avg_duration 
    FROM album a  
         JOIN song s 
         ON a.id = s.album_id
GROUP BY a.name
ORDER BY avg_duration  DESC;


--все исполнители, которые не выпустили альбомы в 2020 году;
 SELECT e.name, a.year_of_ussue 
   FROM album_execuant ae  
        JOIN album a  
        ON ae.album_id = a.id
        JOIN execuant e 
        ON ae.execuant_id = e.id
   WHERE (a.year_of_ussue != 2020)
ORDER by e.name DESC;

--названия сборников, в которых присутствует конкретный исполнитель ('Любэ')
  SELECT col.name 
    FROM album_execuant ae  
         JOIN execuant e 
         ON ae.execuant_id = e.id 
         JOIN album a    
         ON ae.album_id = a.id
         JOIN song s     
         ON a.id = s.album_id
         JOIN assembly_song as2  
         ON s.id = as2.song_id
         JOIN assembly col 
         ON col.id = as2.assembly_id
   WHERE e.name  
    LIKE 'Любэ'
GROUP BY col.name;


--название альбомов, в которых присутствуют исполнители более 1 жанра;
  SELECT a.name 
    FROM execuant_genre eg 
        JOIN genre g 
        ON eg.genre_id = g.id 
        JOIN execuant e 
        ON eg.execuant_id = e.id 
        JOIN album_execuant ae 
        ON e.id = ae.execuant_id 
        JOIN album a 
        ON ae.album_id  = a.id
GROUP BY a.name
  HAVING COUNT(DISTINCT g.name)>1;

--наименование треков, которые не входят в сборники;
SELECT s.name 
  FROM assembly_song as2 
       RIGHT JOIN song s 
       ON as2.song_id = s.id
       LEFT JOIN assembly a2
       ON as2.assembly_id = a2.id 
 WHERE as2.assembly_id IS NULL;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT e.name  
  FROM album_execuant ae 
           JOIN execuant e  
           ON ae.execuant_id  = e.id 
           JOIN album a2  
           ON ae.album_id  = a2.id 
           JOIN song s 
           ON a2.id = s.album_id 
 WHERE (CAST(duration AS time) IN
           (SELECT MIN(CAST(duration AS time)) 
              FROM song));

--название альбомов, содержащих наименьшее количество треков
  SELECT a.name 
    FROM album a  
         JOIN song s 
           ON a.id = s.album_id
GROUP BY  a.name
HAVING COUNT(s.id) =
       (SELECT COUNT(s.id) Q
         FROM song s
         JOIN album a 
         ON a.id = s.album_id
         GROUP BY a.id
         ORDER BY Q
         LIMIT 1)
ORDER BY a.name;


