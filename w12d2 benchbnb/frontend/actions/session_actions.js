import * as APIUtil from '../util/session_api_util'


// Actions
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER"
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER"
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS"


// Action Creators
export const receiveCurrentUser = currentUser => {
    debugger
    return {
        type: RECEIVE_CURRENT_USER,
        currentUser
    }
}

export const logoutCurrentUser = () =>  {
    debugger
    return {
        type: LOGOUT_CURRENT_USER
    }
}

export const receiveErrors = errors => {
    debugger
    return {
        type: RECEIVE_SESSION_ERRORS,
        errors
    }
}


// Thunk Action Creators
export const login = user => dispatch => {
    debugger
    return APIUtil.login(user).then(user => {
        debugger
        return dispatch(receiveCurrentUser(user))
    }, err => {
        debugger
        dispatch(receiveErrors(err.responseJSON))
    })
}

export const signup = user => dispatch => {
    debugger 
    return APIUtil.signup(user).then(user => {
        debugger
        return dispatch(receiveCurrentUser(user))
    }, err => {
        debugger
        dispatch(receiveErrors(err.responseJSON))
    })
}

export const logout = () => dispatch => {
    debugger
    return APIUtil.logout().then(user => {
        debugger
        dispatch(logoutCurrentUser())
    })
}
