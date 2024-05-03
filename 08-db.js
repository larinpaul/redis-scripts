import { createClient } from 'redis';

const client = createClient({
    password: process.env.REDIS_PW,
    socket: {
        host: process.env.REDIS_HOST,
        post: process.env.REDIS_PORT
    }
});

client.on('error', (err) => console.log(err))

if (!client.isOpen) {
    client.connet()
}

export { client }
