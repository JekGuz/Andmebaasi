CREATE DATABASE TARgvGuzek;

USE TARgvGuzek;
CREATE TABLE film(
fiml_ID int PRIMARY KEY identity(1,1), 
film_nimetus varchar(30) not null,
aasta int, 
eelarve_hind decimal(7,1)
);
SELECT * FROM film;

-- Kustutatmine - DROP TABLE
DROP TABLE film;

--admete sisstamine tablisse
INSERT INTO film(film_nimetus, aasta, eelarve_hind)
VALUES('BabyShark', 2022, 20520.5),
('Babygirl', 2024, 555555.5),
('Riply', 2024, 22000.5),
('Barby', 2023, 10000.7);

DELETE FROM film WHERE fiml_ID=6

-- NEW TABLE
CREATE TABLE zanr(
zanr_ID int PRIMARY KEY identity(1,1),
zanr_nimetus varchar(20) UNIQUE
)

INSERT INTO zanr(zanr_nimetus)
VALUES('draama'), ('detektiiv'), ('perefilm'), ('armastus'), ('komedia')
SELECT * FROM zanr

--tabele film struktuuri muutmine
ALTER TABLE film ADD zanr_ID int;
SELECT * From film;

--tabele film struktuuri muutmine
-- FK lisamine mis on seotud tablega zanr(zanr_ID)
ALTER TABLE film ADD CONSTRAINT fk_zanr
FOREIGN KEY (zanr_ID) REFERENCES zanr(zanr_ID);

SELECT * FROM film;
SELECT * FROM zanr;
UPDATE film SET zanr_ID=5 WHERE fiml_ID=9

---------------------------------------------
USE TARgvGuzek;
CREATE TABLE rezisoor( 
  rezisoor_ID int PRIMARY KEY identity(1,1), 
  nimi varchar(30), 
  synniaeg date, 
  riik varchar(15) 
  );

DROP TABLE rezisoor;

SELECT * FROM rezisoor;

INSERT INTO rezisoor(nimi, synniaeg, riik)
VALUES('Jekaterina', '2000-11-04', 'Eesti'),
('Mirra', '2001-09-06', 'London'),
('Anne-ly', '2001-01-2', 'France'),
('Norra', '2005-09-2', 'New-York');

ALTER TABLE film ADD rezisoor_ID int;

ALTER TABLE film ADD CONSTRAINT fk_rezisoor
FOREIGN KEY (rezisoor_ID) REFERENCES rezisoor(rezisoor_ID);

UPDATE film SET rezisoor_ID=1 WHERE fiml_ID=1

UPDATE film SET rezisoor_ID=2 WHERE fiml_ID=7

UPDATE film SET rezisoor_ID=3 WHERE fiml_ID=8

UPDATE film SET rezisoor_ID=4 WHERE fiml_ID=9

SELECT * FROM film;

USE TARgvGuzek;
CREATE TABLE kinokava( 
  kinokava_ID int PRIMARY KEY identity(1,1), 
  vaba_koht int,
  kuupaev date
  );

INSERT INTO kinokava(vaba_koht, kuupaev)
VALUES('5', '2025-01-30'),
('10', '2025-01-30'),
('25', '2025-01-30'),
('75', '2025-01-30');

ALTER TABLE kinokava ADD fiml_ID int;


ALTER TABLE kinokava ADD CONSTRAINT fk_film
FOREIGN KEY (fiml_ID) REFERENCES film(fiml_ID);

UPDATE kinokava SET fiml_ID=1 WHERE kinokava_ID=1

UPDATE kinokava SET fiml_ID=7 WHERE kinokava_ID=2

UPDATE kinokava SET fiml_ID=8 WHERE kinokava_ID=3

UPDATE kinokava SET fiml_ID=9 WHERE kinokava_ID=4

SELECT * FROM kinokava;

