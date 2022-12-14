import { connect } from 'react-redux'
import { logout } from '../actions/session_actions'
import Greeting from './greeting'

const mapStateToProps = ({ session, entities: { users } }) => {
    debugger
    return {
        currentUser: users[session.id]
    }
}

const mapDispatchToProps = dispatch => {
    debugger
    return {
        logout: () => dispatch(logout())
    }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Greeting)