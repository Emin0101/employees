
SELECT *
FROM dbo.employees


SELECT *
FROM dbo.edetails


SELECT *
FROM dbo.supervisors

SELECT *
FROM dbo.qualityperformance



--creare una tabella con i worker_ID dei lavoratori, anno di assunzione, professione, rating da 1 a 5
--il supervisor_ID che l'ha valutato
--rating nullo per i lavoratori assunti nel 2022




CREATE TABLE qualityperformance (

    worker_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	hiringyear NVARCHAR(50) NOT NULL,
	wq_performance INT,
	profession NVARCHAR(100),
	supervisor_ID INT 

)

SELECT *
FROM dbo.qualityperformance




select profession, count(profession) as Nprofession
from dbo.edetails
group by profession
order by Nprofession desc




INSERT INTO dbo.qualityperformance
VALUES ('2018', 4, 'Painter', 2),
       ('2019', 4, 'Carpenter', 2),
       ('2021', 4, 'Electrician', 7),
       ('2018', 3, 'Carpenter', 1),
       ('2020', 4, 'Plumber', 9),
       ('2019', 3, 'Construction Worker', 5),
       ('2018', 4, 'Plumber', 9),
       ('2018', 3, 'Construction Worker', 6),
       ('2018', NULL, 'Project Manager', NULL),
       ('2021', 4, 'Painter', 8),
       ('2019', 4, 'Electrician', 7),
       ('2021', 3, 'Painter', 8),
       ('2019', 3, 'Construction Worker', 12),
       ('2018', 2, 'Carpenter', 1),
       ('2018', 3, 'Painter', 8),
       ('2018', 5, 'Construction Worker', 6),
       ('2022', NULL, 'Project Manager', 2),
       ('2020', 4, 'Architect', 10),
       ('2022', NULL, NULL, 1),
       ('2020', 4, 'Plumber', 9),
       ('2018', 4, 'Engineer', 2),
       ('2018', 4, 'Painter', 8),
       ('2018', 3, 'Painter', 8),
       ('2019', 4, 'Safety Inspector', 2),
       ('2022', NULL, 'Carpenter', 1),
       ('2020', 4, 'Carpenter', 1),
       ('2020', 3, 'Construction Worker', 5),
       ('2018', 3, 'Electrician', 2),
       ('2019', 4, 'Carpenter', 1),
       ('2022', NULL, 'Electrician', 7),
       ('2019', 4, 'Safety Inspector', 3),
       ('2019', 2, 'Construction Worker', 12),
       ('2019', 2, 'Painter', 8),
       ('2022', NULL, 'Construction Worker', 5),
       ('2018', 4, NULL, 2),
       ('2022', NULL, 'Construction Worker', 6),
       ('2018', 4, 'Construction Worker', 6),
       ('2018', 4, 'Engineer', 4),
       ('2018', 4, 'Construction Worker', 11),
       ('2019', 3, 'Construction Worker', 6),
       ('2019', 3, 'Carpenter', 1),
       ('2018', 4, 'Carpenter', 1),
       ('2021', 4, 'Construction Worker', 11),
       ('2021', 3, 'Construction Worker', 6),
       ('2022', NULL, 'Construction Worker', 6),
       ('2019', 4, 'Carpenter', 1),
       ('2018', NULL, 'Secretary', NULL),
       ('2020', 4, 'Construction Worker', 12),
       ('2021', 4, 'Construction Worker', 11),
       ('2022', NULL, 'Construction Worker', 11),
       ('2018', 5, 'Construction Worker', 2),
       ('2018', 5, 'Construction Worker', 2),
       ('2018', 3, 'Construction Worker', 12),
       ('2021', 5, 'Plumber', 9),
       ('2018', 4, 'Architect', 10),
       ('2018', 5, 'Construction Worker', 11),
       ('2018', 2, 'Construction Worker', 5),
       ('2019', 4, 'Construction Worker', 5),
       ('2018', 3, 'Construction Worker', 2),
       ('2022', NULL, 'Construction Worker', 12),
       ('2018', 4, 'Construction Worker', 11),
       ('2022', NULL, 'Construction Worker', 12),
       ('2022', NULL, 'Architect', 10),
       ('2018', 4, 'Construction Worker', 6),
       ('2020', 2, NULL, 12),
       ('2021', 4, 'Construction Worker', 11),
       ('2018', 5, 'Plumber', 2),
       ('2018', NULL, 'Secretary', NULL),
       ('2019', 4, 'Construction Worker', 5),
       ('2022', NULL, 'Painter', 8),
       ('2019', 3, 'Construction Worker', 5),
       ('2018', 5, 'Engineer', 4),
       ('2018', 4, 'Construction Worker', 2),
       ('2021', 5, 'Electrician', 7),
       ('2020', 3, 'Electrician', 7),
       ('2020', 5, 'Carpenter', 1)






SELECT *
FROM dbo.employees


SELECT *
FROM dbo.edetails


SELECT *
FROM dbo.supervisors

SELECT *
FROM dbo.qualityperformance




-- l'obbiettivo dell'impresa edile è quella di migliorare la qualità del lavoro e gli incassi
-- ciò verrà fatto analizzando il dataset dei lavoratori per vedere se ci sono cambiamenti da fare per il miglioramento degli incassi
-- si parte sistemando le tabelle


SELECT *
FROM dbo.employees

-- analizziamo i tipi di dati che abbiamo nelle tabelle

exec sp_help employees



-- cambiamo il tipo di dato da nvarchar a date per la colonna dateofbirth

UPDATE dbo.employees
SET dateofbirth = CONVERT(NVARCHAR(100), CONVERT(date, dateofbirth, 105))
ALTER TABLE dbo.employees
ALTER COLUMN dateofbirth date




SELECT *
FROM dbo.edetails

exec sp_help edetails

-- uniamo il giorno mese e anno in un'unica colonna

UPDATE dbo.edetails
SET hiringyear = CONVERT(INT, CONVERT(NVARCHAR(50), hiringyear))
ALTER TABLE dbo.edetails
ALTER COLUMN hiringyear NVARCHAR(50)

UPDATE dbo.edetails
SET hiringyear = CONVERT(DATE, CAST(hiringyear AS VARCHAR(50)) + '-' +
                               CAST(hiringmonth AS VARCHAR(100)) + '-' +
                               CAST(hiringday AS VARCHAR(100))) 

SELECT *
FROM dbo.edetails

-- eliminiamo le colonne di hiringday e hiringmonth e cambiamo nome della colonna hiringyear

ALTER TABLE dbo.edetails
DROP COLUMN hiringday, hiringmonth

EXEC sp_RENAME 'edetails.hiringyear' , 'hiringdate', 'COLUMN'





-- nella tabella qualityperformance ci mancano dei valori che dovrebbero esserci quindi li aggiungiamo perché sono 
-- facilmente rintracciabili

SELECT *
FROM dbo.qualityperformance

SELECT *
FROM dbo.qualityperformance
WHERE profession IS NULL



-- 3 colonne sono vuote, rintracciamole grazie alle tabelle

SELECT worker_ID, profession
FROM dbo.edetails
WHERE worker_ID IN (19, 35, 65)


UPDATE dbo.qualityperformance
SET profession = 'Carpenter'
WHERE worker_ID = 19

UPDATE dbo.qualityperformance
SET profession = 'Architect'
WHERE worker_ID = 35

UPDATE dbo.qualityperformance
SET profession = 'Construction Worker'
WHERE worker_ID = 65


-- controlliamo
-- ferfetto



-- ANALISI
-- controlliamo che tipo di lavoratori ci sono nel dataset in base a età e sesso

SELECT *
FROM dbo.employees


SELECT AVG(age) AS averageAGE, MAX(age) AS maximumAGE, MIN(age) AS minimumAGE
FROM dbo.employees

-- vediamo quante fasce di età ci sono e creiamo una nuova colonna

SELECT COUNT(age) AS over40
FROM dbo.employees
WHERE age > 40

SELECT *
FROM dbo.employees
WHERE age > 30 AND age < 40



SELECT *
, CASE WHEN age > 50 THEN 'olderW'
       WHEN age < 50 AND age > 40 THEN 'middleW'
	   WHEN age < 40 AND age > 30 THEN 'adultW'
	   ELSE 'youngW'
	   END AS ageRange
FROM dbo.employees

ALTER TABLE dbo.employees
ADD ageRange NVARCHAR(50)

UPDATE dbo.employees
SET ageRange = CASE WHEN age > 50 THEN 'olderW'
                    WHEN age < 50 AND age > 40 THEN 'middleW'
	                WHEN age < 40 AND age > 30 THEN 'adultW'
	                ELSE 'youngW'
	                END 



SELECT ageRange, COUNT(ageRange) AS average
FROM dbo.employees
GROUP BY ageRange

-- vediamo che ci sono tanti lavoratori over 40


-- controlliamo il sesso e in base all'età che tipi di professione ci sono

SELECT gender, COUNT(gender)
FROM dbo.employees
GROUP BY gender AS gendercount  --11 donne e 65 uomini

--vediamo le professioni in base a sesso dove i lavoratori sono over 50

select *
from dbo.qualityperformance

SELECT ageRange, COUNT(ageRange) AS AgeCount, edetails.profession, COUNT(edetails.profession) AS ProfessionCount, wq_performance
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE gender = 'female' AND ageRange = 'olderW'
GROUP BY gender, ageRange, edetails.profession, wq_performance     -- 3 con 4 di performance


SELECT employees.worker_ID, ageRange, COUNT(ageRange) AS AgeCount, edetails.profession, COUNT(edetails.profession) AS ProfessionCount, wq_performance
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE gender = 'male' AND ageRange = 'olderW'
GROUP BY employees.worker_ID, ageRange, edetails.profession, wq_performance      -- 2 con 3 di valutazione  (4 e il 13)


SELECT employees.worker_ID, firstname, lastname, age, edetails.profession, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance 
ON
employees.worker_ID = qualityperformance.worker_ID
WHERE employees.worker_ID IN (4, 13)
GROUP BY employees.worker_ID, firstname, lastname, age, edetails.profession, hourlypay, hiringyear





