const passport = require('passport') // Autenticación
const Strategy = require('passport-local').Strategy
const bcrypt = require('bcryptjs') // Encriptar y verificar hash de contraseñas     
const jwt = require('jsonwebtoken')
const JwtStrategy = require('passport-jwt').Strategy
const pool = require('../database') // Pool es el que se encarga de ejecutar las consultas SQL
const { SECRET_JWT_KEY } = require('../config')

// Opciones para la autenticación JWT
const options = {
    jwtFromRequest: (req) => {
        let token = null

        if (req && req.cookies) {
            token = req.cookies['jwt']
        }

        return token
    },
    secretOrKey: SECRET_JWT_KEY
}
  
passport.use(new JwtStrategy(options, async (jwt_payload, done) => {
    try {
        const rows = await pool.query('SELECT * FROM users WHERE username = ?', [jwt_payload.user.username])
  
        if (rows.length > 0) {
            const user = rows[0]
            return done(null, user)
        } else {
            return done(null, false)
        }
    } catch (err) {
        console.error("[!] Error en la verificación del JWT:", err)
        return done(err, false)
    }
}))
  
// passport.deserializeUser(async (id, done) => {
//     try {
//         const user = await pool.query('SELECT * FROM users WHERE username = ?', [id])
  
//         if (user.length > 0) {
//             done(null, user[0])
//         } else {
//             done(new Error("Usuario no encontrado"), null)
//         }
//     } catch (error) {
//         done(error)
//     }
// })
