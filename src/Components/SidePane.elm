module Components.SidePane exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)

import State exposing (State)
import Models.User as User

section title child =
  div [] 
  [ h1 [] [text title]
  , child
  ]

userList : List String -> Html msg
userList apps = 
  apps
  |> List.map (\app -> li [] [text app])
  |> ul []

view state = 
  div [class "menu-pane"] 
  [ state.apps
    |> userList
    |> section "apps" 
  ]