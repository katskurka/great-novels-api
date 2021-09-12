const Sequelize = require('sequelize')
const AuthorsModel = require('./authors')
const GenresModel = require('./genres')
const NovelGenresModel = require('./novelGenres')
const NovelsModel = require('./novels')
const allConfigs = require('../config/sequelize')

const environment = process.env.NODE_ENV || 'development'
const { username, password, host, dialect, database } = allConfigs[environment]

const connection = new Sequelize(database, username, password, {
  host, dialect, define: { timestamps: true }
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
