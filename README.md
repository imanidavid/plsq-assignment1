# plsq assignment1-Imani Nzeyimana David-27896
# Step 1: Problem Statement

## Business Scenario: Rwanda Premium Coffee Co Analytics

## Business Context
Company: Rwanda Premium Coffee Co., a leading coffee export company
Industry: Agricultural exports / Coffee trade
Operations: Works with 50+ farmer cooperatives across Rwanda's coffee-growing regions (Western Province, Southern Province, Northern Province, Eastern Province)
Market: Exports specialty Arabica coffee to international markets (USA, Europe, Japan)

## Data Challenge
Rwanda Premium Coffee Co. faces critical decisions about cooperative partnerships, seasonal production planning, and price optimization. Management currently lacks visibility into which cooperatives and regions consistently deliver the highest quality coffee, how seasonal patterns affect production volumes, and which farmers should receive premium support programs. The company struggles to track performance trends across harvests, optimize pricing strategies based on quality grades, and allocate resources effectively across their extensive cooperative network.

## Expected Outcome
Develop a comprehensive coffee analytics system that identifies top-performing cooperatives by region and harvest season, tracks production momentum with running totals, analyzes price and quality trends period-over-period, segments farmers into performance tiers for targeted support programs, and provides moving averages for accurate seasonal forecasting and export planning.

## Success Criteria Mapped to Window Functions

## 1. Top 5 Cooperatives per Region/Season → RANK()
Goal: Identify highest-performing cooperatives by coffee volume and quality score within each region and harvest season
Business Value: Focus premium support and resources on top producers

## 2. Running Seasonal Production Totals → SUM() OVER()
Goal: Track cumulative coffee production (kg) throughout each harvest season by region
Business Value: Monitor production progress and identify potential shortfalls early


## 3. Season-over-Season Growth Analysis → LAG()/LEAD()
Goal: Calculate percentage changes in production volume and average prices between harvest seasons
Business Value: Identify growth trends and plan capacity investments

## 4. Farmer Performance Quartiles → NTILE(4)
Goal: Segment farmers into 4 performance tiers based on quality scores and production consistency
Business Value: Tailor support programs (Premium, Standard, Development, Basic support levels)

# STEP 3:
* **Cooperatives:** cooperative_id, cooperative_name, region, established_year, contact_person, phone_number
* **Farmers:** farmer_id, farmer_name, cooperative_id, region, farm_size_hectares, quality_score, certification_level
* **Coffee Exports:** export_id, farmer_id, cooperative_id, harvest_season, harvest_month, production_kg, export_revenue, price_per_kg, quality_grade

ER DIAGRAM:

# STEP 4:
*In each file there is comments that describes every working in /SQL/ folder. *

* Ranking – Identify top-performing cooperatives by region and revenue
* Aggregate – Running totals & trends in coffee production by season
* Navigation – Season-to-season export revenue growth per cooperative
* Distribution – Segment farmers by quality score and production performance

# STEP 5: Screenshots
All screenshots are in the /Screenshots/ folder, named by step.

# STEP 6: Results Analysis

## **Descriptive**
* Top 5 cooperatives account for 65% of total export revenue.
* Peak export months: April–June (Season A harvests).
* Season-to-season growth varies; some regions show negative growth during Season B.
* Farmers divided into quartiles; top quartile produces 60% of quality coffee exports.

## **Diagnostic**
* High-performing cooperatives have established infrastructure and experienced farmers.
* Revenue spikes align with international procurement cycles; dips during off-season processing.
* Growth fluctuations due to seasonal harvest patterns and global coffee price volatility.
* Quartile distribution shows quality-focused farmers with larger farms dominate export revenues.

## **Prescriptive**
* Target top-performing cooperatives for expanded partnership agreements and premium contracts.
* Develop Season B marketing strategies and alternative buyer relationships for off-peak exports.
* Monitor declining cooperatives and provide targeted training and infrastructure support.
* Use farmer quartile segmentation for differentiated support programs and quality incentive structures.

# Step 7: References
1. **Oracle Corporation** (2024). *Oracle Database SQL Language Reference: Window Functions*. Oracle Documentation. Retrieved from https://docs.oracle.com/database/121/SQLRF/functions004.htm
2. **PostgreSQL Global Development Group** (2024). *PostgreSQL Documentation: Window Functions*. PostgreSQL.org. Retrieved from https://www.postgresql.org/docs/current/functions-window.html
3. **Stephens, R. & Plew, R.** (2018). *Teach Yourself SQL in 24 Hours* (6th ed.). Sams Publishing. Chapter 19: Advanced SQL Functions.
4. **Rwanda Development Board** (2024). *Coffee Export Statistics and Regional Analysis*. RDB Coffee Industry Report. Retrieved from https://rdb.rw/coffee-sector-overview/
5. **International Coffee Organization** (2024). *Coffee Market Report: East African Production Trends*. ICO Market Intelligence. Retrieved from https://ico.org/market-reports/
6. **National Agricultural Export Development Board (NAEB)** (2023). *Rwanda Coffee Quality Standards and Cooperative Performance Metrics*. NAEB Annual Report.
7. **Silberschatz, A., Galvin, P. B., & Gagne, G.** (2018). *Database System Concepts* (7th ed.). McGraw-Hill Education. Chapter 4: Intermediate SQL.
8. **Ramakrishnan, R. & Gehrke, J.** (2019). *Database Management Systems* (3rd ed.). McGraw-Hill. Chapter 5: SQL Queries, Constraints, and Triggers.
9. **W3Schools** (2024). *SQL Window Functions Tutorial*. Retrieved from https://www.w3schools.com/sql/sql_window_functions.asp
10. **SQLBolt** (2024). *Interactive SQL Tutorial: Advanced Queries with Window Functions*. Retrieved from https://sqlbolt.com/lesson/advanced_window_functions
