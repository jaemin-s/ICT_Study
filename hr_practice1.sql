SELECT drug_name, ingredient FROM 
(SELECT TRUNC(prescription_date+days_medication-sysdate) AS remain,drug_number  FROM prescriptions WHERE patient_id = '123456-1234567') a
 JOIN drugs d ON a.drug_number = d.drug_number WHERE remain > 0;

