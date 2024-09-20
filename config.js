const {
    PORT = 4444,
    SECRET_JWT_KEY = "esta-es-la-clave-json-web-tocken-mas-secreta-que-hay"
} = process.env

module.exports = { PORT, SECRET_JWT_KEY }

