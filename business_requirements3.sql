-- Business Requirement 3: Regional Profitability Potential
-- Analyzing the regions and their respective performances, where should we consider expanding? Are there underperforming regions where a shift in strategy or resources could unlock untapped potential?

-- Step 1: Calculate the total and average crop yield per region
SELECT 
  LOCATION,
  SUM(CROP_YIELD_KGM2) AS TOTAL_CROP_YIELD
  AVG(CROP_YIELD_KGM2) AS AVG_CROP_YIELD
FROM CROP
GROUP BY LOCATION
ORDER BY TOTAL_CROP_YIELD DESC;

-- This query calculates the average profit for each region. You can then use this information to identify the regions with the highest average profits. These are the regions where you should consider expanding.

-- Step 2: Identify underperforming regions where a shift in strategy or resources could unlock untapped potential.
SELECT 
  LOCATION,
  AVG(PROFIT) AS AVG_PROFIT
FROM CROP
GROUP BY LOCATION
HAVING AVG_PROFIT < (
  SELECT AVG(PROFIT)
  FROM CROP
);

-- The SQL query computes the average profit for each region. It compares these average profits with the overall average profit across all regions. It selects regions where the average profit is below the overall average profit, aiming to identify regions with profitability lower than the overall average.

-- Step 3: Analyzing the regions and their respective performances
-- Calculate the average profit for each region
SELECT LOCATION, AVG(PROFIT) AS AVG_PROFIT
FROM CROP
GROUP BY LOCATION
ORDER BY AVG_PROFIT DESC;

-- Identify underperforming regions
SELECT LOCATION, AVG(PROFIT) AS AVG_PROFIT
FROM CROP
GROUP BY LOCATION
HAVING AVG_PROFIT < (
    SELECT AVG(PROFIT)
    FROM CROP
);
