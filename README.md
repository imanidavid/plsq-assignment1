# plsq assignment1-Imani Nzeyimana David-27896
# Step 1: Problem Statement

# Business Scenario: Rwanda Premium Coffee Co Analytics

# Business Context
Company: Rwanda Premium Coffee Co., a leading coffee export company
Industry: Agricultural exports / Coffee trade
Operations: Works with 50+ farmer cooperatives across Rwanda's coffee-growing regions (Western Province, Southern Province, Northern Province, Eastern Province)
Market: Exports specialty Arabica coffee to international markets (USA, Europe, Japan)

 Data Challenge
Rwanda Premium Coffee Co. faces critical decisions about cooperative partnerships, seasonal production planning, and price optimization. Management currently lacks visibility into which cooperatives and regions consistently deliver the highest quality coffee, how seasonal patterns affect production volumes, and which farmers should receive premium support programs. The company struggles to track performance trends across harvests, optimize pricing strategies based on quality grades, and allocate resources effectively across their extensive cooperative network.

# Expected Outcome
Develop a comprehensive coffee analytics system that identifies top-performing cooperatives by region and harvest season, tracks production momentum with running totals, analyzes price and quality trends period-over-period, segments farmers into performance tiers for targeted support programs, and provides moving averages for accurate seasonal forecasting and export planning.

# Success Criteria Mapped to Window Functions

# 1. Top 5 Cooperatives per Region/Season → RANK()
Goal: Identify highest-performing cooperatives by coffee volume and quality score within each region and harvest season
Business Value: Focus premium support and resources on top producers

# 2. Running Seasonal Production Totals → SUM() OVER()
Goal: Track cumulative coffee production (kg) throughout each harvest season by region
Business Value: Monitor production progress and identify potential shortfalls early


# 3. Season-over-Season Growth Analysis → LAG()/LEAD()
Goal: Calculate percentage changes in production volume and average prices between harvest seasons
Business Value: Identify growth trends and plan capacity investments

# 4. Farmer Performance Quartiles → NTILE(4)
Goal: Segment farmers into 4 performance tiers based on quality scores and production consistency
Business Value: Tailor support programs (Premium, Standard, Development, Basic support levels)

# 5. 3-Season Moving Averages → AVG() OVER()
Goal: Calculate rolling averages for production volume, quality scores, and export prices
Business Value: Smooth out seasonal variations for accurate forecasting and planning

SELECT
    harvest_season,
    total_export_revenue,
    AVG(total_export_revenue) OVER (
        ORDER BY harvest_season
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_rows,
    AVG(total_export_revenue) OVER (
        ORDER BY harvest_season
        RANGE BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_range
FROM seasonal_export_revenue;

