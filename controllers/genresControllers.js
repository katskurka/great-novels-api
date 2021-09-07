const models = require('..models')

const getAllGenres = async (request, response) => {
  const genres = await models.Genres.findAll()

  return response.send(genres)
}

const getAllByGenreID = async (request, response) => {
  try {
    const { id } = request.params

    const genre = await models.Genres.findOne({
      where: { id },
      include: [{
        model: models.Novels,
        include: { model: models.Authors }
      }]
    })

    return genre ? response.send(genre) : response.sendStatus(404)
  } catch (error) {
    return response.status(500).send('no genres found')
  }
}

module.exports = { getAllGenres, getAllByGenreID }
