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

### 5. Use Functions 

#### connect()
Connects to the PostgreSQL database and returns a database connection.

#### deleteMatches()
Remove all match records from the database.

#### deletePlayers()
Remove all player records from the database.

#### countPlayers()
Returns the number of players currently registered in the tournament.

#### registerPlayer(name)
Adds a player to the tournament database (can be any name - individuals or teams). The database assigns a unique serial id number for each player. The name used does not have to be unique.

#### playerStandings()
Returns a list of the players and their win records, sorted by wins. Therefore, the first entry is the player in first place or a player tied for first place if there is currently a tie. The returned list of tuples each contains the player's id, name, matches won, and number of matches played by the player).

#### reportMatch(winner, loser)
Creates a new match record, recording the winner and the loser of the match. The arguments for the winner and the loser must be the id numbers for each player.  

#### swissPairings()
Returns a list containing pairs of players for the next round of the tournament. The function assumes an even number of players registered and pairs players based on an equal or nearly-equal win record (i.e., it pairs players who are adjacent in the standings). The returned list of tuples each contain the id and name of both paired players (id1, name1, id2, name2).

## Testing Information

The project files also include the file `tournament_test.py`, which was used for testing that python functions met Udacity's project requirements. It is not needed to create a swiss-system tournament database or to use the provided functions. However, some may find it useful to test any modifications made to the tournament functions. 

## Copyright and License

- tournament_test.py supplied without rights information, contributed by [Udacity](http://www.udacity.com).

## References

Thanks to @edwardbryant for this fantastic README writeup
