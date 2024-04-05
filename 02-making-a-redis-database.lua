-- Before we can start playing around with Redis, we need to set up a Redis instance.
-- The first way is to install Redis on your pc
-- For example, we can do it via installing WSL and Ubuntu for Windows
-- You can also use Docket to Run Redis Stack
-- The third option is to use Redis Cloud (it has a free tier)
-- It also comes with a nice tool called Redis Insight
-- Which we can use to play around with Redis to test different commands
-- and visualize our stored data

-- First we create a New Database

-- Type:
-- Redis Stack (can be Redis or Memcached)
-- Activate database
-- Connect
-- Redisinsight
-- Copy the URI
-- Set up the connection from Insight to the Database
-- Test our connection first if needed.
-- There is the Redis browser

-- Naming convention:
-- Name -- Box -- Column

-- The Workbench area.
-- This is where we're gonna be sending all the commands from Redis as we learn about them.
-- We can see the confirmation of all the commands along with the return value.
-- The way this works is that I can write a new command,  
-- and then click the green Run icon (Ctrl + Enter),
-- and it sends the command to the Redis server
-- And down here we're gonna get the response pretty quickly.

-- So these are the two areas we'll be using the most.
-- The Database Browser to see all of the data.
-- And then the Workbench to send the commands to Redis.

-- The other parts of the Tool are for:
-- Analysis of the database,
-- Pub/Sub
-- Cloud functions and triggers (currently in Beta)
