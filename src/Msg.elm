module Msg exposing(Msg(..))

import Url
import Browser

type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url
  | ReceivedUsers (List String)