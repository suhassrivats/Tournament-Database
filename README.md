# Udacity-Tournament-Database

Udacity-tournament-database is a simple database project completed for Udacity's full-stack [nanodegree program](https://www.udacity.com/nanodegree) program. The project demonstrates the design and use of a PostgreSQL database to manage a [swiss-system tournament](http://en.wikipedia.org/wiki/Swiss-system_tournament), which is a non-elimination tournament system used in certain sport and game competitions.   

## Table of contents

- [Documentation](#documentation)
- [Testing Information](#testing-information)
- [Copyright and license](#copyright-and-license)

### What's included

Within the download you'll find the following files:

```
udacity-tournament-database-master.zip
├── tournament.py
├── tournament.sql
├── tournament_test.py
└── README.md
```

## Documentation

To use the project files to setup a swiss-system tournament, follow the below steps. 

### 1. Download Files

Clone the project files: `git clone https://github.com/suhassrivats/Tournament-Database.git`

### 2. Create Database

Log into your PostgreSQL console and create a new database, for example:


```psql
CREATE DATABASE tournament
```

### 3. Create Tables 

Two database tables will be required. The first table is to track the players in the tournament (this can be used for individual players or teams). The second table is to track matches within the tournament. The create table statements (see below) are also provided in the `tournament.sql` file.

```psql
-- Create player table
CREATE TABLE player (
    id serial PRIMARY KEY,
    name text
);

-- Create match table
CREATE TABLE match (
    id serial PRIMARY KEY,
    winner integer,
    loser integer,
    FOREIGN KEY (winner) REFERENCES player(id),
    FOREIGN KEY (loser) REFERENCES player(id)
);
```

### 4. Import Functions

To use the tournament functions, `import tournament.py` into your python script.

```python
import tournament

```

## Testing Information

The project files also include the file `tournament_test.py`, which was used for testing that python functions met Udacity's project requirements. It is not needed to create a swiss-system tournament database or to use the provided functions. However, some may find it useful to test any modifications made to the tournament functions. 

To run `tournament_test.py` navigate to `/tournament` directory and then type `python tournament_test.py` in your command prompt and hit enter.

## Copyright and License

- tournament_test.py supplied without rights information, contributed by [Udacity](http://www.udacity.com).

## References

Thanks to @edwardbryant for this fantastic README writeup
