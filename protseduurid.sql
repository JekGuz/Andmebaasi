-- SQL SALVESTATUD PROTSEDUURID -- Funktsioonid - mitu SQL käsku käivitakse järjest
-- SQL server

CREATE DATABASE procTARgv24;

USE procTARgv24;
CREATE TABLE uudised(
uudised_ID int PRIMARY KEY identity(1,1),
uudise_Teema varchar(50),
kuupae date,
autor varchar(25),
kirjeldus text
)

SELECT * FROM uudised;
INSERT INTO uudised(
uudise_Teema, kuupae, autor, kirjeldus)
VALUES(
'udune ilm', '2025-02-06', 'postimees', 'Lõunani fog')
-- protseduuri loomine
-- sisestab uudised tabelisse ja kohe näitab

CREATE PROCEDURE lisaUudis
@uusTeema varchar(50),
@paev date,
@autor varchar(20),
@kirjeldus text
AS
BEGIN

INSERT INTO uudised(
uudise_Teema, kuupae, autor, kirjeldus)
VALUES(
@uusTeema, @paev, @autor, @kirjeldus);
SELECT * FROM uudised;

END;
-- esimene kutse võimalus
EXEC lisaUudis 'windows 11', '2025-02-06', 'õpetaja Pant', 'win11 ei tööta multimeedia klassis';
-- teine kutse võimalus
EXEC lisaUudis 
@uusTeema = '1.märts on juba kevad',
@paev = '2025-02-06',
@autor = 'test',
@kirjeldus = 'puudub';

-- protseduur, mis kustutamine tabelist ID järgi
CREATE PROCEDURE kustutaUudis
@id int
AS
BEGIN
SELECT * FROM uudised;
DELETE FROM uudised WHERE uudised_ID = @id;
SELECT * FROM uudised;
END;
-- kutseme protseduur kustuta 1
EXEC kustutaUudis 3;
-- kutseme protseduur kustuta 2
EXEC kustutaUudis @id = 3;


-- UDETE
UPDATE uudised SET kirjeldus = 'uus kirjeldus'
WHERE kirjeldus LIKE 'puudub';
SELECT * FROM uudised;

-- pritseduur mis uuendab andmed tabelis/UPDATE
CREATE PROCEDURE uuendaKirjeldus
@uuskirjeldus text
AS
BEGIN
SELECT * FROM uudised;
UPDATE uudised SET kirjeldus = @uuskirjeldus
WHERE kirjeldus LIKE 'puudub';
SELECT * FROM uudised;
END;

-- kutse
EXEC uuendaKirjeldus 'uus tekst kirjelduses';
EXEC uuendaKirjeldus @uuskirjeldus = 'uus tekst kirjelduses';

-- protseduur mis otsib ja näitab uudist esimese tähte järgi ('%' - sest otsime mitte üks täht)

CREATE PROCEDURE otsingUudiseTeema
@taht char(1)
AS
BEGIN 
SELECT * FROM uudised
WHERE uudise_Teema LIKE @taht +'%';
END;
-- kutse
EXEC otsingUudiseTeema 'w';
EXEC otsingUudiseTeema @taht = 'w';

-- XSAMP
CREATE DATABASE procTARgv24;

USE procTARgv24;
CREATE TABLE uudised(
uudised_ID int PRIMARY KEY AUTO_INCREMENT,
uudise_Teema varchar(50),
kuupae date,
autor varchar(25),
kirjeldus text
)

SELECT * FROM uudised;
INSERT INTO uudised(
uudise_Teema, kuupae, autor, kirjeldus)
VALUES(
'udune ilm', '2025-02-06', 'postimees', 'Lõunani fog')

  
-- PROTCEDURE XSAMP
CREATE PROCEDURE `lisaUudis`(IN `uusTeema` VARCHAR(50), IN `paev` DATE, IN `autor` VARCHAR(25), 
  IN `kirjeldus` TEXT) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER 
  BEGIN INSERT INTO uudised( uudise_Teema, kuupae, autor, kirjeldus) 
  VALUES( uusTeema, paev, autor, kirjeldus); SELECT * FROM uudised; 
END;

CALL lisauudis('windows 11', '2025-02-06', 'õpetaja Pant', 'win11 ei tööta multimeedia klassis');


