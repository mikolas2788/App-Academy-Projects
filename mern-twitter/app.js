const mongoose = require('mongoose')
const express = require("express")
const app = express()
const db = require('./config/keys').mongoURI
mongoose
    .connect(db, { useNewUrlParser: true })
    .then(() => console.log("Connected to MongoDB Successfully"))
    .catch(error => console.log(error))

app.get("/", (request, response) => response.send("Hello World"))

const port = process.env.PORT || 5000

app.listen(port, () => console.log(`Server is running on port ${port}`))