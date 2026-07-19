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
-- View data
SELECT * FROM electriccardata_clean;

-- Count total rows
SELECT COUNT(*) AS total_rows
FROM electriccardata_clean;

-- Check duplicate Brand and Model
SELECT Brand, Model, COUNT(*) AS count
FROM electriccardata_clean
GROUP BY Brand, Model
HAVING COUNT(*) > 1;

-- Remove extra spaces
UPDATE electriccardata_clean
SET Brand = TRIM(Brand),
    Model = TRIM(Model),
    RapidCharge = TRIM(RapidCharge),
    PowerTrain = TRIM(PowerTrain),
    BodyStyle = TRIM(BodyStyle);

-- Check invalid values
SELECT *
FROM electriccardata_clean
WHERE Range_Km <= 0
   OR TopSpeed_KmH <= 0
   OR PriceEuro <= 0;

-- View final data
SELECT * FROM electriccardata_clean;
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
-- View data
SELECT * FROM `cheapestelectriccars-evdatabase`;

-- Count total rows
SELECT COUNT(*) AS total_rows
FROM `cheapestelectriccars-evdatabase`;

-- Check missing German prices
SELECT *
FROM `cheapestelectriccars-evdatabase`
WHERE PriceinGermany IS NULL;

-- Check missing UK prices
SELECT *
FROM `cheapestelectriccars-evdatabase`
WHERE PriceinUK IS NULL;

-- Remove extra spaces
UPDATE `cheapestelectriccars-evdatabase`
SET Name = TRIM(Name),
    Subtitle = TRIM(Subtitle),
    Drive = TRIM(Drive);

-- Check duplicate car names
SELECT Name, COUNT(*) AS count
FROM `cheapestelectriccars-evdatabase`
GROUP BY Name
HAVING COUNT(*) > 1;

-- View final data
SELECT * FROM `cheapestelectriccars-evdatabase`;