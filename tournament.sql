-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;

-- Connect to the database
\c tournament

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

-- Number of wins by a player
CREATE VIEW wins AS
    SELECT p.id, p.name, count(m.winner) as n
    from match as m left join player as p
    on p.id=m.winner
    group by p.id
    order by p.id;

-- Number of matches played by a player
CREATE VIEW no_of_matches AS
    select
        id, name,
        coalesce(wins, 0) as no_of_wins,
        coalesce(loses, 0) as no_of_loses,
        coalesce(wins, 0) + coalesce(loses, 0) as total
    from (
        select winner as id, count(*) as wins
        from match
        group by 1
        ) w
    full join (
        select loser as id, count(*) as loses
        from match
        group by 1
        ) l using (id)
    full join player using(id)
    order by id;
