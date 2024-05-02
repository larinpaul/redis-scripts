-- Hashes

-- A hash in Redis is a bit like an object
-- in that it is a collection of key-value pairs.
{
    title: 'Name of the Wind'
    rating: '9',
    author: 'Patrick Rothfuss',
}  -- All the values will be strings (not hashes or lists...)
-- We CAN have nested properties ONLY in the special JSON type imported by a module
-- But a normal HASH CAN'T store nested properties, and even properties of different types...

books:1 -- this is a key

HSET books:1 title "Name of the Wind" -- adding a property 'title "Name of the Wind"'

-- Now, let's see HASH books:1
-- Field    Value
-- title    Name of the Wind

HSET books:1 author "Patrick Rothfuss"
-- (integer) 1 -- inserted one field more...

HSET books:1 rating 9
-- (integer) 1 

-- Now, we can also add different fields and values fields
-- in one command if you want to as well.

-- Let's try to override a field:
HSET books:1 rating 10
-- (integer) 0 -- 0 new properties were added, but one was overwritten...
-- title    Name of the Wind
-- author   Patrick Rothfuss
-- rating   10

HSET books:2 title "A wise man's fear" author "patrick rothfuss" rating 8
-- Ctrl+Enter to add all of those three...
-- (integer) 3
-- title    A wise man's fear
-- author   patrick rothfuss
-- rating   8


-- So how do we get fields back from a hash?
HGET books:1 title
-- "Name of the Wind"


HGETALL books:2
-- we will get both the values, and the properties names as well...
-- 1) "title"
-- 2) "A wise man's fear"
-- 3) "author"
-- 4) "patrick rothfuss"
-- 5) "rating"
-- 6) "8"

-- Now, when we're working with a client library,
-- a lot of the time, the library will format the return values
-- So that it will be easier to work with
-- instead of just giving 6 values...
-- For example, give an object to represent the hash

-- HEXISTS key field
HEXISTS books:1 title
-- (integer) 1 -- gives 1 if exists and 0 if doesn't
HEXISTS books:1 abc
-- (integer) 0 -- 

HKEYS books:2 -- Will give all the keys back...
-- 1) "title"
-- 2) "author"
-- 3) "rating"

-- We can also use HDEL to delete a field...
-- HDEL key field [field ...]
HDEL books:1 author
-- We can also delete an entire hash
DEL books:1

-- Give us all the values
HVALS books:2
-- 1) "A wise man's fear"
-- 2) "patrick rothfuss"
-- 3) "8"
