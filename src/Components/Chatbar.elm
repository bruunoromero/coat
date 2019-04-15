module Components.Chatbar exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)

import Components.Button exposing (iconOnly, shape, fill, Fill(..), Shape(..))

view =
  div [class "chat-bar"] 
  [ input [] []
  , button [class "send-button"] 
    [ div [ iconOnly, name "send" ] [] ]
  ]