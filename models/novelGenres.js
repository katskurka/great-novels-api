const NovelGenres = (connection, Sequelize, Genres, Novels) => {
  return connection.define('novelGenres', {
    novelId: { type: Sequelize.INTEGER, primaryKey: true, references: { model: Novels, key: 'id' } },
    genreId: { type: Sequelize.INTEGER, primaryKey: true, references: { model: Genres, key: 'id' } }
  }, { paranoid: true })
}


module.exports = NovelGenres
