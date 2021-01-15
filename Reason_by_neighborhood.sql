CREATE VIEW summed_incidents AS(WITH cte AS(SELECT COUNT(*) AS type_count,reason, CAST(city_council_district AS text) AS city_council_district FROM service_requests GROUP BY city_council_district, reason)
SELECT SUM(type_count) AS sum_type, city_council_district, reason FROM cte GROUP BY city_council_district, reason);
SELECT * FROM summed_incidents;
--Following query was adapted from https://stackoverflow.com/questions/22785569/how-to-select-a-max-row-for-each-group-in-sql
 WITH NeighborhoodReason AS
  (SELECT city_council_district,sum_type, reason, ROW_NUMBER() OVER(PARTITION BY city_council_district ORDER BY city_council_district,sum_type DESC) AS RowNumber 
     FROM summed_incidents) 
 select * from  NeighborhoodReason
 where RowNumber=1;

