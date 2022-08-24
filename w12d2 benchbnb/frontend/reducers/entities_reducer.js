import { combineReducers } from 'redux'
import UsersReducer from './users_reducer'
debugger
const entitiesReducer = combineReducers({
    users: UsersReducer
})

export default entitiesReducer