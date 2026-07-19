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