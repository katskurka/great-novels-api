const authors = (connection, Sequelize) => {
  return connection.define('authors', {
    id: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
    authorName: { type: Sequelize.STRING }
  }, { paranoid: true })
}

module.exports = authors
