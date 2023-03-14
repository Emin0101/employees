# employees

Houston Elite Construction Co. 

Emin Redjepi 

2023-03-13 

 

Located in the bustling city of Houston, Texas, Houston Elite Construction Company has been a leading player in the construction industry since its inception in 2018. 
The company's primary objective is to deliver high-quality construction services while ensuring the safety of its workers and adhering to industry standards. 
As the Company continues to expand, the need to analyze its workforce data has become increasingly crucial. 
In 2022, the company engaged my services to evaluate the workers' data and provide insights to improve the quality of work and increase earnings. 

Using SQL Server Management Studio and Power BI, I analyzed data on the workers' names, ages, type of job, quality performance, 
and year of employment, among other metrics. The aim was to evaluate the quality of work, identify areas for improvement, 
and determine if the current workforce was sufficient to meet the company's goals. 

This report details my findings and recommendations based on the analysis of the Construction Company's worker data. 



1. The first step will be creating the data. You can find the process in the skeleton.
2. The second step will be cleaning the data and joining the tables in order to create a table with all the data we will need to continue the project on Power BI.
   

## Skeleton Section
We will create 4 tables:
- edetails
- employees
- qualityperformance
- supervisors

The first table will be contain worker_ID, hourlypay, hiringyear, hiringmonth, hiringday and profession.
The second table will be containing worker_ID, firstname, dateofbirth, age, lastname and gender.
The third table will be containing worker_ID, hiringyear, wq_performance (worker quality performance), profession and supervisor_ID (the supervisor that gave the evaluation to the worker).
The final table will be containing supervisor_ID, worker_ID (every supervisor has also a worker_ID), firstname, lastname and profession.

As you can see in addition to the normal workers there will be supervisors whose task will be to evaluate the quality of the workers' performance. To each worker is assigned a supervisor (exept for the secretaries and the project manager) that works in the same field of the worker that he/she has the job to supervise.



