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