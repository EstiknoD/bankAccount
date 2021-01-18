const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/', (req, res) => {
    res.render('bank/account');
});

router.get('/add', (req, res) => {
    res.render('bank/add');
});

router.post('/add', (req, res) => {
    console.log(req.body);
    if(req.body.checkfrom == null){
        const {targetnumber, targetpin, targetcantitate} = req.body;
        const newTarget = {
            target_num: targetnumber,
            target_pin: targetpin
        }
        const rows = pool.query('SELECT * FROM targets WHERE target_num = ?', [newTarget.target_num]);
        if(length(rows) > 0){
            console.log(rows);
        }
    }
    else{
        const {checkfrom, checkcode, checkpin} = req.body;
        const newcheck = {
            from_person: checkfrom,
            code: checkcode,
            pin: checkpin 
        };
        const rows = pool.query('SELECT * FROM checks WHERE code = ?', [newcheck.code]);
        if(length(rows) > 0){
            console.log(rows);
        }
    }
    res.send('recibido');
});

router.get('/save', (req, res) => {
    res.render('bank/saveaccount');
});

module.exports = router;