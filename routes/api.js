const express = require('express')
const router = express.Router()
const pool = require('../database')

// Obtener los usuarios
router.get('/api/users', async (req, res) => {
    const users = await pool.query('SELECT * FROM users')
    res.json(users)
})
// Obtener un usuario
router.get('/api/users/:username', async (req, res) => {
    const { username } = req.params
    const user = await pool.query('SELECT * FROM users WHERE username = ?', [username])
    res.json(user)
})

// Crear un usuario
router.post('/api/users', async (req, res) => {
    try {
        await pool.query('INSERT INTO users SET ?', [req.body])
        res.json({ status: 'created' })
    } catch (err) {
        console.error(err)
        res.json({ status: 'error' })
    }
})

// Actualizar un usuario
router.put('/api/users/:username', async (req, res) => {
    try {
        const { username } = req.params
        await pool.query('UPDATE users SET ? WHERE username = ?', [req.body, username])
        res.json({ status: 'updated' })
    } catch (err) {
        console.error(err)
        res.json({ status: 'error' })
    }
})

// Eliminar un usuario
router.delete('/api/users/:username', async (req, res) => {
    try {
        const { username } = req.params
        await pool.query('DELETE FROM users WHERE username = ?', [username])
        res.json({ status: 'deleted' })
    } catch (err) {
        console.error(err)
        res.json({ status: 'error' })
    }
})

// Obtener todos los productos
router.get('/api/productos', async (req, res) => {
    const productos = await pool.query('SELECT * FROM productos')
    res.json(productos)
})
// Obtener un producto
router.get('/api/productos/:id', async (req, res) => {
    const { id } = req.params
    const producto = await pool.query('SELECT * FROM productos WHERE id = ?', [id])
    res.json(producto)
})

router.post('/api/productos', async (req, res) => {
    try {
        await pool.query('INSERT INTO productos SET ?', [req.body])
        res.json({ status: 'created' })
    } catch (err) {
        console.error(err)
        res.json({ status: 'error' })
    }
})

router.put('/api/productos/:id', async (req, res) => {
    try {
        const { id } = req.params
        await pool.query('UPDATE productos SET ? WHERE id = ?', [req.body, id])
        res.json({ status: 'updated' })
    } catch (err) {
        console.error(err)
        res.json({ status: 'error' })
    }
})

router.delete('/api/productos/:id', async (req, res) => {
    try {
        const { id } = req.params
        await pool.query('DELETE FROM productos WHERE id = ?', [id])
        res.json({ status: 'deleted' })
    } catch (err) {
        console.log(err)
        res.json({ status: 'error' })
    }
})

module.exports = router


