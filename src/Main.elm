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
import State exposing(State)
import Pages exposing (Page(..))

main : Program () State Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }

init : () -> Url.Url -> Nav.Key -> (State, Cmd Msg )
init flags url key =
  (State.init url key, Cmd.none)

handleLink model urlRequest =
  case urlRequest of
    Browser.Internal url ->
      (model, Nav.pushUrl model.key (Url.toString url) )

    Browser.External href ->
      (model, Nav.load href )

update : Msg -> State -> (State, Cmd Msg )
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

subscriptions : State -> Sub Msg
subscriptions model =
  Sub.batch
  [ Ports.User.receivedUsers ReceivedUsers ]


view : State -> Browser.Document Msg
view model =
  case model.page of
    ChatPage -> Pages.Chat.view model
