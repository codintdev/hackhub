const express = require('express')
const router = express.Router()
const pool = require('../database')
const { isAuthenticated, isNotAuthenticated } = require('../lib/authentication')

router.get('/', isAuthenticated, async (req, res) => {
    try {
        const result = await pool.query('SELECT COUNT(*) AS total FROM productos')
        const totalProductos = result[0].total
        const sumResult = await pool.query('SELECT SUM(precio) AS sumaTotal FROM productos')
        const totalPrecio = sumResult[0].sumaTotal
  
        res.render('index', { totalProductos, totalPrecio })
    } catch (err) {
        console.error("[!] Error en la ruta /:", err)
        res.send("Error en /")
    }
})

module.exports = router
