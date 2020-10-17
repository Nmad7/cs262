--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @edited Noah Madrid
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS PlayerProperty;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Property;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp,
	ongoing boolean
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50),
	setType varchar(50)
);

CREATE TABLE Player (
	ID integer PRIMARY KEY,
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerProperty (
	playerID integer REFERENCES Player(ID),
	propertyID integer REFERENCES Property(ID),
	gameID integer REFERENCES Game(ID),
	houses integer,
	hotels integer
);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	locationID integer REFERENCES Property(ID)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON PlayerProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00', FALSE);
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00', FALSE);
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00', FALSE);

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

-- Both cash and player position are null because the game has ended
INSERT INTO PlayerGame VALUES (1, 1, 0.00, NULL, NULL);
INSERT INTO PlayerGame VALUES (1, 2, 0.00, NULL, NULL);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, NULL, NULL);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, NULL, NULL);
INSERT INTO PlayerGame VALUES (2, 2, 0.00, NULL, NULL);
INSERT INTO PlayerGame VALUES (2, 3, 500.00, NULL, NULL);
INSERT INTO PlayerGame VALUES (3, 2, 0.00, NULL, NULL);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, NULL, NULL);

-- Add extra records
-- New ongoing game
INSERT INTO Game VALUES (4, '2020-10-10 13:40:00', TRUE);
-- Property on the board
INSERT INTO Property VALUES (1, 'Boardwalk', 'Dark Blue');
INSERT INTO Property VALUES (2, 'Park Place', 'Dark Blue');
INSERT INTO Property VALUES (3, 'Pennsylvania Avenue', 'Green');
INSERT INTO Property VALUES (4, 'North Carolina Avenue', 'Green');
INSERT INTO Property VALUES (5, 'Pacific Avenue', 'Green');
INSERT INTO Property VALUES (6, 'Reading Railroad', 'Station');
INSERT INTO Property VALUES (7, 'Pennsylvania Railroad', 'Station');
INSERT INTO Property VALUES (8, 'B. & O. Railroad', 'Station');
INSERT INTO Property VALUES (9, 'Short Line', 'Station');
-- Players playing the game
INSERT INTO PlayerGame VALUES (4, 1, 250.00, 1200, 7);
INSERT INTO PlayerGame VALUES (4, 2, 50.00, 1500,2);
INSERT INTO PlayerGame VALUES (4, 3, 300.00, 1800,3);
-- Property players currently have
-- playerID 1 owns all greens and put some houses on them
INSERT INTO PlayerProperty VALUES (1, 4, 4, 1, 0);
INSERT INTO PlayerProperty VALUES (1, 5, 4, 2, 0);
INSERT INTO PlayerProperty VALUES (1, 3, 4, 2, 0);
-- playerID 3 owns all dark blues and put a hotel on each
INSERT INTO PlayerProperty VALUES (3, 1, 4, 0, 1);
INSERT INTO PlayerProperty VALUES (3, 2, 4, 0, 1);
-- playerID 2 owns one railroad
INSERT INTO PlayerProperty VALUES (2, 9, 4, 0, 0);

