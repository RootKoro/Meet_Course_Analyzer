//routage mail
const express = require('express');
const Controller = require('../Controller/mailController');

const router = express.Router();
router.get('/', Controller.sendMail);

module.exports = router;