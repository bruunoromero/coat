port module Ports.App exposing (receivedApps, appSelected)

import Json.Encode as E
import Json.Decode as D

import Models.App as App

port appSelected : App.Model -> Cmd msg

port receivedApps : (List App.Model -> msg) -> Sub msg