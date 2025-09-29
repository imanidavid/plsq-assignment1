SELECT 
    f.farmer_id,
    f.farmer_name,
    SUM(e.export_revenue) AS total_revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(e.export_revenue) DESC) AS row_num,
    RANK()       OVER (ORDER BY SUM(e.export_revenue) DESC) AS rank_num,
    DENSE_RANK() OVER (ORDER BY SUM(e.export_revenue) DESC) AS dense_rank_num,
    PERCENT_RANK() OVER (ORDER BY SUM(e.export_revenue) DESC) AS percent_rank_num
FROM coffee_exports e
JOIN farmers f ON e.farmer_id = f.farmer_id
GROUP BY f.farmer_id, f.farmer_name;
