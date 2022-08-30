import React from "react";
import ReactDOM from "react-dom";
console.log("pre-configurestore import")
import configureStore from "./store/store";
import Root from './components/root'
import { signup, login, logout } from './actions/session_actions'

console.log("benchbnb")

document.addEventListener("DOMContentLoaded", () => {
  debugger
  const store = configureStore()
  debugger
  // Testing
  window.signup = signup
  window.login = login
  window.logout = logout
  window.getState = store.getState
  window.dispatch = store.dispatch
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store}/>, root);
});