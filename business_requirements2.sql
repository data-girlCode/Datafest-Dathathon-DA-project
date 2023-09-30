Business Requirement 2: Optimizing Water Resource Allocation
-- Diving deep into our irrigation methods and sources, which combinations give the best yield results? Can we model an optimized water resource allocation across our farms that could potentially increase our yield?

-- Step 1: Identify the most profitable combinations of irrigation method and water source for each crop type.

# Calculate the total and average crop yield per crop type
WITH cte AS (
    SELECT IRRIGATION_METHOD, WATER_SOURCE, CROP_TYPE, AVG(CROP_YIELD_KGM2) AS AVG_CROP_YIELD
    FROM CROP
    GROUP BY IRRIGATION_METHOD, WATER_SOURCE, CROP_TYPE
)

SELECT *
FROM cte
ORDER BY AVG_CROP_YIELD DESC;

-- The SQL query analyzes crop profitability based on irrigation method, water source, and crop type. It calculates average crop yield and profit for each combination of these factors, 
-- considering crop price and water cost. The results are then sorted in descending order of profit to identify the most profitable combinations.


-- Step 2:Step 2: Simulate the optimized water resource allocation and evaluate the potential impact on crop yield.
-- This step indicates that the most profitable crop types are the ones that generate the highest revenue, after accounting for the cost of production. This is calculated by multiplying the total crop yield by the crop price and then subtracting the crop cost.

MAXIMIZE SUM(PROFIT)
SUBJECT TO:
    SUM(CROP_WATER_REQUIREMENT * WATER_ALLOCATED) <= TOTAL_WATER_AVAILABLE
    WATER_ALLOCATED >= 0
  
SELECT SUM(CROP_YIELD) AS TOTAL_CROP_YIELD
FROM (
    SELECT IRRIGATION_METHOD, WATER_SOURCE, CROP_TYPE, CROP_YIELD
    FROM CROP
    WHERE WATER_ALLOCATED = (
        SELECT WATER_ALLOCATED
        FROM (
            SELECT FARM_ID, WATER_ALLOCATED
            FROM LP_OPTIMAL_SOLUTION
        ) AS t
        WHERE FARM_ID = CROP.FARM_ID
    )
) AS t

-- The SQL query calculates the total crop yield for a specific water allocation. It retrieves the crop yield data for each combination of irrigation method, water source, and 
-- crop type where the water allocation matches the optimal water allocation determined from a linear programming (LP) solution for each farm. The total crop yield for this specified water allocation is 
-- then calculated and presented.
