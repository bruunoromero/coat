module Main exposing (main)

import Url
import Browser
import Html exposing (..)
import Msg exposing (Msg(..))
import Browser.Navigation as Nav
import Html.Attributes exposing (..)

import Ports
import Ports.User
import Pages.Chat
import Model exposing(Model)
import Pages exposing (Page(..))
import Components exposing (ionApp, ionPage)

-- MAIN

main : Program () Model Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }

-- MODEL

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg )
init flags url key =
  (Model key url ChatPage [], Ports.start ())

-- UPDATE

handleLink model urlRequest =
  case urlRequest of
    Browser.Internal url ->
      (model, Nav.pushUrl model.key (Url.toString url) )

    Browser.External href ->
      (model, Nav.load href )

update : Msg -> Model -> (Model, Cmd Msg )
update msg model =
  let 
    page = ChatPage
  in
    case msg of
      LinkClicked urlRequest -> 
        handleLink model urlRequest
      UrlChanged url ->
        ({ model | url = url, page = page }
        , Cmd.none
        )
      ReceivedUsers users ->
        ({model | users = users}, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Ports.User.receivedUsers ReceivedUsers

app : Browser.Document Msg -> Browser.Document Msg
app document =
  document

view : Model -> Browser.Document Msg
view model =
  let 
    body = 
      case model.page of
        ChatPage -> Pages.Chat.view model
  in
    app body