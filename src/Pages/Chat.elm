module Pages.Chat 
  exposing
    ( view
    )

import Url
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)

import Msg exposing (Msg)
import Models.User as User
import State exposing (State)
import Components.SidePane as SidePane
import Components.SplitPane exposing (contentId)
import Components.WebView as WebView exposing (src)

header : Html Msg
header = 
  div [class "header"]
  [ div [class "header-title"] 
    [ text "Chat"]
  ]


view : State -> Browser.Document Msg
view state =
  { title = "Chat"
  , body =
      [ div [class "split-pane"]
        [ SidePane.view state
        , div [class "main-pane"]
          [ WebView.view ]
        ]
      ]
  }