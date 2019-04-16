module State exposing(State, init)

import Url
import Browser.Navigation as Nav

import Models.App as App
import Models.User as User
import Pages exposing (Page(..))

type alias State =
  { key : Nav.Key
  , url : Url.Url
  , page : Page
  , users : List User.Model
  , apps : List App.Model
  }

init url key =
  { key = key
  , url = url
  , apps = []
  , users = []
  , page = ChatPage
  }