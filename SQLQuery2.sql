
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
SET ageRange = CASE WHEN age >= 50 THEN 'olderW'
                    WHEN age < 50 AND age >= 40 THEN 'middleW'
	                WHEN age < 40 AND age >= 30 THEN 'adultW'
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




-- id 4 e 13 possibile licenziamento, vediamo per le altre fasce di età

SELECT employees.worker_ID, firstname, lastname, gender, age, COUNT(ageRange) AS AgeCount, edetails.profession, 
COUNT(edetails.profession) AS ProfessionCount, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE ageRange = 'olderW' AND wq_performance < 4
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    
ORDER BY wq_performance DESC

-- 7 da 3






SELECT employees.worker_ID, firstname, lastname, gender, age, COUNT(ageRange) AS AgeCount, edetails.profession, 
COUNT(edetails.profession) AS ProfessionCount, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE ageRange = 'middleW' AND wq_performance < 4
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    
ORDER BY wq_performance DESC


-- 3 persone con 3, 2 con 2

SELECT employees.worker_ID, firstname, lastname, gender, age, COUNT(ageRange) AS AgeCount, edetails.profession, 
COUNT(edetails.profession) AS ProfessionCount, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE ageRange = 'adultW' AND wq_performance < 4
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    -- 1 da 2, 1 da 3 (33, 53)
ORDER BY wq_performance DESC

--5 persone con 3, 3 con 2




SELECT employees.worker_ID, firstname, lastname, gender, age, COUNT(ageRange) AS AgeCount, edetails.profession, 
COUNT(edetails.profession) AS ProfessionCount, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE ageRange = 'youngW' AND wq_performance < 4
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    
ORDER BY wq_performance DESC
-- 1 con 3





-- dopo aver analizzato vediamo quanti sono i due di performance
SELECT employees.worker_ID, firstname, lastname, gender, age, edetails.profession, 
COUNT(edetails.profession) AS ProfessionCount, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE wq_performance < 3
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    
ORDER BY wq_performance DESC   -- 5 persone (3 cw, 1 carp, 1 paint)




--analizziamo per professione quanti sono i -4 di performance e se c'è almeno 1 con esperienza e uno giovane per ogni professione

SELECT profession, COUNT(profession)
FROM dbo.edetails
GROUP BY profession
ORDER BY profession


SELECT employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE wq_performance = 3
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    
ORDER BY profession DESC   

-- 3 painter, 2 elettr,  2 carp, 9 cw

SELECT employees.worker_ID, firstname, lastname, gender, ageRange, edetails.profession
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID 
GROUP BY employees.worker_ID, firstname, lastname, gender, ageRange, edetails.profession  
ORDER BY edetails.profession DESC
  
-- carpentieri e painter sembrano quelli con pochi giovani




-- analizziamo se i supervisors vanno bene e se non vanno bene analizziamo che lavoratori sono stati analizzati da questi
SELECT supervisors.supervisor_ID, employees.worker_ID, employees.firstname, employees.lastname, gender, age, edetails.profession,
wq_performance
FROM dbo.supervisors JOIN dbo.employees
ON supervisors.worker_ID = employees.worker_ID
JOIN dbo.edetails
ON supervisors.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON supervisors.worker_ID = qualityperformance.worker_ID
GROUP BY supervisors.supervisor_ID, employees.worker_ID, employees.firstname, employees.lastname, gender, age, edetails.profession,
wq_performance
ORDER BY edetails.profession DESC

-- spID 7 wd 28 elettrico da cambiare
-- spID 11 wd 59 cw da cambiare

SELECT employees.worker_ID, firstname, lastname, gender, ageRange, edetails.profession, wq_performance, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID 
WHERE supervisor_ID = 7
GROUP BY employees.worker_ID, firstname, lastname, gender, ageRange, edetails.profession, wq_performance, hiringyear
ORDER BY edetails.profession DESC
  
-- workerID 74 possibie sostituto con 5 di performance e adult assunto dal 2021


SELECT employees.worker_ID, firstname, lastname, gender, ageRange, edetails.profession, wq_performance, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID 
WHERE supervisor_ID = 11
GROUP BY employees.worker_ID, firstname, lastname, gender, ageRange, edetails.profession, wq_performance, hiringyear
ORDER BY edetails.profession DESC

-- valutati tutti con 4 e su con possibile sostituto workerID 56 con 5 di performance middle assunto nel 2018


SELECT employees.worker_ID, 
       employees.firstname, 
	   employees.lastname, 
	   gender, 
	   age, 
	   ageRange, 
	   hourlypay, 
	   edetails.profession,
	   qualityperformance.hiringyear, 
	   wq_performance, 
	   qualityperformance.supervisor_ID
FROM dbo.employees 
JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
GROUP BY employees.worker_ID, 
       employees.firstname, 
	   employees.lastname, 
	   gender, 
	   age, 
	   ageRange, 
	   hourlypay, 
	   edetails.profession,
	   qualityperformance.hiringyear, 
	   wq_performance, 
	   qualityperformance.supervisor_ID
