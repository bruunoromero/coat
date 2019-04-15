port module Pages.Chat 
  exposing
    ( view
    , subscriptions
    )

import Url
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)

import Msg exposing (Msg)
import Model exposing (Model)
import Components exposing (..)
import Components.SplitPane exposing (contentId)
import Components.Chatbar as Chatbar


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

header = 
  div [] 
  [ div []
    [ div [] 
      [ text "Chat"]
    ]
  ]

sideMenu users = 
  users
  |> List.map (\user -> h1 [] [text user])
  |> div [contentId "menu-content"] 

view : Model -> Browser.Document Msg
view model =
  { title = "Chat"
  , body =
      [ div [contentId "menu-content"]
        [ sideMenu model.users
        , div [id "menu-content"]
          [ header
          , div [] [ Chatbar.view ]
          ]
        ]
      ]
  }