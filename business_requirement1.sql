Business Requirement 1: Crop Profitability Analysis
-- Given our crop yields and the varying environmental factors, which crops are most profitable across our farms? How might changes in soil, pest, or whether conditions project into future profitability?

  -- Step 1: Which crops are the most profitable across our farms
-- This step involves analyzing the current crop yields for each crop type to determine their current profitability.

# Calculate the total and average crop yield per crop type
SELECT CROP_TYPE, SUM(CROP_YIELD_KGM2) AS TOTAL_CROP_YIELD, AVG(CROP_YIELD_KGM2) AS AVG_CROP_YIELD
FROM CROP
GROUP BY CROP_TYPE
ORDER BY TOTAL_CROP_YIELD DESC;

# Calculate the profit per crop type
SELECT CROP_TYPE, (SUM(CROP_YIELD_KGM2) * CROP_PRICE) - CROP_COST AS PROFIT
FROM CROP
GROUP BY CROP_TYPE
ORDER BY PROFIT DESC;

-- Step 2: How might changes in soil, pests, or weather conditions project into future profitability?
-- This step indicates that the most profitable crop types are the ones that generate the highest revenue, after accounting for the cost of production. This is calculated by multiplying the total crop yield by the crop price and then subtracting the crop cost.
# Calculate the correlation between crop yield and soil quality
SELECT CROP_TYPE, CORR(CROP_YIELD_KGM2, SOIL_QUALITY) AS CORR_CROP_YIELD_SOIL_QUALITY
FROM CROP
JOIN SOIL ON CROP.LOCATION_ID = SOIL.LOCATION_ID
GROUP BY CROP_TYPE
ORDER BY CORR_CROP_YIELD_SOIL_QUALITY DESC;

# Calculate the correlation between crop yield and pest severity
SELECT CROP_TYPE, CORR(CROP_YIELD_KGM2, PEST_SEVERITY) AS CORR_CROP_YIELD_PEST_SEVERITY
FROM CROP
JOIN PEST ON CROP.LOCATION_ID = PEST.LOCATION_ID
GROUP BY CROP_TYPE
ORDER BY CORR_CROP_YIELD_PEST_SEVERITY DESC;

# Calculate the correlation between crop yield and weather conditions
SELECT CROP_TYPE, CORR(CROP_YIELD_KGM2, WEATHER_CONDITION) AS CORR_CROP_YIELD_WEATHER_CONDITION
FROM CROP
JOIN WEATHER ON CROP.LOCATION_ID = WEATHER.LOCATION_ID
GROUP BY CROP_TYPE
ORDER BY CORR_CROP_YIELD_WEATHER_CONDITION DESC;


