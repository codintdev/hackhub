/* 
 * codintdev Copyright 2024
**/

const express = require('express')
const path = require('path') // Para controlar las rutas dentro de nuestra app
const morgan = require('morgan') // Middleware
const bodyParser = require('body-parser') // Permite acceder a los datos del cuerpo de la solicitud HTTP en un formato JSON
const cookieParser = require('cookie-parser')
const passport = require('passport')
const jwt = require('jsonwebtoken')
const { Server } = require('socket.io')
const { createServer } = require('node:http')
const session = require('express-session')
const mysqlSession = require('express-mysql-session')
const MySQLStore = mysqlSession(session)

const { PORT, SECRET_JWT_KEY } = require('./config')
const { database } = require('./keys')
const pool = require('./database')
const { isAuthenticated } = require('./lib/authentication')
require('./lib/passport')

// Inicialización
const app = express()

app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, 'views'))
app.use(bodyParser.json())
app.use(express.urlencoded({ extended: false }))
app.use(express.static('public'))
app.use(cookieParser())
const server = createServer(app)
const io = new Server(server, {
  connectionStateRecovery: {}
})

io.on('connection', async (socket) => {
  console.log('[*] Un usuario se ha conectado!')

  socket.on('disconnect', () => {
    console.log('[*] Un usuario se ha desconectado!')
  })

  socket.on('chat message', async (msg) => {
    let result
    let username = socket.handshake.auth.username ?? 'anonymous'
    try {
      result = await pool.query('INSERT INTO messages (content, user) VALUES (?, ?)', [msg, username])
    } catch (err) {
      console.error(err)
      return
    }
    io.emit('chat message', msg, result.insertId.toString(), username)
  })

  if (!socket.recovered) {
    try {
      const results = await pool.query('SELECT id, content, user, created_at FROM messages WHERE id > ?', [socket.handshake.auth.serverOffset ?? 0])

      results.forEach(row => {
        console.log(`[*] Esto vale los rows: ${row.content}, ${row.id.toString()}, ${row.created_at}`)
        socket.emit('chat message', row.content, row.id.toString(), row.user)
      })
    } catch (error) {
        console.error(error)
    }
  }
})

// Middlewares
app.use(morgan('dev'))
app.use(express.json())
app.use(passport.initialize())

// Global, para cuando se loguee y vaya a una ruta de la app, no se pierda la sessión
app.use((req, res, next) => {
  const token = req.cookies.jwt

  if (token) {
    try {
      const decoded = jwt.verify(token, SECRET_JWT_KEY)

      res.locals.user = decoded.user
    } catch (err) {
      console.error("[!] Error al verificar el JWT en el middleware global:", err)
      res.locals.user = null
    }
  } else {
    res.locals.user = null
  }

  next()
})

app.use(require('./routes/'))
app.use(require('./routes/authentication'))
app.use(require('./routes/products'))
app.use(require('./routes/help'))
app.use(require('./routes/api'))

app.get('/chat', isAuthenticated, (req, res) => {
  res.sendFile(process.cwd() + '/client/index.html')
})

app.get('/username', isAuthenticated, (req, res) => {
  res.json({ username: req.user.username })
})

server.listen(PORT, () => {
  console.log("[*] Servidor corriendo correctamente:", PORT)
})
