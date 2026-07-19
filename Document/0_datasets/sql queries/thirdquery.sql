-- View data
SELECT * FROM electric_vehicle_charging_station_list;

-- Count total rows
SELECT COUNT(*) AS total_rows
FROM electric_vehicle_charging_station_list;

-- Remove extra spaces
UPDATE electric_vehicle_charging_station_list
SET region = TRIM(region),
    address = TRIM(address),
    `aux addres` = TRIM(`aux addres`),
    type = TRIM(type),
    power = TRIM(power),
    service = TRIM(service);

-- Check invalid coordinates
SELECT *
FROM electric_vehicle_charging_station_list
WHERE latitude NOT BETWEEN -90 AND 90
   OR longitude NOT BETWEEN -180 AND 180;

-- Create a clean table without exact duplicate rows
CREATE TABLE charging_station_clean AS
SELECT DISTINCT *
FROM electric_vehicle_charging_station_list;

-- View cleaned data
SELECT * FROM charging_station_clean;