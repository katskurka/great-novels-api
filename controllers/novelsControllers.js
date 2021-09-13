const models = require('../models')

const getAllNovels = async (request, response) => {
  const novels = await models.Novels.findAll({
    include: [{ model: models.Authors }, { model: models.Genres }]
  })

  return response.send(novels)
}


const getNovelByIdOrName = async (request, response) => {
  try {
    const { searchTerm } = request.params

    const novel = await models.Novels.findOne({
      where: {
        [models.Op.or]: [
          { id: searchTerm },
          { title: { [models.Op.like]: `%${searchTerm}%` } },
        ],
      },
      include: [{ model: models.Authors }, { model: models.Genres },
      ]
    })

    return novel ? response.send(novel) : response.sendStatus(404)
  } catch (error) {
    return response.status(500).send('No such novels exists')
  }
}

module.exports = { getAllNovels, getNovelByIdOrName }
