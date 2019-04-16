module Components.WebView exposing (src, view)

import Html exposing(node)
import Html.Attributes exposing (attribute)

src src_=
  attribute "src" src_

view = node "webview" [] []
