import { 
    RECEIVE_SESSION_ERRORS,
    RECEIVE_CURRENT_USER 
} from "../actions/session_actions"

const sessionErrorsReducer = (state = [], action) => {
    Object.freeze(state)
    debugger
    switch (action.type) {
        case RECEIVE_SESSION_ERRORS:
            debugger
            return action.errors
        case RECEIVE_CURRENT_USER:
            debugger
            return []
        default:
            debugger
            return state
    }
}

export default sessionErrorsReducer