-- View data
SELECT * FROM evindia;

-- Count total rows
SELECT COUNT(*) AS total_rows
FROM evindia;

-- Check duplicate cars
SELECT Car, COUNT(*) AS count
FROM evindia
GROUP BY Car
HAVING COUNT(*) > 1;

-- Remove extra spaces
UPDATE evindia
SET Car = TRIM(Car),
    Style = TRIM(Style),
    Transmission = TRIM(Transmission),
    VehicleType = TRIM(VehicleType);

-- View final data
SELECT * FROM evindia;