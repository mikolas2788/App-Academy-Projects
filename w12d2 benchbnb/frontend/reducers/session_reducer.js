import { 
    RECEIVE_CURRENT_USER,
    LOGOUT_CURRENT_USER
} from '../actions/session_actions'

const _nullUser = Object.freeze({ id: null })

const sessionReducer = (state = _nullUser, action) => {
    Object.freeze(state)
    debugger
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            debugger
            return { id: action.currentUser.id }
        case LOGOUT_CURRENT_USER: 
            debugger
            return _nullUser
        default:
            debugger
            return state
    }
}

export default sessionReducer