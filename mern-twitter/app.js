const users = require('./routes/api/users')
const tweets = require('./routes/api/tweets')

const mongoose = require('mongoose')
const express = require("express")
const app = express()
const db = require('./config/keys').mongoURI
mongoose
.connect(db, { useNewUrlParser: true })
.then(() => console.log("Connected to MongoDB Successfully"))
.catch(error => console.log(error))

const bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

app.get("/", (request, response) => {
    console.log(response)
    response.send("Hello World")
})

const port = process.env.PORT || 5000

app.use("/api/users", users)
app.use("/api/tweets", tweets)
app.listen(port, () => console.log(`Server is running on port ${port}`))