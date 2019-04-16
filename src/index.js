import "normalize.css"
import firebase from "firebase/app"

import "./firebase"
import "./styles/app.styl"

const electron = window.require("electron")

import { Elm } from "./Main.elm"

const app = Elm.Main.init()

const mapCollection = coll => {
  const docs = []

  coll.forEach(doc => {
    docs.push({ id: doc.id, ...doc.data() })
  })

  return docs
}

firebase
  .firestore()
  .collection("apps")
  .onSnapshot(coll => {
    app.ports.receivedApps.send(mapCollection(coll))
  })

app.ports.appSelected.subscribe(app => {
  console.log(app)
})
