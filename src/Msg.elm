module Msg exposing(Msg(..))

import Url
import Browser

import Models.User as User

type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url
  | ReceivedUsers (List User.Model)