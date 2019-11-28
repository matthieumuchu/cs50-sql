UPDATE flights
      SET duration = 430
      WHERE origin = 'New York'
      AND destination = 'London';


--SET overwrites a column in all the rows that match the WHERE query.
