module Slide exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Time exposing (Time, second)
import Task


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { now : Time
  , start : Time
  }


init : (Model, Cmd Msg)
init =
  (Model 0 0 , Task.perform Init Time.now)



-- UPDATE


type Msg
  = Tick Time
  | Init Time


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      (Model newTime model.start, Cmd.none)
    Init startTime ->
      (Model startTime startTime, Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Tick



-- VIEW


view : Model -> Html Msg
view model =
  Html.div []
      [ Html.text
        ( Time.inSeconds (model.now - model.start)
          |> round
          |> toString
        )
      , footer model
      ]

footer : Model -> Html Msg
footer model =
    Html.footer [ class "info" ]
        [ Html.small [] [ Html.text "Slide" ]
        ]
