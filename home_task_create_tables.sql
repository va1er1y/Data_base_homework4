--Создание таблиц

CREATE TABLE IF NOT EXISTS Genre (
	PRIMARY key (id),
	id          SERIAL,
	name        VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Execuant (
	PRIMARY KEY (id),
	id          SERIAL,  
	name        VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Execuant_Genre (
    genre_id   	iNTEGER REFERENCES  Genre(id),
    execuant_id iNTEGER REFERENCES Execuant(id),
                CONSTRAINT pk PRIMARY KEY (genre_id, execuant_id)
);
ALTER TABLE Execuant_Genre
        ADD id SERIAL;

CREATE TABLE IF NOT EXISTS Album(
    PRIMARY KEY   (id),
	id            SERIAL,
	name          VARCHAR(40) NOT NULL,
	year_of_ussue INTEGER     NOT NULL,
	              CHECK	(year_of_ussue BETWEEN 0 AND 9999)
);

CREATE TABLE IF NOT EXISTS Album_Execuant(
    execuant_id   iNTEGER REFERENCES Execuant(id),
    album_id      iNTEGER REFERENCES  Album(id),
                  CONSTRAINT key_album_execuant PRIMARY KEY (execuant_id, album_id)
);

ALTER TABLE Album_Execuant
        ADD id SERIAL;

CREATE TABLE IF NOT EXISTS Song(
    PRIMARY KEY   (id),
	id            SERIAL,
    name          VARCHAR(40) NOT NULL,
	duration      VARCHAR(10) NOT null,
	album_id      INTEGER  NOT NULL   REFERENCES  Album(id)	
);

CREATE TABLE IF NOT EXISTS Assembly (
    PRIMARY KEY    (id),
	id             SERIAL,
	name           VARCHAR(80) NOT NULL,
	year_of_ussue  INTEGER     NOT NULL,
	               CHECK	(year_of_ussue BETWEEN 0 AND 9999)
);

CREATE TABLE IF NOT EXISTS Assembly_Song(
    assembly_id   iNTEGER REFERENCES Assembly(id),
    song_id       iNTEGER REFERENCES  Song(id),
                  CONSTRAINT key_assembly_song PRIMARY KEY (assembly_id, song_id)
);

ALTER TABLE Assembly_Song
        ADD id SERIAL;

--Заполнение таблиц

INSERT INTO Genre (name)
     VALUES ('Альтернативный метал');
INSERT INTO Genre (name)
     VALUES ('Поп');
INSERT INTO Genre (name)
     VALUES ('Рок');
INSERT INTO Genre (name)
     VALUES ('Хеви-метал');
INSERT INTO Genre (name)
     VALUES ('Транс');
    
INSERT INTO Execuant (name)
     VALUES ('Amatory');
INSERT INTO Execuant (name)
     VALUES ('Дюна');
INSERT INTO Execuant (name)
     VALUES ('Любэ');
INSERT INTO Execuant (name)
     VALUES ('Metallica');
INSERT INTO Execuant (name)
     VALUES ('Bobina');
INSERT INTO Execuant (name)
     VALUES ('Armin van Burren');
INSERT INTO Execuant (name)
     VALUES ('Пилот');
INSERT INTO Execuant (name)
     VALUES ('Филипп Киркоров');
    
INSERT INTO execuant_genre (genre_id, execuant_id)
     VALUES (1,1);
INSERT INTO execuant_genre (genre_id, execuant_id)
     VALUES (2,2);
INSERT INTO execuant_genre (genre_id, execuant_id)
     VALUES (2,8);
INSERT INTO execuant_genre (genre_id, execuant_id)
     VALUES (3,3);
INSERT INTO execuant_genre (genre_id, execuant_id)
     VALUES (3,7);
INSERT INTO execuant_genre (genre_id, execuant_id)
     VALUES (4,4);
INSERT INTO execuant_genre (genre_id, execuant_id)
     VALUES (5,5);
INSERT INTO execuant_genre (genre_id, execuant_id)
     VALUES (5,6);     
INSERT INTO execuant_genre (genre_id, execuant_id)
     VALUES (1,3); 
    
INSERT INTO Album (name, year_of_ussue)
     VALUES ('Чернобелые дни',2006);
INSERT INTO Album (name, year_of_ussue)
     VALUES ('Привет  с большого бодуна',1996);
INSERT INTO Album (name, year_of_ussue)
     VALUES ('Комбат',1996);
INSERT INTO Album (name, year_of_ussue)
     VALUES ('St.Anger',2003);
INSERT INTO Album (name, year_of_ussue)
     VALUES ('Targets',2019);
INSERT INTO Album (name, year_of_ussue)
     VALUES ('Intense',2018);
INSERT INTO Album (name, year_of_ussue)
     VALUES ('Рыба крот и свинья',2004);
INSERT INTO Album (name, year_of_ussue)
     VALUES ('Я',2018);
    
INSERT INTO album_execuant (execuant_id, album_id)
     VALUES (1,1);
INSERT INTO album_execuant (execuant_id, album_id)
     VALUES (2,2);
INSERT INTO album_execuant (execuant_id, album_id)
     VALUES (3,3);
INSERT INTO album_execuant (execuant_id, album_id)
     VALUES (4,4);
INSERT INTO album_execuant (execuant_id, album_id)
     VALUES (5,5);
INSERT INTO album_execuant (execuant_id, album_id)
     VALUES (6,6);
INSERT INTO album_execuant (execuant_id, album_id)
     VALUES (7,7);
INSERT INTO album_execuant (execuant_id, album_id)
     VALUES (8,8);
    
    
INSERT INTO Song (name, duration, album_id)
     VALUES ('Осколки', '2:46', 1);
INSERT INTO Song (name, duration, album_id)
     VALUES ('Дыши со мной', '3:56', 1);
INSERT INTO Song (name, duration, album_id)
     VALUES ('Фирма', '4:18', 2);
INSERT INTO Song (name, duration, album_id)
     VALUES ('Гринпис', '3:06', 2);	
INSERT INTO Song (name, duration, album_id)
     VALUES ('Улочки московские', '4:17', 3);
INSERT INTO Song (name, duration, album_id)
     VALUES ('Самоволочка', '3:12', 3);
INSERT INTO Song (name, duration, album_id)
     VALUES ('my', '5:46', 6);		
INSERT INTO Song (name, duration, album_id)
     VALUES ('St.Anger', '7:21', 4);	
INSERT INTO Song (name, duration)
     VALUES ('The Mission', '5:31', 4);
INSERT INTO Song (name, duration, album_id)
     VALUES ('Targets', '14:18', 5);
INSERT INTO Song (name, duration, album_id)
     VALUES ('Intense', '8:47', 5);
INSERT INTO Song (name, duration, album_id)
     VALUES ('Pulsar', '6:31', 6);	
INSERT INTO Song (name, duration, album_id)
     VALUES ('Рок', '4:15', 7);	
INSERT INTO Song (name, duration, album_id)
     VALUES ('Блюз', '3:28',7);
INSERT INTO Song (name, duration, album_id)
     VALUES ('Ты мое счастье', '5:20',8);	
INSERT INTO Song (name, duration, album_id)
     VALUES ('Гонка', '8:45', 8);
INSERT INTO Song (name, duration, album_id)
     VALUES ('Demo', '6:56', 8);
    
--Забыл указать ключи на альбомы - добавил, так же выше при обновлении добавил.
update Song set album_id = 8 
 where id =16;

INSERT INTO Assembly (name, year_of_ussue)
     VALUES ('Холодные окна',2018);
INSERT INTO Assembly (name, year_of_ussue)
     VALUES ('Брат2',2015);
INSERT INTO Assembly (name, year_of_ussue)
     VALUES ('Тариф новогодний', 2020);
INSERT INTO Assembly (name, year_of_ussue)
     VALUES ('Филькина грамота',2022);
INSERT INTO Assembly (name, year_of_ussue)
     VALUES ('Эти колокольчики', 2019);
INSERT INTO Assembly (name, year_of_ussue)
     VALUES ('Колбасный цех',2011);
INSERT INTO Assembly (name, year_of_ussue)
     VALUES ('Рваные кеды',2004);
INSERT INTO Assembly (name, year_of_ussue)
     VALUES ('Это по любви',2006);

	
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (1,1);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (1,2);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (2,3);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (2,4);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (3,5);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (3,6);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (4,7);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (4,8);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (5,9);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (5,10);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (6,11);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (6,12);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (7,13);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (7,14);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (8,15);
INSERT INTO assembly_song (assembly_id, song_id)
     VALUES (8,16);   
    
 ------Выбор данных из таблицы
    
SELECT name, year_of_ussue 
 FROM Album
WHERE year_of_ussue = 2018;

SELECT name, duration
 FROM Song
 WHERE duration = (SELECT MAX (duration)FROM song);

SELECT name, duration
  FROM Song
 WHERE duration >= '3:30';

SELECT name, year_of_ussue 
 FROM Assembly
WHERE year_of_ussue >= 2018 and year_of_ussue <= 2020;

SELECT name, duration
  FROM song
 WHERE name NOT LIKE '% %';

SELECT name FROM Song
 WHERE (name LIKE '%my%') or (name LIKE '%мой%');
    