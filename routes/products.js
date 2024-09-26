const express = require('express')
const router = express.Router()
const pool = require('../database')

const { isAuthenticated, isNotAuthenticated } = require('../lib/authentication')

router.get('/productos', isAuthenticated, async (req, res) => {
    const cargo = req.user.cargo
  
    if (cargo == "admin") {
        const productos = await pool.query('SELECT * FROM productos')
  
        res.render('productos/list', { productos })
    } else {
        res.sendStatus(403)
    }
})
  
// Nuevo Producto
router.get('/productos/new', isAuthenticated, (req, res) => {
    const cargo = req.user.cargo
  
    if (cargo == "admin") {
        res.render('productos/new')
    } else {
        res.send(403)
    }
})
router.post('/productos/new', async (req, res) => {
    const producto = req.body
  
    await pool.query('INSERT INTO productos SET ?', [producto])
    res.redirect('/productos')
})
  
// Eliminar producto
router.delete('/productos/eliminar/:id', isAuthenticated, async (req, res) => {
    const { id } = req.params
    
    await pool.query('DELETE FROM productos WHERE id = ?', [id])
    res.redirect('/productos')
})
  
// Editar producto
router.get('/productos/edit/:id', isAuthenticated, async (req, res) => {
    const cargo = req.user.cargo
  
    if (cargo == "admin") {
        const { id } = req.params
        const producto = await pool.query('SELECT * FROM productos WHERE id = ?', [id])
  
        res.render('productos/edit', { producto: producto[0] })
    } else {
        res.send(403)
    }
})
router.post('/productos/edit/:id', async (req, res) => {
    const { id } = req.params

    await pool.query('UPDATE productos SET ? WHERE id = ?', [req.body, id])
    res.redirect('/productos')
})

module.exports = router
