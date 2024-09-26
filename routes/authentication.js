const express = require('express')
const router = express.Router()
const passport = require('passport')
const pool = require('../database')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

const { SECRET_JWT_KEY } = require('../config')

const { isAuthenticated, isNotAuthenticated } = require('../lib/authentication')

// Registrarse
router.get('/signup', isNotAuthenticated, (req, res) => {
    res.render('authentication/signup')
})
router.post('/signup', async (req, res, next) => {
    try {
        const { username, password, fullname, cargo } = req.body

        if (typeof username !== 'string') throw new Error("[!] El username tiene que ser un string")   

        // Validamos si el username ya existe
        const rows = await pool.query('SELECT * FROM users WHERE username = ?', [username])
        if (rows.length > 0) {
            return res.status(400).json({ message: "El usuario ya existe" })
        }
        
        const user = { username, fullname: req.body.fullname, cargo: req.body.cargo }
        const hashedPassword = await bcrypt.hashSync(password, 10)
        const newUser = { username,  password: hashedPassword, fullname, cargo}
    
        await pool.query('INSERT INTO users SET ?', [newUser])

        const token = jwt.sign({ user: newUser }, SECRET_JWT_KEY, { expiresIn: '1h' })

        res.cookie('jwt', token, { httpOnly: true, secure: false, maxAge: 3600000 })
    
        return res.redirect('/profile');
    } catch (err) {
        console.error("Error en el /signup:", err)
        return next(err);
    }
})
  
// Loguearse
router.get('/login', (req, res) => {
    res.render('authentication/signin')
})
router.post('/login', async (req, res, next) => {
    try {
        const { username, password } = req.body;
        const rows = await pool.query('SELECT * FROM users WHERE username = ?', [username])
      
        if (rows.length === 0) {
            return res.redirect('/login') // Usuario no encontrado
        }
  
        const user = rows[0];
  
        const validPassword = await bcrypt.compare(password, user.password)
        if (!validPassword) {
            return res.redirect('/login'); // Contraseña incorrecta
        }
  
        // Genera el token JWT
        const body = { username: user.username, fullname: user.fullname, cargo: user.cargo };
        const token = jwt.sign({ user: body }, SECRET_JWT_KEY, { expiresIn: '1h' });
  
        // Guarda el token en una cookie
        res.cookie('jwt', token, { httpOnly: true, secure: false, maxAge: 3600000 });
  
        return res.redirect('/profile');
    } catch (err) {
        return next(err);
    }
})

// Perfíl
router.get('/profile', isAuthenticated, (req, res) => {
    const cargo = req.user.cargo
    const user = req.user
    res.render('profile', { cargo: cargo, user: user })
})
  
// Desloguearse
router.get('/logout', isAuthenticated, (req, res, next) => {
    res.clearCookie('jwt')
    return res.redirect('/login')
})
  
router.get('/protected', isAuthenticated, (req, res) => {
    const cargo = req.user.cargo
    
    if (cargo == "admin") {
        const username = req.user.username
  
        res.render('protected', { cargo: cargo, username: username })
    } else {
        res.status(403).send("No eres privilegiado")
    }
})

module.exports = router
