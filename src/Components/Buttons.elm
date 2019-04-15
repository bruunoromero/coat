module Components.Buttons exposing (slot, Slot(..))

import Html exposing (..)
import Html.Attributes exposing(..)

type Slot
  = Start
  | End

slotToString : Slot -> String
slotToString type_ =
  case type_ of
    Start -> "start"
    End -> "end"

slot : Slot -> Attribute a
slot name =
  let 
    strSlot = slotToString name
  in
    attribute "slot" strSlot