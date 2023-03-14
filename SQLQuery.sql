




-- we begin by checking each table for errors to be cleaned
-- we start from the employees table
SELECT *
FROM dbo.employees



-- we check the format of the data
exec sp_help employees



-- we convert the dateofbirth column from NVARCHAR to DATE format
UPDATE dbo.employees
SET dateofbirth = CONVERT(NVARCHAR(100), CONVERT(date, dateofbirth, 105))
ALTER TABLE dbo.employees
ALTER COLUMN dateofbirth date






-- we move to the edetails table
SELECT *
FROM dbo.edetails

exec sp_help edetails


-- we notice that we can join the hiringday, hiringmonth and hiringyear together to create a single column
-- we convert the hiringyear column from int to nvarchar in order to cast the 3 columns together 
UPDATE dbo.edetails
SET hiringyear = CONVERT(INT, CONVERT(NVARCHAR(50), hiringyear))
ALTER TABLE dbo.edetails
ALTER COLUMN hiringyear NVARCHAR(50)

UPDATE dbo.edetails
SET hiringyear = CONVERT(DATE, CAST(hiringyear AS VARCHAR(50)) + '-' +
                               CAST(hiringmonth AS VARCHAR(100)) + '-' +
                               CAST(hiringday AS VARCHAR(100))) 



-- we delete the hiringday and hiringmonth columns and we change the name of the hiringyear column to hiringdate since we have have combined the
-- hiringday and hiringmonth columns to the hiringyear column
ALTER TABLE dbo.edetails
DROP COLUMN hiringday, hiringmonth

EXEC sp_RENAME 'edetails.hiringyear' , 'hiringdate', 'COLUMN'









-- in the qualityperformance table there are missing values in the profession column but are easily traceable from the other tables
-- we check which values are missing
SELECT *
FROM dbo.qualityperformance

SELECT *
FROM dbo.qualityperformance
WHERE profession IS NULL



-- we have 3 missing values, we trace them from the edetails table using the worker_ID values
SELECT worker_ID, profession
FROM dbo.edetails
WHERE worker_ID IN (19, 35, 65)


-- after finding the data we add the missing values to the qualityperformance table
UPDATE dbo.qualityperformance
SET profession = 'Carpenter'
WHERE worker_ID = 19

UPDATE dbo.qualityperformance
SET profession = 'Architect'
WHERE worker_ID = 35

UPDATE dbo.qualityperformance
SET profession = 'Construction Worker'
WHERE worker_ID = 65









-- AFTER CLEANING THE DATA WE BEGIN ANALYZING THE TABLES



-- we are interested in checking the demographics of the workers
-- we began by analyzing the ages of the workers
SELECT *
FROM dbo.employees


SELECT AVG(age) AS averageAGE, MAX(age) AS maximumAGE, MIN(age) AS minimumAGE
FROM dbo.employees


-- we check the different age ranges and we decide to create a new column dividing them in 4 ranges (young, adult, middle and older)
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
-- we notice that there are a lot of people over 40 years old




-- we check how many women work in the company in total
SELECT gender, COUNT(gender) 
FROM dbo.employees
GROUP BY gender  --11 women in total






-- we decide to check wq_performance by age range, to do that we need to join the employees, edetails and qualityperformance tables
-- we start from the 'olderW' range of age
SELECT employees.worker_ID, firstname, lastname, gender, age, COUNT(ageRange) AS AgeCount, edetails.profession, 
COUNT(edetails.profession) AS ProfessionCount, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE ageRange = 'olderW' AND wq_performance < 4
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    
ORDER BY wq_performance DESC
-- 7 workers have 3 wq_performance





-- now we check the 'middleW' age range
SELECT employees.worker_ID, firstname, lastname, gender, age, COUNT(ageRange) AS AgeCount, edetails.profession, 
COUNT(edetails.profession) AS ProfessionCount, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE ageRange = 'middleW' AND wq_performance < 4
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    
ORDER BY wq_performance DESC
-- 3 workers with 3 wq_performance and 2 workers with 2




-- now we check the 'adultW' age range
SELECT employees.worker_ID, firstname, lastname, gender, age, COUNT(ageRange) AS AgeCount, edetails.profession, 
COUNT(edetails.profession) AS ProfessionCount, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE ageRange = 'adultW' AND wq_performance < 4
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    
ORDER BY wq_performance DESC
-- 5 people with 3 wq_performance and 3 workers with 2




-- finally we check the 'youngW' age range
SELECT employees.worker_ID, firstname, lastname, gender, age, COUNT(ageRange) AS AgeCount, edetails.profession, 
COUNT(edetails.profession) AS ProfessionCount, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE ageRange = 'youngW' AND wq_performance < 4
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    
ORDER BY wq_performance DESC
-- 1 worker with 3 wq_performance





-- now we check how many are there with 2 wq_performance
SELECT employees.worker_ID, firstname, lastname, gender, age, edetails.profession, 
COUNT(edetails.profession) AS ProfessionCount, wq_performance, hourlypay, hiringyear
FROM dbo.employees JOIN dbo.edetails
ON employees.worker_ID = edetails.worker_ID
JOIN dbo.qualityperformance
ON employees.worker_ID = qualityperformance.worker_ID
WHERE wq_performance < 3
GROUP BY employees.worker_ID, firstname, lastname, gender, age, edetails.profession, wq_performance, hourlypay, hiringyear    
ORDER BY wq_performance DESC   
-- 5 workers (3 construction workers, 1 carpenter and 1 painter)






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
