-- 2024 04 10

-- Command Options are like little flags that can change how the command behaves a little bit...

-- redis.io/commands/set/

-- SET
-- Syntax
-- SET key value [NX | XX] [GET] [EX seconds | PX milliseconds | EXAT unix-time-seconds | PXAT unix-time milliseconds | KEEPTTL]
-- Availalbe since: 1.0.0
-- Time complexity: O(1)
-- ACL categories: @write, @string, @slow
-- Set key to hold the string value. If key already holds a value, it is overwritten,
-- regardless of its type. Any previous time to live associated with the key
-- is discarded on successful SET operation.

-- Options
-- The SET command supports a set of options that modify its behavior:
-- EX seconds -- Set the specified expire time, in seconds.
-- PX milliseconds -- Set the specified expire time, in milliseconds.
-- EXAT timestamp-seconds -- Set the specified Unix time at which the key will expire, in seconds.
-- PXAT timestamp-milliseconds -- Set the specified Unix time at which the key will expire, in milliseconds.
-- NX -- Only set the key if it does not already exist.
-- XX -- Only set the key if it already exists.
-- KEEPTTL -- Retain the time to livew associated with the key.
-- GET -- Return the old string stored at key, or nil if key did not exist. An error is returned and SET aborted if the value stored at key is not a string.

-- Some options cannot be used together.
-- For example, it does not make sense to use NX and XX together
-- For that the documentation writes these commands in square brackets with pipes in between them.
-- [NX | XX]

-- Okay, let's look at some of the options in practice!
SET name yoshi EX 7
-- Will expire after 7 seconds

SET name mario

SET name Yoshi NX
-- NX means, SET this only if it name doesn't exist!

-- XX means, overwrite this only if name exists
SET name Yoshi XX
-- If there is no name, it will return (nil)
(nil)

-- Let's try to SET, and then use the GET at the end
SET name Peach GET
-- What it does, is it sets the name, but also gets me the previous value of the name.
-- In our case, there was no previous value, so we will get (nil)
(nil)

-- Let's try writing the same command, but change Peach to Toad:
SET name Toad GET
-- Okay, as expected, it gives us "Peach"
"Peach"
-- And for the next one, again, we'll get "Toad"!
SET name Luigi GET
"Toad"
