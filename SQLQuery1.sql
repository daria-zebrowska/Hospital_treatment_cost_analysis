SELECT MedicalCondition, ROUND(sum(CAST(BillingAmount as float)),2) as 'Suma kosztów', ROUND(avg(CAST(BillingAmount as float)),2) as 'œrednia'
FROM healthcare_dataset$
GROUP BY MedicalCondition
ORDER BY 'Suma kosztów' DESC;


SELECT 
    CASE
        WHEN CAST(DischargeDate - DateofAdmission AS FLOAT) BETWEEN 1 AND 7 THEN '1 tydzieñ'
        WHEN CAST(DischargeDate - DateofAdmission AS FLOAT) BETWEEN 8 AND 14 THEN '2 tygodnie'
        WHEN CAST(DischargeDate - DateofAdmission AS FLOAT) BETWEEN 15 AND 21 THEN '3 tygodnie'
        WHEN CAST(DischargeDate - DateofAdmission AS FLOAT) BETWEEN 22 AND 28 THEN '4 tygodnie'
        ELSE '>4 tygodni'
    END AS 'Pobyt',
    ROUND(SUM(CAST(BillingAmount AS FLOAT)),2) AS 'Suma Kosztów'
FROM healthcare_dataset$
GROUP BY 
    CASE
        WHEN CAST(DischargeDate - DateofAdmission AS FLOAT) BETWEEN 1 AND 7 THEN '1 tydzieñ'
        WHEN CAST(DischargeDate - DateofAdmission AS FLOAT) BETWEEN 8 AND 14 THEN '2 tygodnie'
        WHEN CAST(DischargeDate - DateofAdmission AS FLOAT) BETWEEN 15 AND 21 THEN '3 tygodnie'
        WHEN CAST(DischargeDate - DateofAdmission AS FLOAT) BETWEEN 22 AND 28 THEN '4 tygodnie'
        ELSE '>4 tygodni'
    END
ORDER BY 'Suma kosztów' DESC;


SELECT Gender, ROUND(SUM(CAST(BillingAmount AS float)),2) AS 'Suma Kosztów'
FROM healthcare_dataset$
GROUP BY Gender;


SELECT AdmissionType, ROUND(SUM(CAST(BillingAmount AS float)),2) AS 'Suma Kosztów'
FROM healthcare_dataset$
GROUP BY AdmissionType;


SELECT
  CASE
    WHEN Age BETWEEN 0 AND 18 THEN '0-18'
    WHEN Age BETWEEN 19 AND 30 THEN '19-30'
    WHEN Age BETWEEN 31 AND 50 THEN '31-50'
    WHEN Age BETWEEN 51 AND 65 THEN '51-65'
    ELSE '65+'
  END AS 'Grupa Wieku',
    ROUND(SUM(CAST(BillingAmount AS float)),2) AS 'Suma Kosztów'
FROM healthcare_dataset$
GROUP BY 
	CASE
    WHEN Age BETWEEN 0 AND 18 THEN '0-18'
    WHEN Age BETWEEN 19 AND 30 THEN '19-30'
    WHEN Age BETWEEN 31 AND 50 THEN '31-50'
    WHEN Age BETWEEN 51 AND 65 THEN '51-65'
    ELSE '65+'
  END
ORDER BY 'Grupa wieku';


SELECT RoomNumber, ROUND(SUM(CAST(BillingAmount AS float)), 2) AS 'Suma Kosztów'
FROM healthcare_dataset$
GROUP BY RoomNumber;


SELECT Medication, COUNT(*) AS 'Liczba Przepisanych Dóz', ROUND(SUM(CAST(BillingAmount AS float)), 2) AS 'Suma Kosztów'
FROM healthcare_dataset$
WHERE Medication IS NOT NULL
GROUP BY Medication
ORDER BY 'Liczba Przepisanych Dóz' DESC;


SELECT TestResults, ROUND(SUM(CAST(BillingAmount AS float)), 2) AS 'Suma Kosztów'
FROM healthcare_dataset$
WHERE TestResults IS NOT NULL
GROUP BY TestResults
ORDER BY 'Suma Kosztów' DESC;
