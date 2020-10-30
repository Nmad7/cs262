-- Retrieve a list of all the games, ordered by date with the most recent game coming first.
SELECT *
FROM Game
ORDER BY time DESC
;

-- Retrieve all the games that occurred in the past week.
SELECT *
FROM Game
WHERE time >= CURRENT_DATE - 7
;

-- Retrieve a list of players who have (non-NULL) names.
SELECT *
FROM Player
WHERE name IS NOT NULL
;

-- Retrieve a list of IDs for players who have some game score larger than 2000. (Used distinct as otherwise it lists ids multiple times)
SELECT DISTINCT playerID
FROM PlayerGame
WHERE PlayerGame.score > 2000
;

-- Retrieve a list of players who have GMail accounts.
SELECT *
FROM Player
WHERE emailAddress LIKE '%gmail%';

-- Retrieve all “The King”’s game scores in decreasing order.
SELECT PlayerGame.score
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID
AND Player.name = 'Dogbreath'
ORDER BY score DESC
;

-- Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
SELECT Player.name
FROM Player, PlayerGame, Game
WHERE PlayerGame.gameID = Game.ID
AND Game.time = '2006-06-28 13:20:00'
AND Player.ID = PlayerGame.playerId
ORDER BY score DESC
LIMIT 1
;

-- So what does that P1.ID < P2.ID clause do in the last example query?
-- First P1.ID < P2.ID ensures that the player ID cannot be the same meaning when p1 and p2 are the same player entry it does not match itself.
-- Second, P1.ID <P2.ID ensures that only one copy of the name is returned as only the lower ID name is returned.

-- The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
-- This query could be useful in condensing a table. If one wants to combine multiple entries with the same name this would help.
-- For example, Facebook keeps shadow profiles of people who do not yet have an account. When that person actually makes a facebook account
-- Facebook may want to only keep one copy and merge the two profiles together. Here they might merge by name.