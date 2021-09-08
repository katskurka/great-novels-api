const authors = (connection, Sequelize) => {
  return connection.define('authors', {
    id: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
    authorName: { type: Sequelize.STRING, allowNull: false }
  }, { paranoid: true })
}

module.exports = authors
