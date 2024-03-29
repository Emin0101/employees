

CREATE TABLE employees(

    worker_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	firstname NVARCHAR(50) NOT NULL,
	dateofbirth NVARCHAR(50) NOT NULL,
	age INT NOT NULL,
	lastname NVARCHAR(50) NOT NULL,
	gender NVARCHAR(50),

)



CREATE TABLE edetails(
   
    worker_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	hiringday NVARCHAR(10),
	hiringmonth NVARCHAR(50),
	hourlypay DECIMAL(4,2),
	hiringyear INT,
	profession NVARCHAR(100) NOT NULL

)




CREATE TABLE supervisors(

    supervisor_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	worker_ID INT,
	firstname NVARCHAR(50),
	lastname NVARCHAR(50),
	profession NVARCHAR(100) NOT NULL

)





CREATE TABLE qualityperformance (

    worker_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	hiringyear NVARCHAR(50) NOT NULL,
	wq_performance INT,
	profession NVARCHAR(100),
	supervisor_ID INT 

)










INSERT INTO employees
VALUES ('Thomas', '07/09/1970', 52, 'Martinez', 'Male'),
       ('James', '12/01/1973', 50, 'Anderson', 'Male'),
       ('Jack', '12/04/1972', 51, 'Jackson', 'Male'),
       ('Daniel', '03/06/1968', 55, 'Martin', 'Male'),
       ('Matthew', '05/03/1975', 48, 'Lee', 'Male'),
       ('Ryan', '02/05/1973', 50, 'Sanchez', 'Male'),
       ('Joshua', '14/04/1974', 49, 'Clark', 'Male'),
       ('Luke', '04/01/1973', 50, 'Ramirez', 'Male'),
       ('Samuel', '08/12/1975', 47, 'Howard', 'Male'),
       ('Joyce', '26/12/1970', 52, 'Richardson', 'Female'),
       ('Michael', '13/09/1970', 52, 'Bennett', 'Male'),
       ('Adam', '21/12/1972', 50, 'Gray', 'Male'),
       ('William', '13/03/1967', 56, 'Price', 'Male'),
       ('Matthew', '24/09/1987', 35, 'Sanders', 'Male'),
       ('George', '12/02/1984', 39, 'Foster', 'Male'),
       ('Aaron', '21/10/1970', 52, 'Walker', 'Male'),
       ('Carol', '31/07/1975', 47, 'Young', 'Female'),
       ('Valerie', '29/05/1971', 52, 'Adams', 'Female'),
       ('Toby', '25/01/1969', 54, 'Campbell', 'Male'),
       ('Louis', '11/09/1975', 47, 'Gomez', 'Male'),
       ('Henry', '11/11/1987', 35, 'Turner', 'Male'),
       ('Bobby', '04/01/1970', 53, 'Stewart', 'Male'),
       ('Mark', '11/07/1972', 50, 'Murphy', 'Male'),
       ('Anne', '22/03/1969', 54, 'Peterson', 'Female'),
       ('Jason', '20/05/1974', 49, 'Jordan', 'Male'),
       ('Brandon', '06/08/1992', 30, 'Simmons', 'Male'),
       ('Jacob', '20/09/1987', 35, 'Adams', 'Male'),
       ('Peter', '27/11/1981', 41, 'Burton', 'Male'),
       ('Mario', '28/04/1992', 31, 'Hee', 'Male'),
       ('Mohammed', '26/10/1998', 24, 'Bakir' 'Male'),
       ('Helen', '18/01/1987', 36, 'Armstrong', 'Female'),
       ('Ben', '11/05/1980', 43), 'Hart', 'Male')
       ('Wendy', '22/05/1985', 38, 'Bradley', 'Female'),
       ('Carl', '07/09/1978', 44, 'Knight', 'Male'),
       ('Max', '10/09/1987', 35, 'Murphy', 'Male'),
       ('Patrick', '27/09/1989', 33, 'Watkins', 'Male'),
       ('Peter', '21/09/1983', 39, 'Ortega', 'Male'),
       ('Marika', '09/04/1997', 26, 'Smith', 'Female'),
       ('Frederik', '18/05/1990', 33, 'Obrien', 'Male'),
       ('Philip', '03/03/1973', 50, 'Lynch', 'Male'),
       ('Denis', '20/02/1980', 43, 'Tommasini', 'Male'),
       ('Owen', '14/02/1979', 44, 'Offenheim', 'Male'),
       ('Richard', '05/02/1989', 34, 'Berry', 'Male'),
       ('Tommy', '19/11/1983', 39, 'Lee', 'Male'),
       ('William', '15/06/1996', 27, 'Guerrero', 'Male'),
       ('George', '21/11/1986', 36, 'Foster', 'Male'),
       ('Barbara', '22/08/1973', 49, 'Park', 'Female'),
       ('Elliot', '16/11/1972', 50, 'Graham', 'Male'),
       ('Dean', '18/03/1968', 55, 'Lewis', 'Male'),
       ('Thomas', '27/01/1992', 31, 'Muller', 'Male'),
       ('Chris', '09/04/1989', 34, 'Davis', 'Male'),
       ('Jacob', '08/01/1982', 41, 'Brown', 'Male'),
       ('Sarah', '21/11/1986', 36, 'Hardy', 'Female'),
       ('Ryan', '25/03/1969', 54, 'Taylor', 'Male'),
       ('Anne', '15/06/1996', 27, 'Moore', 'Female'),
       ('Simon', '06/09/1980', 42, 'Peterson', 'Male'),
       ('Simon', '27/01/1992', 31, 'Sanchez', 'Male'),
       ('Sebastian', '21/12/1973', 49, 'Allen', 'Male'),
       ('Billy', '09/04/1989', 34, 'Wright', 'Male'),
       ('Markus', '18/05/1990', 33, 'Flores', 'Male'),
       ('Dylan', '19/11/1983', 39, 'Nguyen', 'Male'),
       ('Paul', '15/06/1996', 27, 'Turner', 'Male'),
       ('Craig', '21/11/1986', 36, 'Evans', 'Male'),
       ('Patrick', '05/12/1988', 34, 'Edwards', 'Male'),
       ('Omar', '21/12/1973', 49, 'Reyes', 'Male'),
       ('Tommy', '25/01/1988', 35, 'Cooper' 'Male'),
       ('Ryan', '06/06/1999', 24, 'Gutierrez', 'Male'),
       ('Samantha', '18/05/1983', 40, 'Moore', 'Female'),
       ('Ali', '13/04/1977', 46, 'Alsaudi', 'Male'),
       ('James', '05/08/1986', 36, 'Morrison', 'Male'),
       ('Robert', '12/07/1999', 23, 'Kluviert', 'Male'),
       ('Jack', '09/05/1968', 55, 'Rodriguez', 'Male'),
       ('Cameron', '14/02/1997', 26, 'Burton', 'Male'),
       ('Joel', '21/05/1988', 35, 'Brooks', 'Male'),
       ('Martin', '03/06/1980', 43, 'Wood', 'Male'),
       ('Stuart', '30/04/1973', 50, 'Gray', 'Male')
       
       
       
       
       



INSERT INTO dbo.edetails
VALUES ('12', '08', 19.25, '2018', 'Painter'),
       ('13', '08', 20.12, '2019', 'Carpenter'),
       ('24', '01', 19.25, '2021', 'Electrician'),
       ('02', '04', 19.25, '2018', 'Carpenter'),
       ('14', '03', 18.45, '2020', 'Plumber'),
       ('13', '08', 16.24, '2019', 'Construction Worker'),
       ('03', '12', 18.45, '2018', 'Plumber'),
       ('28', '02', 16.24, '2018', 'Construction Worker'),
       ('12', '08', 25.35, '2018', 'Project Manager'),
       ('24', '01', 18.25, '2021', 'Painter'),
       ('13', '08', 19.25, '2019', 'Electrician'),
       ('24', '01', 18.25, '2021', 'Painter'),
       ('25', '02', 16.24, '2019', 'Construction Worker'),
       ('16', '05', 19.25, '2018', 'Carpenter'),
       ('12', '08', 18.25, '2018', 'Painter'),
       ('16', '05', 16.24, '2018', 'Construction Worker'),
       ('23', '11', 25.35, '2022', 'Project Manager'),
       ('23', '07', 28.25, '2020', 'Architect'),
       ('23', '11', 19.25, '2022', 'Carpenter'),
       ('14', '03', 18.45, '2020', 'Plumber'),
       ('12', '08', 28.25, '2018', 'Engineer'),
       ('16', '05', 18.25, '2018', 'Painter',),
       ('16', '05', 18.25, '2018', 'Painter'),
       ('09', '12', 23.25, '2019', 'Safety Inspector'),
       ('04', '09', 19.25, '2022', 'Carpenter'),
       ('14', '03', 19.25, '2020', 'Carpenter'),
       ('14', '03', 16.24, '2020', 'Construction Worker'),
       ('12', '08', 20.45, '2018', 'Electrician'),
       ('13', '08', 19.25, '2019', 'Carpenter'),
       ('23', '11', 19.25, '2022', 'Electrician'),
       ('18', '12', 23.25, '2029', 'Safety Inspector'),
       ('25', '02', 16.24, '2019', 'Construction Worker'),
       ('13', '08', 18.25, '2019', 'Painter'),
       ('23', '11', 16.24, '2022', 'Construction Worker'),
       ('12', '08', 28.25, '2018', 'Architect'),
       ('18', '06', 16.24, '2022', 'Construction Worker'),
       ('16', '05', 16.24, '2018', 'Construction Worker'),
       ('11', '01', 28.25, '2018', 'Engineer'),
       ('16', '05', 16.24, '2018', 'Construction Worker'),
       ('13', '08', 16.24, '2019', 'Construction Worker'),
       ('13', '08', 19.25, '2019', 'Carpenter'),
       ('16', '05', 19.25, '2018', 'Carpenter'),
       ('14', '03', 16.24, '2021', 'Construction Worker'),
       ('24', '01', 16.24, '2021', 'Construction Worker'),
       ('24', '02', 16.24, '2022', 'Construction Worker'),
       ('24', '01', 19.25, '2019', 'Carpenter'),
       ('12', '08', 13.15, '2018', 'Secretary'),
       ('14', '03', 16.24, '2020', 'Construction Worker'),
       ('01', '04', 16.24, '2021', 'Construction Worker'),
       ('23', '11', 16.24, '2o22', 'Construction Worker'),
       ('12', '08', 17.35, '2018', 'Construction Worker'),
       ('03', '03', 16.24, '2018', 'Construction Worker'),
       ('14', '05', 16.24, '2018', 'Construction Worker'),
       ('24', '01', 18.45, '2021', 'Plumber'),
       ('12', '08', 28.25, '2018', 'Architect'),
       ('05', '05', 16.24, '2018', 'Construction Worker'),
       ('14', '01', 16.24, '2018', 'Construction Worker'),
       ('13', '08', 16.24, '2019', 'Construction Worker'),
       ('14', '11', 16.24, '2018', 'Construction Worker'),
       ('23', '11', 16.24, '2022', 'Construction Worker'),
       ('12', '08', 16.24, '2018', 'Construction Worker'),
       ('06', '10', 16.24, '2022', 'Construction Worker'),
       ('21', '07', 28.25, '2022', 'Architect'),
       ('23', '07', 16.24, '2018', 'Construction Worker'),
       ('14', '03', 16.24, '2020', 'Construction Worker'),
       ('17', '06', 16.24, '2021', 'Construction Worker'),
       ('12', '08', 19.45, '2018', 'Plumber'),
       ('12', '08', 15.15, '2018', 'Secretary'),
       ('14', '11', 16.24, '2019', 'Construction Worker'),
       ('17', '06', 18.25, '2022', 'Painter'),
       ('13', '08', 16.24, '2019', 'Construction Worker'),
       ('16', '05', 28.25, '2018', 'Engineer'),
       ('12', '08', 17.35, '2018', 'Construction Worker'),
       ('24', '01', 19.25, '2021', 'Electrician'),
       ('14', '03', 19.25, '2020', 'Electrician'),
       ('14', '03', 19.25, '2020', 'Carpenter')
      



INSERT INTO dbo.supervisors
VALUES (2, 'James', 'Anderson',	'Carpenter'),
       (9, 'Samuel', 'Howard', 'Project Manager'),
       (24, 'Anne', 'Peterson', 'Safety Manager'),
       (38, 'Marika', 'Smith', 'Engineer'),
       (51, 'Chris', 'Davis', 'Construction Worker'),
       (73, 'Cameron', 'Burton', 'Construction Worker'),
       (28, 'Peter', 'Burton', 'Electrician'), 
       (1, 'Thomas', 'Martinez', 'Painter'),
       (67, 'Ryan', 'Gutierrez', 'Plumber'),
       (35, 'Max', 'Murphy', 'Architect'),
       (59, 'Billy', 'Wright', 'Construction Worker'),
       (52, 'Jacob', 'Brown', 'Construction Worker')
























INSERT INTO dbo.qualityperformance
VALUES ('2018', 4, 'Painter', 2)
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
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
          
