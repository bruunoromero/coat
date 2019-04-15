module Model exposing(Model)

import Url
import Pages exposing (Page(..))

import Browser.Navigation as Nav

type alias Model =
  { key : Nav.Key
  , url : Url.Url
  , page : Page
  , users : List String
  }