SELECT 
    f.farmer_id,
    f.farmer_name,
    SUM(e.export_revenue) AS total_revenue,
    NTILE(4) OVER (ORDER BY SUM(e.export_revenue) DESC) AS revenue_quartile,
    CUME_DIST() OVER (ORDER BY SUM(e.export_revenue) DESC) AS cumulative_distribution
FROM coffee_exports e
JOIN farmers f ON e.farmer_id = f.farmer_id
GROUP BY f.farmer_id, f.farmer_name;
