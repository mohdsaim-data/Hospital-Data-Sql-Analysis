drop table Hopsital_data; 

create table Hopsital_data(Hospital_Name VARCHAR(50),
Location_City	VARCHAR(50),
Department	VARCHAR(50),
Doctors_Count	NUMERIC,
Patients_Count	NUMERIC,
Admission_Date	DATE,
Discharge_Date	DATE,
Medical_Expenses NUMERIC
);

select * from Hopsital_data;

-- 1 Total Number of Patients 

select sum(Patients_Count) as total_patient
from Hopsital_data;

-- 2 Average Number of Doctors per Hospital 

select hospital_name, avg(doctors_count) as avg_docs
from Hopsital_data
group by hospital_name; 

--3 Top 3 Departments with the Highest Number of Patients

select hospital_name, department, sum(patients_count) as total_patient
from Hopsital_data
group by hospital_name, department
order by total_patient desc;

-- 4 Hospital with the Maximum Medical Expenses 

select hospital_name, location_city, medical_expenses
from Hopsital_data
order by medical_expenses desc;

-- 5 Daily Average Medical Expenses 

select Hospital_name, avg(medical_expenses) as average_medical_expense
from Hopsital_data
group by Hospital_name; 


-- 6 Longest Hospital Stay

select hospital_name, department, admission_date, discharge_date,(discharge_date - admission_date) as length_of_stay
from Hopsital_data
order by length_of_stay desc;

-- 7 Total Patients Treated Per City 

select hospital_name, location_city, sum(patients_count) as total_patient
from Hopsital_data 
group by Hospital_name, location_city; 

-- 8 Average Length of Stay Per Department 

select department, avg(discharge_date - admission_date) as days_spend_in_hospital
from Hopsital_data 
group by department order by days_spend_in_hospital desc;

-- 9 Identify the Department with the Lowest Number of Patients

select department, sum(patients_count) as least_number_of_patients
from Hopsital_data 
group by department 
order by least_number_of_patients asc; 

-- 10 Monthly Medical Expenses Report 

select to_char(admission_date, 'Month') as month_name, 
sum(medical_expenses) as total_expenses
from Hopsital_data 
group by to_char(admission_date, 'Month'), extract (Month from admission_date) 
ORDER BY EXTRACT (Month from admission_date);

-- End of project







 









