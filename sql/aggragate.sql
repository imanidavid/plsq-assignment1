SELECT 
    e.farmer_id,
    f.farmer_name,
    e.harvest_month,
    e.export_revenue,
    SUM(e.export_revenue) OVER (
        PARTITION BY e.farmer_id 
        ORDER BY e.harvest_month 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_rows,
    SUM(e.export_revenue) OVER (
        PARTITION BY e.farmer_id 
        ORDER BY e.harvest_month 
        RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_range,
    AVG(e.export_revenue) OVER (PARTITION BY e.farmer_id) AS avg_revenue,
    MIN(e.export_revenue) OVER (PARTITION BY e.farmer_id) AS min_revenue,
    MAX(e.export_revenue) OVER (PARTITION BY e.farmer_id) AS max_revenue
FROM coffee_exports e
JOIN farmers f ON e.farmer_id = f.farmer_id;
