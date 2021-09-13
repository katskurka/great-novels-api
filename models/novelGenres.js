const NovelGenres = (connection, Sequelize, Genres, Novels) => {
  return connection.define('novelGenres', {
    novelId: { type: Sequelize.INTEGER, primaryKey: true, allowNull: false, references: { model: Novels, key: 'id' } },
    genreId: { type: Sequelize.INTEGER, primaryKey: true, allowNull: false, references: { model: Genres, key: 'id' } }
  }, { paranoid: true })
}

module.exports = NovelGenres
