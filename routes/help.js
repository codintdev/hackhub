const express = require('express')
const router = express.Router()
const { isAuthenticated, isNotAuthenticated } = require('../lib/authentication')

router.get('/help', (req, res) => {
    res.render('help')
})

module.exports = router
  