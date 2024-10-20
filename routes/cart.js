const express = require('express')
const router = express.Router()
const pool = require('../database')

const { isAuthenticated } = require('../lib/authentication')

router.get('/cart', isAuthenticated, async (req, res) => {
    try {
        const username = req.user.username

        const cart = await pool.query('SELECT p.id, p.nombre, p.descripcion, p.precio, p.imagen, users.fullname FROM cart INNER JOIN productos p ON cart.id_producto = p.id INNER JOIN users ON cart.user = users.username WHERE user = ?', [username])

        if (cart.length > 0) {
            res.render('cart', { cartProduct: cart })
        } else {
            res.send("No hay ningun producto en el carrito")
        }
    } catch (err) {
        console.error(err)
        res.send(err)
    }
})

router.post('/cart/new/:id', isAuthenticated, async (req, res) => {
    const { id } = req.params
    const username = req.user.username

    try {
        console.log(`[*] Esto vale el producto undiendo el boton add cart ${id}`)
    } catch (err) {
        console.error(err)
        res.send(err)
    }
})

router.delete('/cart/eliminar/:id', isAuthenticated, async (req, res) => {
    try {
        const { id } = req.params
        console.log(`[*] Esto vale el id ${id}`)
    } catch (err) {
        console.error(err)
        res.send(err)
    }
})

module.exports = router
