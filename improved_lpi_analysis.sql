-- Improved LPI CAGR Analysis Queries
-- Fixes quintile descriptions, adds error handling, and optimizes performance

-- =============================================================================
-- Query 1: Summary Statistics for CAGR Analysis
-- Provides overview of growth patterns in LPI scores from 2007-2023
-- =============================================================================

SELECT 
    COUNT(*) as Total_Countries, 
    ROUND(AVG(CAGR), 3) as Average_CAGR,
    ROUND(MIN(CAGR), 3) as Minimum_CAGR,
    ROUND(MAX(CAGR), 3) as Maximum_CAGR,
    ROUND(
        (COUNT(CASE WHEN CAGR > 0 THEN 1 END) * 100.0 / COUNT(*)), 2
    ) as Positive_Growth_Percentage,
    COUNT(CASE WHEN CAGR > 0 THEN 1 END) as Positive_Growth_Countries,
    COUNT(CASE WHEN CAGR < 0 THEN 1 END) as Negative_Growth_Countries,
    COUNT(CASE WHEN CAGR = 0 THEN 1 END) as Zero_Growth_Countries,
    COUNT(CASE WHEN CAGR IS NULL THEN 1 END) as Countries_Missing_Data
FROM LPI_CAGR;

-- =============================================================================
-- Query 2: Quintile Analysis with Corrected Descriptions and Performance Optimization
-- Uses CTE to avoid repeated NTILE calculations and fixes quintile descriptions
-- =============================================================================

WITH quintile_data AS (
    SELECT 
        Country, 
        COALESCE(CAGR, 0) as CAGR,  -- Handle NULL values
        NTILE(5) OVER (ORDER BY CAGR DESC) as quintile_rank
    FROM LPI_CAGR
    WHERE CAGR IS NOT NULL  -- Exclude NULL values from quintile calculation
),
quintile_with_categories AS (
    SELECT 
        Country, 
        CAGR,
        quintile_rank,
        CASE quintile_rank
            WHEN 1 THEN 'Top Quintile (80-100%)'
            WHEN 2 THEN 'Second Quintile (60-80%)'
            WHEN 3 THEN 'Third Quintile (40-60%)'
            WHEN 4 THEN 'Fourth Quintile (20-40%)'
            WHEN 5 THEN 'Bottom Quintile (0-20%)'
        END as Quintile_Category
    FROM quintile_data
)
SELECT 
    Country, 
    CAGR,
    quintile_rank as Quintile,
    Quintile_Category
FROM quintile_with_categories 
ORDER BY CAGR DESC;

-- =============================================================================
-- Query 3: Data Quality Validation
-- Check for potential data issues
-- =============================================================================

-- Check for duplicate countries
SELECT 
    'Duplicate Countries' as Check_Type,
    Country, 
    COUNT(*) as duplicate_count 
FROM LPI_CAGR 
GROUP BY Country 
HAVING COUNT(*) > 1
UNION ALL
-- Check for outliers (CAGR outside reasonable range)
SELECT 
    'CAGR Outliers' as Check_Type,
    Country || ' (CAGR: ' || ROUND(CAGR, 4) || ')' as Country,
    1 as duplicate_count
FROM LPI_CAGR 
WHERE ABS(CAGR) > 0.15;  -- Flag CAGR > 15% or < -15%

-- =============================================================================
-- Query 4: Quintile Summary Statistics
-- Provides summary stats for each quintile group
-- =============================================================================

WITH quintile_data AS (
    SELECT 
        Country, 
        CAGR,
        NTILE(5) OVER (ORDER BY CAGR DESC) as quintile_rank
    FROM LPI_CAGR
    WHERE CAGR IS NOT NULL
)
SELECT 
    quintile_rank as Quintile,
    CASE quintile_rank
        WHEN 1 THEN 'Top Quintile (80-100%)'
        WHEN 2 THEN 'Second Quintile (60-80%)'
        WHEN 3 THEN 'Third Quintile (40-60%)'
        WHEN 4 THEN 'Fourth Quintile (20-40%)'
        WHEN 5 THEN 'Bottom Quintile (0-20%)'
    END as Quintile_Category,
    COUNT(*) as Countries_Count,
    ROUND(AVG(CAGR), 4) as Avg_CAGR,
    ROUND(MIN(CAGR), 4) as Min_CAGR,
    ROUND(MAX(CAGR), 4) as Max_CAGR
FROM quintile_data
GROUP BY quintile_rank
ORDER BY quintile_rank;