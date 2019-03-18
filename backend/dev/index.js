const express = require('express');
var router = express.Router();

const deposit = require('./deposit/routes');
const withdrawal = require('./withdrawal/routes');

router.use('/deposit', deposit);
router.use('/withdrawal', withdrawal);

module.exports = router;