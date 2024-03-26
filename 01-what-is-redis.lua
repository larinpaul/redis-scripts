-- https://www.youtube.com/playlist?list=PL4cUxeGkcC9h3V2eqhi8rRdIDJshP-b4P

-- What is redis?

-- Redis is an in-memory data store
-- It uses key-value structures
-- Traditionally used as a caching layer
-- Data stored in RAM (very fast)

-- Traditional database:
-- API -> some time... -> Database

-- With redis as a caching server (service?)
-- API -> Redis (faster) -> Database

-- Redis is volatile and data can be lost, but it's way faster!
-- Database is safer, but slower
-- But overtime, Redis TOO can be used as a database!
-- As a Redis Database!

-- Redis Database also can use Redis Cloud!

-- Redis Database:
-- Data persistence
-- JSON support
-- Search
-- Redis OM - object mapping

-- All these tools are sometimes refered to as the "Redis stack"
-- And redis without them is usually called "Redis core"


-- Redis Data Types

-- Strings
-- name --> 'mario'
-- age --> '30'

-- Sets (Unorered collection of strings that must be unique)
-- names --> {'mario','luigi','peach'}

-- Hashes (a little bit like objects, in that they are a collection of key-value pairs)
-- book --> {
--             title: 'Final Empire'
--             author: 'Brandon Sanderson'
--          }

-- Lists (a collections of string values that don't need to be unique, but there is a caveat that we'll see later)
-- names --> {'mario','luigi','peach','mario'}

-- Sorted Sets (are like Sets, but the values are sorted according to some associated score)
-- names --> {
--             'mario':1,
--             'luigi':2,
--             'peach':3
--           }

-- And there are some other data types like Streams and Dual-Spatial Indexes (?)


-- Okay, so Redis stores keys in key-value pairs, and 
-- you can call them whatever you want to call them...
-- Yes, the keys, can be called anything, for example, books:

-- books --> {'book1','book2', ... } 
-- So, in the example above, books is pointing to a Set

-- You might also want to store several individual books as hashes
-- with each hash as a title property, and an author property

-- books --> { 'book 1','book 2', ... }
--           { title: '...', author: '...'} -- so, we need a separate key for each of those books
--           { title: '...', author: '...' } 

-- So the common convention is to name them like this:
-- books   -->   { 'book 1','book 2', ... }
-- books:1 -->   { title: '...', author: '...'}
-- books:2 -->   { title: '...', author: '...' } 
-- you use a colon, and an id for that book...

-- You can use a lot of this with NextJS

-- By the way, we can use the started project from iamshaunjp / redis-for-beginners
-- the project can be found here: 
-- https://github.com/iamshaunjp/redis-for-beginners
-- from lesson-8 onwards he is using redis in his application.
