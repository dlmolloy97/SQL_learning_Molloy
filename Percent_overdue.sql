CREATE VIEW count_overdue AS(SELECT COUNT(*) AS overdue, Neighborhood FROM service_requests WHERE ontime='OVERDUE' AND Neighborhood IS NOT NULL GROUP BY Neighborhood);
CREATE VIEW count_total AS(SELECT COUNT(*) AS total, Neighborhood FROM service_requests WHERE Neighborhood IS NOT NULL GROUP BY Neighborhood);
WITH cte AS(SELECT CAST(overdue AS numeric), o.Neighborhood, CAST(total AS numeric) FROM count_overdue AS o INNER JOIN count_total AS t ON o.Neighborhood=t.neighborhood)
SELECT overdue/total AS percent_overdue, neighborhood FROM cte;
