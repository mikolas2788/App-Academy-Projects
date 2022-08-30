import { RECEIVE_CURRENT_USER } from "../actions/session_actions"

const UsersReducer = (state = {}, action) => {
    Object.freeze(state)
    // debugger
    console.log("user reducer")
    switch (action.type) {
        case RECEIVE_CURRENT_USER: 
            // debugger
            return Object.assign({}, state, { [action.currentUser.id]: action.currentUser})
        default:
            // debugger
            return state
    }
}

export default UsersReducer