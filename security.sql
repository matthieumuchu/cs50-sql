--Security Concerns


--One potential concern when using SQL is that a user will be able to enter malicious commands into a database.
--Take, for example, a simple login form that asks for a password and username.
--What the user enters in those fields might be put into a SQL command to select their account from a table of accounts like so:

  SELECT * FROM users
      WHERE (username = 'username')
      AND (password = 'password')


--If someone guesses that there is SQL code like that above running behind the scenes, they could potentially gain access to someone else’s account
--by entering the follwing as their password: 1' OR '1' = '1. While this may look strange out of context, when it’s processed into the SELECT query, this is the result:

  SELECT * FROM users
      WHERE (username = 'hacker')
      AND (password = '1' OR '1' = '1');


--By putting single-quotes in smart places, the user cleverly edited the SQL query. '1' is always equal to '1', so it doesn’t matter what the user’s password is.
--The account with username hacker will still be returned.

--SOLUTION
/* In order to prevent these so-called ‘SQL injection attacks’, it is important to ‘sanitize’ any user input that is going into a SQL command.
This means properly ‘escaping’ characters like ', which can drastically change the meaning of the command, so that it is interpeted as simply the ' character.
Otherwise, there is the risk of malicious users editing or even deleting entire databases in this way. */


/*Another way that things can go wrong is if two users try to modify or access a database at the same time, and SQL commands get executed in an unexpected order.
This is the problem of ‘race conditions’. Consider a case where a bank information is stored in a database and two customers, who share an account, try to make withdrawals simultaneously.
The SQL commands that get executed when money is withdrawn might look like this:*/

  SELECT balance FROM bank WHERE user_id = 1;
  UPDATE bank SET balance = balance - 100 WHERE user_id = 1;



--First, the customer’s balance must be checked to make sure that they have enough money.
--Then, the balance is updated to reflect their withdrawal.
--Since each command takes some amount of time to run, it is possible that two customers at two ATMs make withdrawls with just the right timing so that the customer B’s SELECT query runs before customer A’s UPDATE query.
--Even though customer A might already have taken the last $100 in the account, since the database hasn’t been updated, when customer B asks for $100, the database will allow the withdrawal.


--SOLUTION
/* The solution to race conditions is to implement SQL transactions.
During a transaction, the database is essentially locked so that another user cannot make a request until it is complete.
A transaction is opened with BEGIN and closed with COMMIT */
