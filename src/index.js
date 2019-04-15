import "normalize.css"
import firebase from "firebase/app"

import "./firebase"
import "./styles/app.styl"

import { Elm } from "./Main.elm"

const app = Elm.Main.init()

firebase
  .firestore()
  .collection("users")
  .onSnapshot(coll => app.ports.receivedUsers.send(["aaa"]))
