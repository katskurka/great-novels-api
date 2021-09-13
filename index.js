const express = require('express')
const { getAllAuthors, getAuthorByIdOrName } = require('./controllers/authorsControllers')
const { getAllGenres, getAllByGenreId } = require('./controllers/genresControllers')
const { getAllNovels, getNovelByIdOrName } = require('./controllers/novelsControllers')

const app = express()

app.use(express.json())

app.get('/authors', getAllAuthors)

app.get('/authors/:searchTerm', getAuthorByIdOrName)

app.get('/genres', getAllGenres)

app.get('/genres/:id', getAllByGenreId)

app.get('/novels', getAllNovels)

app.get('/novels/:searchTerm', getNovelByIdOrName)

app.listen(3010, () => {
  console.log('ET phone home') // eslint-disable-line no-console
})
