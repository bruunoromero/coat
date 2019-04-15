port module Ports.User exposing (fetchUser, receivedUsers)

import Json.Encode as E
import Json.Decode as D

import Models.User as User

port fetchUser : E.Value -> Cmd msg

port receivedUsers : (List User.Model -> msg) -> Sub msg