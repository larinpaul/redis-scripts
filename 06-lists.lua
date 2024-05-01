-- Lists are a collection of string values, but with a few differences.
-- First of all, the items inside the list do not have to be unique.
-- Secondly, the lists do have the ORDER of the elements
-- Thirdly, the way values are stored and queried in a list is different as well.
{'Yoshi','Mario','Peach','Mario'}

-- So, it can be a good idea to think of a list as a bit like a queue,
-- Where each value is lined up before the next one.
-- And we can POP values at the end of the queue, and we can PUSH values at the start of the queue.

-- Now, lists in Redis are what's known as LINKED LISTS.
-- Linked lists don't have to be stored in one location, as arrays woudld
-- This affects the way the values are queried,
-- Because accessing a value in the CENTER of a list would be SLOWER.
-- However, at the HEAD and the TAIL of the list, it will be FAST
-- PUSHING ON or POPPING items OFF is very FAST.

-- Linked LISTS are good for data that progresses over time, for example,
-- like a QUEUE of orders.
-- Where completed orders get POPPED OFF at the end
-- and new orders get PUSHED ONTO the start
-- Or the ten latest stastus updates,
-- Where as a new gets added, the latest one gets removed.

-- So, with that bit of theory out of the way, let's look at some Redis commands...

-- We can create a list by just pushing onto the list
LPUSH key element [element ...]
-- L might stand for LIST, but it can also stand for LEFT,
-- because we will PUSH from THE LEFT, right... :)

-- Now, when we first make a list, it doesn't really matter,
-- because even if we will push from the right, we will get the same results.
-- However, it will mater later on

LPUSH orders ryu
-- And if we click CTRL+ENTER, it will push it to the list
-- 0 ryu

LPUSH orders chun-li
-- It's gonna push it before ryu in the list...
-- The index of ryu will go up, and this will be index 0
-- 0 chun-li
-- 1 ryu

-- Now let's try pushing from the right
RPUSH orders blanka ken
-- 0 chun-li
-- 1 ryu
-- 2 blanka
-- 3 ken

LPUSH orders sagat balrog
-- 0 balrog
-- 1 sagat
-- 2 chun-li
-- 3 ryu
-- 4 blanka
-- 5 ken
--** BY THE WAY, AS YOU CAN SEE ABOVE
-- In Redis, when you use `LPUSH` with multiple arguments,
-- it will add e ach argument to the list in the order they
-- are specified, but from left to right.
-- So in my example, `LPUSH orders sagat` is equivalent to:
-- 1. LPUSH orders sagat
-- 2. LPUSH orders balrog
-- This is why the resulting list has `balrog` before `sagat`

LPOP orders 1 -- Will return an element, but will also POP it! (delete it)
-- Will remove ONE element from orders from the left
-- removed:
-- 1) "balrog"
-- stil have:
-- 0 sagat
-- 1 chun-li
-- 2 ryu
-- 3 blanka
-- 4 ken
-- Now let's remove TWO and from the RIGHT...
RPOP orders 2
-- removed:
-- 1) "ken"
-- 2) "blanka"
-- still have:
-- 0 sagat
-- 1 chun-li
-- 2 ryu

-- We can also get the length of the list...
LLEN orders
-- (integer) 3

-- We can also get a range of different elements from the list
LRANGE orders 0 1
-- 1) "sagat"
-- 2) "chun-li"

-- And now the same command, but going from 0 to 2, this will return all of them...
LRANGE orders 0 2
-- 1) "sagat"
-- 2) "chun-li"
-- 3) "ryu"

-- We can also work with MINUSES to go from the end of the list
LRANGE orders -2 -1 -- It means go from the end (-1) and go to the -2, which is the next one along
-- It will return us the last 2 in the list
-- 1) "chun-li"
-- 2) "ryu"
-- Here is the full list:
-- 0 sagat
-- 1 chun-li
-- 2 ryu

-- Let's use LINDEX got get a specific item
LINDEX orders 1
-- "chun-li"

-- With LPOS we can get a position of something...
-- LPOS key element
LPOS orders ryu
-- It looks orders, sees ryu is in the list, and gives us the index of that.
-- (integer) 2
-- 0 sagat
-- 1 chun-li
-- 2 ryu

-- You can check the full list of the commands here:
-- redis.io/commands/?group=list
