// https://youtu.be/UbtNnHFXK9E?list=PL4cUxeGkcC9h3V2eqhi8rRdIDJshP-b4P
// -- You can work with some JavaScript code later on...

// Installation

// // Start a redis via docker:
// docker run -p 6379:6379 -it redis/redis-stack-server:latest
// // To install node-redism simply:
// npm install redis

//  !! The new interface is clean and cool,
// but if you have an existing codebase,
// you'll want to read the migration guide...

import { createClient } from 'redis';

const client = createClient();

client.on('error', err => console.log('Redis Client Error', err))

await client.connect();

await client.set('key', 'value');
const value = await client.get('key');
await client.disconnect();
