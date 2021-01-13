const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/', (req, res) => {
    res.render('bank/account');
});

router.get('/main', (req, res) => {
    res.render('bank/mainaccount');
});

router.get('/save', (req, res) => {
    res.render('bank/saveaccount');
});

module.exports = router;