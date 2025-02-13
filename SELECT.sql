use autoGuzek;
CREATE TABLE laps(
lapsID int primary key identity(1,1),
nimi varchar(10) not null,
pikkus smallint,
synniaasta smallint,
synnilinn varchar(20),
);
SELECT * FROM laps; 
-- выбрать таблицу чтобы увидить ее
-- Sisesatme Table
INSERT INTO laps(nimi, pikkus, synniaasta, synnilinn)
VALUES
('Kati', 156, 2001, 'Tallinn'),
('Ira', 150, 2009, 'Tartu'),
('Sati', 170, 2000, 'Tallinn'),
('Tati', 126, 2003, 'Parnu'),
('Nuti', 166, 2005, 'Keila');

--sorteerimine
-- ASC, DESC- suurimast väikseni
SELECT nimi, pikkus
FROM laps
ORDER by pikkus DESC;

-- не сколько столбцов для сортировки перечисляются через запятую
SELECT nimi, pikkus
FROM laps
ORDER by pikkus DESC, nimi;

--lapsed, mis on sündinud peale 2005, математически функции работает, сортировка самая последняя
SELECT nimi, synniaasta
FROM laps
WHERE synniaasta >=2005
ORDER by nimi;

-- DISTINCT -если есть надобность узнать все значение которые больще 2000, например есть 2001 больше чем один раз покажит его один раз
-- DISTINCT - näitab ainult 1 kordus
SELECT DISTINCT synniaasta
FROM laps
WHERE synniaasta >2000;

-- BETWEEN
-- lapsed mis on sündinud (2000 kuni 2005)
SELECT nimi, synniaasta
FROM laps
WHERE synniaasta >=2000 AND synniaasta <=2005

SELECT nimi, synniaasta
FROM laps
WHERE synniaasta BETWEEN 2000 AND 2005

--LIKE
-- näita lapsed, kelle nimi akgab K
-- % kõik võimalikud sümboolid
SELECT nimi
FROM laps
WHERE nimi LIKE 'K%';
-- siseldab k täht - %K%
SELECT nimi
FROM laps
WHERE nimi LIKE '%K%';

-- täpsem määratus tähtede arv _ - нижнее подчеркивая определяет точное количество букв 
SELECT nimi
FROM laps
WHERE nimi like '_a__';

SELECT nimi, synnilinn
FROM laps
WHERE nimi LIKE 'I%' OR synnilinn like 'Tallinn';

SELECT nimi, synnilinn
FROM laps
WHERE nimi LIKE 'I%' AND synnilinn like 'Tallinn';

-- сортировка всегда в конце!!!!!!!!!!!!!
-- Agreegatfunktsioonid:
-- SUM, AVG, MIN, MAX, COUNT(количество заполненых клеточек)
SELECT COUNT(nimi) AS lapsteArv
FROM laps;

SELECT SUM(pikkus) AS 'summarne pikkus'
FROM laps;

SELECT AVG(pikkus) AS 'keskmine pikkus'
FROM laps;

SELECT AVG(pikkus) AS 'keskmine pikkus'
FROM laps
WHERE synnilinn = 'Tallinn';

-- Средний рост по городам
-- näita keskmine pikkus linnade järgi
-- GROUP by - групировать
SELECT synnilinn, AVG(pikkus) AS 'keskmine pikkus'
FROM laps
GROUP by synnilinn

--näita laste arv, mis on sündinud kontreetsel sünniasata
SELECT synniaasta, COUNT(nimi) AS lasteArv
FROM laps
GROUP by synniaasta;

--HAVING - piirang juba grupperitud andmete ost
-- ограничение уже к сортированых данных, having после групировки записывается
--keskmine pikkus iga synniaasta jargi
SELECT synniaasta, AVG(pikkus) AS kesmine
FROM laps
GROUP by synniaasta
HAVING AVG(pikkus)>150;

-- WHERE до группировки
SELECT synniaasta, AVG(pikkus) AS kesmine
FROM laps
WHERE synniaasta = 2001
GROUP by synniaasta

-- NOT отрицания, все кроме значения
SELECT synniaasta, AVG(pikkus) AS kesmine
FROM laps
WHERE NOT synniaasta = 2001
GROUP by synniaasta

--seotud tabel 
  -- CREATE TABLE
CREATE TABLE loom(
loomID int Primary key identity(1,1),
loomaNimi varchar(50),
lapsID int,
FOREIGN KEY (lapsID) REFERENCES laps(lapsID),
);
INSERT INTO loom(loomaNimi, lapsID)
VALUES('kass Kott', 1),
('koer Mott', 1),
('hamster Milli', 1),
('kass Molly', 2),
('koer Kim', 3),
('hamster Olev',4),
('kilpkonn', 3);

SELECT * FROM loom;

--SELECT seotud tabelite põhjal
-- SELECT для связаных таблиц
SELECT * FROM loom, laps; -- ei näita õiged andmed

-- INNER JOIN -связи с таблицей
SELECT * FROM loom
INNER JOIN laps
ON loom.lapsID = laps.lapsID; --на одной вторичный ключ, на второй первичный ключ

-- lihtne vaade
SELECT * FROM loom, laps
WHERE loom.lapsID = laps.lapsID;

-- с псехдонимами l. и la так же перечисляем какие таблицы показывать через SELECT 
SELECT l.loomaNimi, la.nimi, la.synniaasta
FROM loom l, laps la
WHERE l.lapsID = la.lapsID;


