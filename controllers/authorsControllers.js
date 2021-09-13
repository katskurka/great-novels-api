const models = require('../models')

const getAllAuthors = async (request, response) => {
  const authors = await models.Authors.findAll()

  return response.send(authors)
}

const getAuthorByIdOrName = async (request, response) => {
  try {
    const { searchTerm } = request.params

    const author = await models.Authors.findOne({
      where: {
        [models.Op.or]: [
          { id: searchTerm },
          { lastName: { [models.Op.like]: `%${searchTerm}%` } },
        ],
      },
      include: [
        { model: models.Novels, include: [{ model: models.Genres }], },
      ],
    })

    return author ? response.send(author) : response.sendStatus(404)
  } catch (error) {
    return response.status(500).send('No such author exists')
  }
}

module.exports = { getAllAuthors, getAuthorByIdOrName }
