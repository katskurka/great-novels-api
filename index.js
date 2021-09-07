const express = require('express')

const app = express()

app.use(express.json())

app.get('/authors', getAllAuthors) // get all authors from DB

app.get('/authors/:id', getAuthorsById) // gets all authors with their novels and those novels genres by author's id

app.get('/genres', getAllGenres) // gets all genres from DB

app.get('/genres/:id', getGenresByID) // get a genre with all novels in that genre and those novels author by genre's id

app.get('/novels', getAllNovels) // get all novels with their authors and genres

app.get('/novels/:id', getNovelById) // get a novel with its author and genres by the novel's id

app.listen(3010, () => {
  console.log('ET phone home') // eslint-disable-line no-console
})
