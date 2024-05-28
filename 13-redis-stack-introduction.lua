-- Redis Stack

-- Redis Core

-- JSON Support
{
    "name": "Patrick Rothfuss",
    "age": 50,
    "books": [
        {
            "title": "name of the wind"
            "rating": 9
        }
    ]
}
-- This allows us to model more complex data
-- That would've been designed using different sets and hashes

-- This also allows us to perform atomic updates.
-- For example, "rating": 10
-- Without de-serializing and re-serializing entire objects


-- RediSearch

-- Works really well with Redis JSON objects too

-- Allows us to easily query data
-- Using the Secondary Indexes that we can create
-- For example, give me all the profiles that have a UK address
-- Or give me all the products that are of certain price


-- We can use both of these modules in Redis
-- to make structuring, storing and querying data so much easier


-- On top of that, we also have a client library
-- called Redis OM,
-- which is basically an object mapping library
-- which makes it really easy to model Redis data
-- within your own application code.
-- and it provides us with helper methods to search
-- and query your data in Redis very easily

-- Redis OM is built on top of Redis JSON and Redis Search

const album = {
    artist: "Mushroomhead",
    title: "The Righteous & The Butterfly",
    year: 2014
}

await repository.save(album)

const albums = await repository.search()
    .where('artist').equals('Mushroomhead')
    .and('title').matches('butterfly')
    .and('year').is.greaterThan(2000)
        .return.all()


-- We can easily install Redis Stack on Redis Cloud...


-- Let's play around with Redis JSON

JSON.SET key path value [condition]

-- $ means in the root -- it's for creating a path
JSON.SET authors:1 $ '{
    "name" = "brandon sanderson",
    "age": 55,
    "books": [
        {
            "title": "the final empire",
            "rating": 10
        },
        {
            "title": "the way of kings",
            "rating": 9
        }
    ]}'    This one is not needed thought:-> ' -- <-- You need to put your closing brackets here
-- }' -- This shouldn't be at the same level as the start...

JSON.GET authors:1
{
    "name":"brandon sanderson",
    "age": 55,
    "books": [
        {
            "title":"the final empire",
            "rating": 10
        },
        {
            "title", "the way of kings",
            "rating": 0
        }
    ]
}

-- You can also get the individual titles back

JSON.GET authors:1 $.name
[
    "brandon sanderson"
]

JSON.GET authors:1 $.books -- that would be an array
{               -- an entire array...
    "name": "brandon sanderson",
    "age": 55,
    "books": [
        {
            "title": "the final empire",
            "rating": 10
        },
        {
            "title": "the way of kings",
            "rating": 9
        }
    ]
}

-- We can also grab a single element form an array...
JSON.GET authors:1 $.books[0]
[
    {
        "title": "the final empire",
        "rating": 10
    }
]

-- And we can take that one step further and take the title from a book...
JSON.GET authors:1 $.books[0].title

-- That's very nice, you can get individual properties...

-- You can also get individual properties...

-- So instead of GET over here, SET...
-- JSON.SET authors:1 $.books[0].title
-- for example we can set the rating of the first book to 7
JSON.SET authors:1 $.books[0].rating 7

JSON.GET authors:1
{
    "name":"brandon sanderson",
    "age": 55,
    "books": [
        {
            "title":"the final empire",
            "rating": 7
        },
        {
            "title", "the way of kings",
            "rating": 0
        }
    ]
}
