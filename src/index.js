import "normalize.css";
import firebase from "firebase/app";

import "./firebase";
import "./styles/app.styl";

import { Elm } from "./Main.elm";

const app = Elm.Main.init();

const mapCollection = coll => {
  const docs = [];

  coll.forEach(doc => {
    docs.push({ id: doc.id, ...doc.data() });
  });

  return docs;
};

firebase
  .firestore()
  .collection("users")
  .onSnapshot(coll => {
    app.ports.receivedUsers.send(mapCollection(coll));
  });
