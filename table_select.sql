SELECT * FROM flights;
 SELECT origin, destination FROM flights;
 SELECT * FROM flights WHERE id = 3;
 SELECT * FROM flights WHERE origin = 'New York';
 SELECT * FROM flights WHERE duration > 500;
 SELECT * FROM flights WHERE destination = 'Paris' AND duration > 500;
 SELECT * FROM flights WHERE destination = 'Paris' OR duration > 500;
 SELECT AVG(duration) FROM flights WHERE origin = 'New York';
 SELECT * FROM flights WHERE origin LIKE '%a%';
 SELECT * FROM flights LIMIT 2;
 SELECT * FROM flights ORDER BY duration ASC;
 SELECT * FROM flights ORDER BY duration ASC LIMIT 3;
 SELECT origin, COUNT(*) FROM flights GROUP BY origin;
 SELECT origin, COUNT(*) FROM flights GROUP BY origin HAVING COUNT(*) > 1;
--The query after SELECT indicates what columns are being selected.
--The query after WHERE indicates constraints on what rows are being selected.
-- * is a wildcard that indicates ‘all’.

/*If a SQL function is passed as a column selector, a column with the return value of that function will be returned. Useful functions include:
AVG(column) : returns the average value
COUNT(*) : returns the number of rows returned by the database
MIN(column) : returns the minimum value
MAX(column) : returns the maximum value*/

--LIKE is a keyword that takes a template string and returns all rows where the column fits that template. % is a wildcard that will match any text. In the example above, any row with an ‘a’ in the origin column will be returned.
--LIMIT sets the maximum number of rows to be returned.
--ORDER BY organizes rows by a given column in either ascending (ASC) or descending (DESC) order before returning rows.
--GROUP BY organizes rows by grouping the same values in a given column together.
--HAVING is an optional specifier for GROUP BY which limits what rows are going to be returned, similar to WHERE
