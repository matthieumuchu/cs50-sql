CREATE TABLE flights (
     id SERIAL PRIMARY KEY,
     origin VARCHAR NOT NULL,
     destination VARCHAR NOT NULL,
     duration INTEGER NOT NULL
 );

 --Note that there is no id field. Because id is of type SERIAL, it will increment and be set automatically.
 --The order of values in VALUES must match the order listed earlier in the command.
 --This command could also be entered all in one line.
