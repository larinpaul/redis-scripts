-- The first data type we're gonna look at is a String
-- Strings (& Numbers)
-- name --> 'Yoshi'
-- color --> 'indigo'
-- age --> '30'
-- This is the simplest datatype one can store in Redis
-- BE AWARE That a Number is going to be returned in the String format!

-- Let's go into Redis Insight

-- When I want to create a new Key-Value pair, I need to use SET
SET name 'mario'
-- Even if you don't put in quotes, it's still going to store it as a String
SET name mario
-- But this will give an error:
SET name2 Chun Li
-- So if we have a space, we need to wrap it in quotes
SET name2 'Chun Li'

-- What if we want to get things? Well, we can use GET!
GET name -- "mario"

-- So, how do we delete data?
-- We can use the DEL command
DEL name2

-- MSET means a set of multiple key-value pairs
MSET name2 Yoshi color green rating 10
MSET name2 'Yoshi' color 'green' rating 10
MSET name2 'Yoshi' color 'green' rating '10'

GET rating -- "10"

-- And what if we want to GET multiple values?
MGET name name2 rating
-- 1) "mario"
-- 2) "Yoshi"
-- 3) "10"

-- We can also get a range of characters,
-- For example the first three characters of name
GETRANGE name 0 3 -- from the first to the fourth...
-- "mari"

-- Also, you can work from the end as well
-- -1 is the last character
-- -2 is the second to the last character and so on...
GETRANGE name -1 -3
-- "rio"

-- We can also set a range of characters
-- SETRANGE key offset value
SETRANGE name 2 abc
GET name
-- "maabc"

-- Now let's look at we can do with numbers "Which are still stored as strings..."
-- The numbers are stored as strings, but the commands really mostly are for the numbers

-- Okay, so we have the rating property, which is equal to 10
-- What if we wanted to increase rating by 1, for example?
INCR rating
-- (integer) 11
DECR rating
-- (integer) 10
DECR rating
-- (integer) 9

-- And what if you wanted to incrase it by 5?
-- Well, you can run this:
INCRBY rating 5
-- (integer) 14
DECRBY rating 10
-- (integer) 4

-- But remember, even though we can work with numbers as shown above,
-- If we get the number, it will still come out as a string
GET rating
-- "4"

-- redis.io/commands
