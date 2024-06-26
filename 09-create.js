'use server'

import { client } from "@/lib/db"
import { redirect } from 'next/navigation'

export async function createBook(formData) {
    const {title, rating, author, blurb} = Object.fromEntries(formData)

    // create book id (using math. which can create a duplicate id, but the chance is quite low)
    const id = Math.floor(Math.random() * 100000)

    // save new hash for the book
    await client.hSet(`books:${id}`, {
        title,
        rating,
        author,
        blurb
    })

    redirect('/')
}
