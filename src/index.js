import "./firebase"
import "./styles/app.styl"
import firebase from "firebase/app"

import { Elm } from "./Main.elm"

const app = Elm.Main.init()

app.ports.start.subscribe(() => {
  app.ports.receivedUsers.send(["aaa"])
})
