const Sequelize = require('sequelize')
const AuthorsModel = require('./authors')
const GenresModel = require('./genres')
const NovelGenresModel = require('./novelGenres')
const NovelsModel = require('./novels')

const connection = new Sequelize('classics', 'classicsUser', 'booksRlife', {
  host: 'localhost', dialect: 'mysql'
})

const Authors = AuthorsModel(connection, Sequelize)
const Novels = NovelsModel(connection, Sequelize, Authors)
const Genres = GenresModel(connection, Sequelize)
const NovelGenres = NovelGenresModel(connection, Sequelize, Genres, Novels)

Authors.hasMany(Novels)
Novels.belongsTo(Authors)

Novels.belongsToMany(Genres, { through: NovelGenres })
Genres.belongsToMany(Novels, { through: NovelGenres })

module.exports = { Authors, Novels, Genres, NovelGenres }
