# Hospital Data Analysis & Operational Optimization
## Project Overview
This project performs an exploratory data analysis on hospital operational metrics across multiple facilities. As a data analyst, my objective is to analyze healthcare records to evaluate patient volume, hospital capacity, length of stay, and medical expenses. The analysis extracts actionable insights to optimize resource allocation, manage departmental patient loads, and evaluate financial performance across locations.

# Tools Used
SQL (PostgreSQL Syntax)

# Data Cleaning and PreparationData 
* importation and verification.
* Database schema design with precise data types (VARCHAR, NUMERIC, DATE).
* Applied SQL aggregate and temporal functions (SUM, AVG, TO_CHAR, EXTRACT) for analytical reporting.

# Objectives
* What is the total number of patients across all facilities?
* What is the average number of doctors available per hospital?
* Which top 3 departments have the highest number of patients?
* Which hospital recorded the maximum medical expenses?
* What are the daily average medical expenses per hospital?
* Which patient record has the longest hospital stay?
* What is the total number of patients treated per city?
* What is the average length of stay per department?
* Which department has the lowest number of patients?
* What is the monthly medical expenses breakdown?

# Data Analysis
1. What is the total number of patients across all facilities?
```sql
select sum(Patients_Count) as total_patient
from Hopsital_data;
