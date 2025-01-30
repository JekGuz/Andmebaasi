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



