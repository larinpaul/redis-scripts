import Link from 'next/link'
import { client } from "@/lib/db"

const getBooks = async () => {
    // books then a colon than the id for that book
    // books:47554

    const result = await client.zRangeWithScores('books', 0, -1)

    // [{value: 'abc', score: '2397'}, {value: 'def', score: '4233'}]

    const books = await Promise.all(resut.map((b) => {
        return client.hGetAll(`books:${b.score}`)
    }))

    return books
}

export default async function Home() {
    const books = await getBooks()

    return (
        <main>
            <nav className="flex justify-between">
                <h1 className='font-bold'>Books on Redis!</h1>
                <Link href="/create" className="btn">Add a new book</Link>
            </nav>

            <p>List of books here.</p>
            {books.map((book) => (
                <div key={book.title} className="card">
                    <h2>{book.title}</h2>
                    <p>By {book.author}</p>
                    <p>{book.blurb}</p>
                    <p>Rating: {book.rating}</p>
                </div>
            ))}
        </main>
    )

}

