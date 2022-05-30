SELECT *
FROM acc_intakes
WHERE name IS NULL
;

SELECT animal_id, found_location
FROM acc_intakes
WHERE found_location LIKE '%Austin%'
;

SELECT animal_type, COUNT(animal_type) AS total
FROM acc_intakes
GROUP BY animal_type
ORDER BY total DESC
;

SELECT animal_id, age_upon_intake
FROM acc_intakes
WHERE animal_type LIKE 'Dog' AND intake_condition LIKE 'Aged'
;

SELECT animal_type, MAX(datetime) AS last_date
FROM acc_intakes
GROUP BY animal_type
ORDER BY COUNT(animal_type) DESC
;

