port module Ports.User exposing (fetchUser, receivedUsers)

import Json.Encode as E

port fetchUser : E.Value -> Cmd msg

port receivedUsers : (List String -> msg) -> Sub msg