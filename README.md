![image](https://github.com/user-attachments/assets/7b9c925a-6e0b-4299-8fd3-8510fb18a610)

![image](https://github.com/user-attachments/assets/01724ba9-97d9-4561-824d-1c2b2a1fd634)

![image](https://github.com/user-attachments/assets/2db105aa-f46d-4748-a2bd-a9e4a8a1640f)

![image](https://github.com/user-attachments/assets/f2ab26d5-f2d3-48c9-81f4-08a0c83ad795)


--- Klassitöö 

CREATE DATABASE car2025;

USE car2025;

CREATE TABLE autod(
auto_id int PRIMARY KEY identity(1,1),
auto_mark varchar(25),
auto_mubel varchar(25),
auto_aasta date,
auto_hind DECIMAL(10,2) -- значени с запятой
)

![image](https://github.com/user-attachments/assets/2615745c-70d3-41dc-9961-770ad1c9173b)


Проверила, создала базу данных car2025, после создала таблицу autod

CREATE PROCEDURE lisaauto
@auto_mark varchar(25),
@auto_mubel varchar(25),
@auto_aasta date,
@auto_hind DECIMAL(10,2)
AS
BEGIN
INSERT INTO autod(
auto_mark, auto_mubel, auto_aasta, auto_hind)
VALUES(
@auto_mark, @auto_mubel, @auto_aasta, @auto_hind);
SELECT * FROM autod;
END;
 
Создаем процедуру для таблицы autod где будем добавлять данные: 

Вызываю процедуру lisaautod, которая добавляет марки машин
EXEC lisaauto 'kia', 'sportage', '2022-02-06', '15000.00'; 

![image](https://github.com/user-attachments/assets/3e30a433-a1cc-46ac-8221-9134b777ac0b)


Создаем процедуру удаления, где удалять будет id где машина, и смотрим таблицу, до удаления и после

CREATE PROCEDURE kustuta
@id int
AS
BEGIN
SELECT * FROM autod;
DELETE FROM autod WHERE auto_id = @id;
SELECT * FROM autod;
END;

Выполняем процедуру

EXEC kustuta 3;

![image](https://github.com/user-attachments/assets/294e202c-4f69-47be-a707-fc4a67050b54)


Выполнено успешно!

CREATE PROCEDURE otsing
@muudel char(1)
AS
BEGIN 
SELECT * FROM autod
WHERE auto_mubel LIKE @muudel +'%';
END;

Создаем процедуру, где будем искать по букве марку машины

Выполняем процедуру по поиску марки машины по одной букве

EXEC otsing 's';

![image](https://github.com/user-attachments/assets/b26c2b4c-d0f3-4db6-a614-2b07032ebfa8)

