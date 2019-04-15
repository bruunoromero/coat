module Components.Button 
  exposing 
    ( end
    , start
    , shape
    , fill
    , iconOnly
    , Fill(..)
    , Shape(..)
    )

import Html.Attributes exposing (attribute)

type Shape
  = Round

type Fill
  = Solid
  | Clear
  | Outline

shapeToString shape_ =
  case shape_ of
    Round -> "round"

fillToString fill_ =
  case fill_ of
    Solid -> "solid"
    Clear -> "clear"
    Outline -> "outline"

iconOnly = 
  attribute "slot" "icon-only"

start = 
  attribute "slot" "start"

end = 
  attribute "slot" "end"

shape shape_ =
  shape_ 
  |> shapeToString
  |> attribute "shape"

fill fill_ =
  fill_
  |> fillToString
  |> attribute "fill"