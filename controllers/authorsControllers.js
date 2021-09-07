const models = require('..models')

const getAllAuthors = async (request, response) => {
  const authors = await models.Authors.findAll()

  return response.send(authors)
}

const getAllByAuthorID = async (request, response) => {
  try {
    const { id } = request.params

    const author = await models.Authors.findOne({
      where: { id },
      include: [{
        model: models.Novels,
        include: { model: models.Genres }
      }]
    })

    return author ? response.send(author) : response.sendStatus(404)
  } catch (error) {
    return response.status(500).send('no authors found')
  }
}

module.exports = { getAllAuthors, getAllByAuthorID }
