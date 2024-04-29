-- Sets in Redis are an unordered collection of strings,
-- which all have to be unique
-- So you can't store duplicate strings in a set.

-- THIS IS ALLOWED:
names --> {'Yoshi','Mario','Peach'}
-- THIS IS NOT:
colors --> {'Red','Blue','Green','Red'}

-- By the way, values in Redis terminology are actually called members

SADD key member [member ...]

SADD names mario
-- Now the only member is mario

SADD names yoshi peach
-- Now we have three members, mario, yoshi, peach

-- We can also remove elements from the set:
SREM names yoshi
-- Now we only have: peach, mario

-- Let's create another set and then use SUNION to combine two sets together
SADD moreNames link zelda

-- We can use SUNION to combine names and moreNames
SUNION kay [key ...]
SUNION names moreNames
-- Howver, it just RETURNS the two sets
-- It DOES NOT CREATE a new set or anything

-- Let's use SISMEMBER
SISMEMBER key member
-- This allows us to look inside a set and see if the value or a member exists inside the set
SISMEMBER names link
-- Now, link IS NOT IN names, IT IS IN moreNames,
-- so we get (integer) 0 to be returned
-- Now let's try this one:
SISMEMBER names peach
-- (integer) 1
SISMEMBER moreNames link
-- (integer) 1
SISMEMBER names link
-- (integer) 0
