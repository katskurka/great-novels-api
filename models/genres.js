const Genres = (connection, Sequelize) => {
  return connection.define('genres', {
    id: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
    genreName: { type: Sequelize.STRING }
  }, { paranoid: true })
}

module.exports = Genres
