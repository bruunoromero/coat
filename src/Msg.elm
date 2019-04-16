module Msg exposing(Msg(..))

import Url
import Browser

import Models.App as App
import Models.User as User

type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url
  | ReceivedApps (List App.Model)
  | ReceivedUsers (List User.Model)