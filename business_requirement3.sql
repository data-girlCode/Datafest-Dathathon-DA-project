-- Business Requirement 3: Regional Profitability Potential
-- Analyzing the regions and their respective performances, where should we consider expanding? Are there underperforming regions where a shift in strategy or resources could unlock untapped potential?

-- Step 1: Calculate the total and average crop yield per region
SELECT LOCATION, AVG(PROFIT) AS AVG_PROFIT
FROM CROP
GROUP BY LOCATION
ORDER BY AVG_PROFIT DESC;

-- Step 2: Identify underperforming regions where a shift in strategy or resources could unlock untapped potential.
-- This query calculates the average profit for each region. You can then use this information to identify the regions with the highest average profits. These are the regions where you should consider expanding.
-- Calculate the average profit for each region
SELECT REGION, AVG(PROFIT) AS AVG_PROFIT
FROM CROP
GROUP BY REGION
ORDER BY AVG_PROFIT DESC;

-- Identify underperforming regions
SELECT REGION, AVG(PROFIT) AS AVG_PROFIT
FROM CROP
GROUP BY REGION
HAVING AVG_PROFIT < (
    SELECT AVG(PROFIT)
    FROM CROP
);

-- Step 3: Analyzing the regions and their respective performances
-- Calculate the average profit for each region
SELECT REGION, AVG(PROFIT) AS AVG_PROFIT
FROM CROP
GROUP BY REGION
ORDER BY AVG_PROFIT DESC;

-- Identify underperforming regions
SELECT REGION, AVG(PROFIT) AS AVG_PROFIT
FROM CROP
GROUP BY REGION
HAVING AVG_PROFIT < (
    SELECT AVG(PROFIT)
    FROM CROP
);

-- The first query calculates the average profit for each region, sorting the results in descending order based on average profit. It helps in understanding the profitability of different regions.
-- The second query identifies regions that underperform in terms of profitability by comparing the average profit of each region with the overall average profit. It selects regions where the average profit is below the overall average, indicating regions with lower profitability compared to the average across all regions.


