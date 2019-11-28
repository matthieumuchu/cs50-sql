--Nested queries are yet another way to make more complex selections:

  SELECT * FROM flights WHERE id IN
  (SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*) > 1);



--First, in the inner query, a table containing flight_id for flights with more than 1 passenger will be returned.
--Then, in the outer query, all rows from flights will be selected that have an id in the table returned by the inner query.
--In other words, this nested query returns flight info for flights with more than 1 passenger.
