const express = require('express')
const router = express.Router()
const bcrypt = require('bcryptjs')
const User = require('../../models/User')
const jwt = require('jsonwebtoken')
const keys = require('../../config/keys')

router.get("/test", (request, response) => response.json({ msg: "This is the users route" }))

router.post("/register", (request, response) => {
    const { errors, isValid } = validateRegisterInput(request.body)

    if ( !isValid ) {
        return response.status(404).json(errors)
    }

    User.findOne({ handle: request.body.handle })
        .then(user => {
            if ( user ) {
                errors.handle = "User already exists"
                return response.status(400).json(errors)
            } else {
                const newUser = new User({
                    handle: request.body.handle,
                    email: request.body.email,
                    password: request.body.password
                })

                bcrypt.genSalt(10, (err, salt) => {
                    bcrypt.hash(newUser.password, salt, (err, hash) => {
                        if ( err ) throw err; 
                        newUser.password = hash;
                        newUser.save()
                            .then(user => { 
                                const payload = { id: user.id, handle: user.handle }
                                jwt.sign(
                                    payload, 
                                    keys.secretOrKey, 
                                    { expiresIn: 3600 }, 
                                    (error, token) => {
                                        response.json({
                                            success: true, 
                                            token: "Bearer " + token
                                        })
                                })
                            })
                            .catch(err => console.log(err))
                    })
                })
            }
        })
})

router.post("/login", (request, response) => {
    const { errors, isValid } = validateLoginInput(request.body)

    if ( !isValid ) {
        return response.status(400).json(errors)
    }

    const handle = request.body.handle
    const password = request.body.password

    User.findOne({ handle })
        .then(user => {
            if ( !user ) {
                errors.handle = "This user does not exist"
                return response.status(400).json(errors)
            }

            bcrypt.compare(password, user.password)
                .then(isMatch => {
                    if ( isMatch ) {
                        
                        const payload = { id: user.id, handle: user.handle }

                        jwt.sign(
                            payload,
                            keys.secretOrKey,
                            { expiresIn: 3600 },
                            (error, token) => {
                                response.json({
                                    success: true,
                                    token: 'Bearer ' + token
                                })
                            }
                        )
                    } else {
                        errors.password = "Incorrect password"
                        return response.status(400).json(errors)
                    }
                })
        })
})

module.exports = router