-- Redis sorted set

-- A sorted set is a collection of uniquq strings (members)
-- ordered by an associated score.
-- When more than one string has the same score, the strings
-- are ordered lexicographically.
-- Somse use cases for sorted sets include:
-- * Leaderboards. For examples, to maintain lists of the highest scores in a game
-- * Rate limiters. For example, to build a sliding-window rate limiter
-- to prevent excessive API requests.

-- You can think of sorted sets as a mix between a Set and a Hash.

-- we use ZADD to add to a sorted set
ZADD key score member [score member ...]

ZADD books 7 "the name of the wind" 2 "the wise man's fear" 9 "the final empire"
-- the wise man's fear 2
-- the name of the wind 7
-- the final empire 9

-- Replace with ZADD
ZADD books 1 "the final empire" -- updates the score to 1

-- And what if I want to add the item only if it doesn't exist?
-- Then we need to add the NX flag
ZADD books NX 5 "the final empire"
-- It will still stay 1

ZADD books NX 5 "the final empireSSS"
-- the final empire 1
-- the wise man's fear 2
-- the final empireSSS 5
-- the name of the wind 7

-- But the NX flag only adds new members,
-- it doesn't update the old members

-- We can get a range of mbembers from the sorted set as well...
ZRANGE key start stop

ZRANGE books 0 -1 -- -1 means right to the end


-- And finally we can delete the sorted set by writing DEL
DEL books




