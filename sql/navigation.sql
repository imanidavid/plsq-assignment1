SELECT 
    e.farmer_id,
    f.farmer_name,
    e.harvest_month,
    e.export_revenue,
    LAG(e.export_revenue)  OVER (PARTITION BY e.farmer_id ORDER BY e.harvest_month) AS prev_revenue,
    LEAD(e.export_revenue) OVER (PARTITION BY e.farmer_id ORDER BY e.harvest_month) AS next_revenue,
    ROUND(
        (e.export_revenue - LAG(e.export_revenue) OVER (PARTITION BY e.farmer_id ORDER BY e.harvest_month))
        / NULLIF(LAG(e.export_revenue) OVER (PARTITION BY e.farmer_id ORDER BY e.harvest_month), 0) * 100,
        2
    ) AS growth_percent
FROM coffee_exports e
JOIN farmers f ON e.farmer_id = f.farmer_id;
