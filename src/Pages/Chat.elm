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
import Components.Chatbar as Chatbar
import Components.SplitPane exposing (contentId)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

header = 
  div [class "header"]
  [ div [class "header-title"] 
    [ text "Chat"]
  ]

sideMenu users = 
  users
  |> List.map (\user -> h1 [] [text user])
  |> div [class "menu-pane"] 

view : Model -> Browser.Document Msg
view model =
  { title = "Chat"
  , body =
      [ div [class "split-pane"]
        [ sideMenu model.users
        , div [class "main-pane"]
          [ header
          , div [class "content-pane"] []
          , Chatbar.view
          ]
        ]
      ]
  }