CREATE TABLE film(
fiml_ID int PRIMARY KEY AUTO_INCREMENT, 
film_nimetus varchar(30) not null,
aasta int, 
eelarve_hind decimal(7,1)
);

INSERT INTO film(film_nimetus, aasta, eelarve_hind)
VALUES('BabyShark', 2022, 20520.5),
('Babygirl', 2024, 555555.5),
('Riply', 2024, 22000.5),
('Barby', 2023, 10000.7);

CREATE TABLE zanr(
zanr_ID int PRIMARY KEY AUTO_INCREMENT,
zanr_nimetus varchar(20) UNIQUE
);

INSERT INTO zanr(zanr_nimetus)
VALUES('draama'), ('detektiiv'), ('perefilm'), ('armastus'), ('komedia')

ALTER TABLE film ADD zanr_ID int;

ALTER TABLE film ADD CONSTRAINT fk_zanr
FOREIGN KEY (zanr_ID) REFERENCES zanr(zanr_ID);

UPDATE film SET zanr_ID=3 WHERE fiml_ID=1
  
UPDATE film SET zanr_ID=2 WHERE fiml_ID=2
  
UPDATE film SET zanr_ID=4 WHERE fiml_ID=3
  
UPDATE film SET zanr_ID=1 WHERE fiml_ID=4

-----------------------------------------
CREATE TABLE rezisoor( 
  rezisoor_ID int PRIMARY KEY AUTO_INCREMENT, 
  nimi varchar(30) not null, 
  synniaeg date, 
  riik varchar(15) 
  );

INSERT INTO rezisoor(nimi, synniaeg, riik)
VALUES('Jekaterina', 2014-11-04, 'Eesti'),
('Mirra', 2016-09-06, 'London'),
('Anne-ly', 2015-01-2, 'France'),
('Norra', 2014-09-2, 'New-York');

ALTER TABLE film ADD rezisoor_ID int;

ALTER TABLE film ADD CONSTRAINT fk_rezisoor
FOREIGN KEY (rezisoor_ID) REFERENCES rezisoor(rezisoor_ID);

UPDATE film SET rezisoor_ID=1 WHERE fiml_ID=1

UPDATE film SET rezisoor_ID=2 WHERE fiml_ID=2

UPDATE film SET rezisoor_ID=3 WHERE fiml_ID=3

UPDATE film SET rezisoor_ID=4 WHERE fiml_ID=4


CREATE TABLE kinokava( 
  kinokava_ID int PRIMARY KEY AUTO_INCREMENT, 
  vaba_koht int,
  kuupaev datetime
  );

INSERT INTO kinokava(vaba_koht)
VALUES('5', '2025-01-30 15:00:00'),
('10', '2025-01-30 17:00:00'),
('25', '2025-01-30 18:00:00),
('75', '2025-01-30 16:00:00);

ALTER TABLE kinokava ADD fiml_ID int;


ALTER TABLE kinokava ADD CONSTRAINT fk_film
FOREIGN KEY (fiml_ID) REFERENCES film(fiml_ID);

UPDATE kinokava SET fiml_ID=1 WHERE kinokava_ID=1

UPDATE kinokava SET fiml_ID=2 WHERE kinokava_ID=2

UPDATE kinokava SET fiml_ID=3 WHERE kinokava_ID=3

UPDATE kinokava SET fiml_ID=4 WHERE kinokava_ID=4
