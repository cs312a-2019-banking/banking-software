const express = require('express')
const app = express()
const port = 3000

const dev = require('./dev/index');

app.use('/dev', dev);

app.listen(port, () => console.log(`Example app listening on port ${port}!`))