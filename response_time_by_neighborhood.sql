--Citation: http://sqlines.com/postgresql/how-to/datediff
WITH cte AS(SELECT DATE_PART('day', closed_dt - open_dt) AS duration, neighborhood FROM service_requests WHERE closed_dt IS NOT NULL)
SELECT AVG(duration) AS neighborhood_mean, neighborhood FROM cte WHERE neighborhood IS NOT NULL GROUP BY neighborhood;