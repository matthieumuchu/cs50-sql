"""In order to integrate these databases into web applications, the Python code running the web server must also be able to run SQL commands.
SQLAlchemy is a Python library that allows for this functionality.
Starting with simple Python outside of a web context, here’s how one might go about printing all the flights in the flights table: """

import os

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

engine = create_engine(os.getenv("DATABASE_URL")) # database engine object from SQLAlchemy that manages connections to the database
                                                    # DATABASE_URL is an environment variable that indicates where the database lives
db = scoped_session(sessionmaker(bind=engine))    # create a 'scoped session' that ensures different users' interactions with the
                                                    # database are kept separate

flights = db.execute("SELECT origin, destination, duration FROM flights").fetchall() # execute this SQL command and return all of the results
for flight in flights
    print(f"{flight.origin} to {flight.destination}, {flight.duration} minutes.") # for every flight, print out the flight info


#flights is a list of the rows the came back from the SQL query. The individual columns in each row can be accessed with dot notation.
#Data can also be inserted into a database with Python. In this example, the raw data is coming from a CSV (comma-separated values) file:

import csv

  # same import and setup statements as above

f = open("flights.csv")
reader = csv.reader(f)
for origin, destination, duration in reader: # loop gives each column a name
    db.execute("INSERT INTO flights (origin, destination, duration) VALUES (:origin, :destination, :duration)",
                {"origin": origin, "destination": destination, "duration": duration}) # substitute values from CSV line into SQL command, as per this dict
    print(f"Added flight from {origin} to {destination} lasting {duration} minutes.")
db.commit() # transactions are assumed, so close the transaction finished

#The colon notation used in db.execute() call is Postgres’ placeholder notation for values.
#This allows for the substitution of Python variables into SQL commands.
#Additionally, SQLAlchemy automatically takes care of sanitizing the values passed in.
