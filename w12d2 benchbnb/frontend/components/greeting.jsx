import React from 'react'
import { Link } from 'react-router-dom'

const Greeting = ({ currentUser, logout }) => {
    debugger
    let landingPage
    if ( currentUser ) {
        debugger
        landingPage = (
            <div>
                <h1>Greetings { currentUser.username } </h1>
                <button className='logout' onClick={logout}>Logout</button>
            </div>
        )   
    } else {
        debugger
        landingPage = (
            <div>
                <Link to='/signup'>Sign Up</Link>
                <br></br>
                <Link to='/login'>Log In</Link>
            </div>
        )
    }
    debugger
    return landingPage
}

export default Greeting