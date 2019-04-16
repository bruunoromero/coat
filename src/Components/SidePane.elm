module Components.SidePane exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)

import State exposing (State)
import Models.App as App
import Models.User as User

section title child =
  div [] 
  [ h1 [] [text title]
  , child
  ]

appsList : List App.Model -> Html msg
appsList apps = 
  apps
  |> List.map (\app -> li [] [text app.name])
  |> ul []

view state = 
  div [class "menu-pane"] 
  [ state.apps
    |> appsList
    |> section "apps"
  ]