const mysql = require('mysql')
const { promisify } = require('util')
const { database } = require('./keys')
const pool = mysql.createPool(database)

pool.getConnection((err, connection) => {
    if (err) throw err
    if (connection) connection.release()
    console.log('[*] Mysql Connected!')
})

pool.query = promisify(pool.query)

module.exports = pool
