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
--protseduuri loomine
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
--kutse
EXEC lisaUudis 'windows 11', '2025-02-06', 'õpetaja Pant', 'win11 ei tööta multimeedia klassis';
--teine kutse võimalus
EXEC lisaUudis 
@uusTeema = '1.märts on juba kevad',
@paev = '2025-02-06',
@autor = 'test',
@kirjeldus = 'puudub';
