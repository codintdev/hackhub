const passport = require('passport')

module.exports = {
    // Función para verificar si un usuario esta autenticado
    isAuthenticated (req, res, next) {
        passport.authenticate('jwt', { session: false }, (err, user) => {
            if (err) {
                throw new Error("Error en la autenticación")
                // console.log("[!] Error en la autenticación JWT:", err)
                return res.redirect('/login')
            }
  
            if (!user) {
                // console.log("[!] Usuario no encontrado o token inválido")
                return res.redirect('/login')
            }
  
            req.user = user
            return next()
        })(req, res, next)
    },
  
    isNotAuthenticated (req, res, next) {
        if (!req.isAuthenticated()) {
            return next()
        }
        // Si el usuario ya esta autenticado, se le redirige a la ruta /profile, esto permite que el usuario no pueda acceder a páginas como el formulario de inicio de sesión de nuevo
        return res.redirect('/profile')
    }
}
