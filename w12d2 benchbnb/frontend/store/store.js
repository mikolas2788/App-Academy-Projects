import { 
    legacy_createStore as createStore, 
    applyMiddleware 
} from 'redux'
import logger from 'redux-logger'
import thunk from 'redux-thunk'
import rootReducer from "../reducers/root_reducer"

const configureStore = (preloadedState = {}) => {
    debugger
    return createStore(
        rootReducer, 
        preloadedState, 
        applyMiddleware(thunk, logger)
    )
}

export default configureStore