# 🏥 Hospital Data Analysis — SQL Project

## 📌 Project Overview

This project analyzes hospital data using **SQL**.  
The dataset contains information about hospitals, cities, departments, doctors, patients, admission/discharge dates, and medical expenses.

### Dataset Columns

| Column | Description |
|---|---|
| `Hospital_Name` | Name of the hospital |
| `Location_City` | City where the hospital is located |
| `Department` | Medical department |
| `Doctors_Count` | Number of doctors |
| `Patients_Count` | Number of patients |
| `Admission_Date` | Patient admission date |
| `Discharge_Date` | Patient discharge date |
| `Medical_Expenses` | Medical expenses |

---

# 📊 SQL Questions & Answers

## 1. What is the total number of patients?

### Formula

```text
Total Patients = SUM(Patients_Count)
```

### SQL Query

```sql
SELECT SUM(Patients_Count) AS total_patients
FROM Hopsital_data;
```

### Explanation

`SUM()` adds the number of patients from all records.

---

## 2. What is the average number of doctors per hospital?

### Formula

```text
Average Doctors = SUM(Doctors_Count) / Number of Records
```

SQL uses the `AVG()` function to calculate this automatically.

### SQL Query

```sql
SELECT
    Hospital_Name,
    AVG(Doctors_Count) AS average_doctors
FROM Hopsital_data
GROUP BY Hospital_Name;
```

### Explanation

`GROUP BY Hospital_Name` creates a separate calculation for each hospital.

---

## 3. Which are the top 3 departments with the highest number of patients?

### Formula

```text
Total Patients per Department = SUM(Patients_Count)
```

### SQL Query

```sql
SELECT
    Department,
    SUM(Patients_Count) AS total_patients
FROM Hopsital_data
GROUP BY Department
ORDER BY total_patients DESC
LIMIT 3;
```

### Explanation

- `SUM()` calculates total patients.
- `GROUP BY` groups records by department.
- `ORDER BY ... DESC` sorts from highest to lowest.
- `LIMIT 3` returns only the top 3 departments.

---

## 4. Which hospital has the maximum medical expenses?

### Formula

```text
Maximum Expense = MAX(Medical_Expenses)
```

### SQL Query

```sql
SELECT
    Hospital_Name,
    Location_City,
    Medical_Expenses
FROM Hopsital_data
ORDER BY Medical_Expenses DESC
LIMIT 1;
```

### Alternative Query

```sql
SELECT
    Hospital_Name,
    Location_City,
    Medical_Expenses
FROM Hopsital_data
WHERE Medical_Expenses = (
    SELECT MAX(Medical_Expenses)
    FROM Hopsital_data
);
```

### Explanation

The query sorts medical expenses from highest to lowest and returns the first record.

> **Note:** If the requirement is to find the hospital with the highest *total* medical expenses across multiple records, use `SUM()` with `GROUP BY Hospital_Name` instead.

---

## 5. What is the average medical expense for each hospital?

### Formula

```text
Average Medical Expense = SUM(Medical_Expenses) / COUNT(Medical_Expenses)
```

### SQL Query

```sql
SELECT
    Hospital_Name,
    AVG(Medical_Expenses) AS average_medical_expense
FROM Hopsital_data
GROUP BY Hospital_Name;
```

### Explanation

`AVG()` calculates the average medical expense for every hospital.

---

## 6. Which patient record has the longest hospital stay?

### Formula

```text
Length of Stay = Discharge_Date - Admission_Date
```

### SQL Query

```sql
SELECT
    Hospital_Name,
    Department,
    Admission_Date,
    Discharge_Date,
    (Discharge_Date - Admission_Date) AS length_of_stay
FROM Hopsital_data
ORDER BY length_of_stay DESC
LIMIT 1;
```

### Explanation

In PostgreSQL, subtracting one `DATE` from another returns the number of days between them.

---

## 7. How many patients were treated by each city?

### Formula

```text
Total Patients per City = SUM(Patients_Count)
```

### SQL Query

```sql
SELECT
    Location_City,
    SUM(Patients_Count) AS total_patients
FROM Hopsital_data
GROUP BY Location_City
ORDER BY total_patients DESC;
```

### Explanation

The data is grouped by city and the patient counts are added together.

---

## 8. What is the average length of hospital stay for each department?

### Formula

```text
Length of Stay = Discharge_Date - Admission_Date

Average Stay = AVG(Length of Stay)
```

### SQL Query

```sql
SELECT
    Department,
    AVG(Discharge_Date - Admission_Date) AS average_length_of_stay
FROM Hopsital_data
GROUP BY Department
ORDER BY average_length_of_stay DESC;
```

### Explanation

First, the difference between discharge and admission dates gives the stay in days. Then `AVG()` calculates the average stay for each department.

---

## 9. Which department has the lowest number of patients?

### Formula

```text
Total Patients per Department = SUM(Patients_Count)
```

### SQL Query

```sql
SELECT
    Department,
    SUM(Patients_Count) AS total_patients
FROM Hopsital_data
GROUP BY Department
ORDER BY total_patients ASC
LIMIT 1;
```

### Explanation

- `SUM()` calculates total patients for each department.
- `ASC` sorts from lowest to highest.
- `LIMIT 1` returns the department with the fewest patients.

---

## 10. What is the monthly medical expense report?

### Formula

```text
Monthly Expenses = SUM(Medical_Expenses)
```

### SQL Query

```sql
SELECT
    TO_CHAR(Admission_Date, 'Month') AS month_name,
    SUM(Medical_Expenses) AS total_expenses
FROM Hopsital_data
GROUP BY
    TO_CHAR(Admission_Date, 'Month'),
    EXTRACT(MONTH FROM Admission_Date)
ORDER BY EXTRACT(MONTH FROM Admission_Date);
```

### Explanation

- `TO_CHAR()` converts the date into a month name.
- `SUM()` calculates total expenses.
- `EXTRACT(MONTH FROM Admission_Date)` keeps the months in calendar order.

---

# 🧮 Important SQL Formulas Used

| Requirement | SQL Formula / Function |
|---|---|
| Total | `SUM(column)` |
| Average | `AVG(column)` |
| Maximum | `MAX(column)` |
| Minimum | `MIN(column)` |
| Number of records | `COUNT(column)` |
| Difference between dates | `Discharge_Date - Admission_Date` |
| Group data | `GROUP BY column` |
| Highest to lowest | `ORDER BY column DESC` |
| Lowest to highest | `ORDER BY column ASC` |
| Top N records | `LIMIT N` |
| Month from date | `EXTRACT(MONTH FROM date)` |
| Month name | `TO_CHAR(date, 'Month')` |

---

# 🔑 SQL Concepts Used

### 1. `SUM()`

Used to calculate the total value.

```sql
SELECT SUM(Patients_Count)
FROM Hopsital_data;
```

### 2. `AVG()`

Used to calculate the average.

```sql
SELECT AVG(Doctors_Count)
FROM Hopsital_data;
```

### 3. `MAX()`

Used to find the highest value.

```sql
SELECT MAX(Medical_Expenses)
FROM Hopsital_data;
```

### 4. `MIN()`

Used to find the lowest value.

```sql
SELECT MIN(Medical_Expenses)
FROM Hopsital_data;
```

### 5. `COUNT()`

Used to count records.

```sql
SELECT COUNT(*)
FROM Hopsital_data;
```

### 6. `GROUP BY`

Used to divide data into groups.

```sql
SELECT Department, SUM(Patients_Count)
FROM Hopsital_data
GROUP BY Department;
```

### 7. `ORDER BY`

Used to sort results.

```sql
ORDER BY total_patients DESC;
```

### 8. `LIMIT`

Used to restrict the number of returned records.

```sql
LIMIT 3;
```

---

# 🏗️ Table Creation

```sql
CREATE TABLE Hopsital_data (
    Hospital_Name VARCHAR(50),
    Location_City VARCHAR(50),
    Department VARCHAR(50),
    Doctors_Count NUMERIC,
    Patients_Count NUMERIC,
    Admission_Date DATE,
    Discharge_Date DATE,
    Medical_Expenses NUMERIC
);
```

> **Note:** The original SQL uses `Hopsital_data`. This appears to be a typo for `Hospital_data`. If you rename the table, use the corrected name consistently throughout the queries.

---

# 📈 Key Business Questions Answered

This project can help answer questions such as:

- How many patients were treated in total?
- Which hospital has the most expensive medical record?
- Which departments treat the most patients?
- Which department treats the fewest patients?
- Which city handles the most patients?
- What is the average number of doctors per hospital?
- Which department has the longest average patient stay?
- What is the longest individual hospital stay?
- How much money is spent on medical treatment each month?
- What is the average medical expense for each hospital?

---

# 🛠️ Tools & Technologies

- **SQL**
- **PostgreSQL**
- **CSV Dataset**
- **GitHub**

# 🚀 Conclusion

This project demonstrates how SQL can be used to analyze hospital data and extract useful business insights.

The main SQL concepts demonstrated are:

`SELECT` → `SUM()` → `AVG()` → `MAX()` → `MIN()` → `COUNT()` → `GROUP BY` → `ORDER BY` → `LIMIT` → Date Functions

These techniques are commonly used in **Data Analysis, Business Analysis, Reporting, and SQL-based projects**.
