module Signup exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Css

type alias User =
  { name : String
  , email : String
  , password : String
  , loggedIn : Bool
  }

initialModel : User
initialModel =
  { name = ""
  , email = ""
  , password = ""
  , loggedIn = False
  }

view : User -> Html msg
view user =
  div []
    [ h1 [ headerStyle ] [ text "Sign up" ]
    , Html.form [ formStyle ]
      [ div []
        [ text "Name"
        , input
          [id "name"
          , type_ "text"
          , inputTextStyle
          ]
          []
        ]
      , div []
        [ text "Email"
        , input
          [id "email"
          , type_ "email"
          , inputTextStyle
          ]
          []
        ]
      , div []
        [ text "Password"
        , input
          [id "password"
          , type_ "password"
          , inputTextStyle
          ]
          []
        ]
      , div []
        [ button
          [ type_ "submit"
          , buttonStyle]
          [ text "Create my account" ]
        ]
      ]
    ]

styles cssPairs =
  Css.asPairs cssPairs
    |> Html.Attributes.style

headerStyle : Attribute msg
headerStyle =
  styles
    [ Css.paddingLeft (Css.cm 3) ]

formStyle : Attribute msg
formStyle =
    styles
        [ Css.borderRadius (Css.px 5)
        , Css.backgroundColor (Css.hex "#f2f2f2")
        , Css.padding (Css.px 20)
        , Css.width (Css.px 300)
        ]

inputTextStyle : Attribute msg
inputTextStyle =
  styles
    [ Css.display Css.block
    , Css.width (Css.px 260)
    , Css.padding2 (Css.px 12) (Css.px 20)
    , Css.margin2 (Css.px 8) (Css.px 0)
    , Css.border (Css.px 0)
    , Css.borderRadius  (Css.px 4)
    ]


buttonStyle : Attribute msg
buttonStyle =
  styles
    [ Css.width (Css.px 300)
    , Css.backgroundColor (Css.hex "#397cd5")
    , Css.color (Css.hex "#fff")
    , Css.padding2 (Css.px 14) (Css.px 20)
    , Css.marginTop (Css.px 10)
    , Css.border (Css.px 0)
    , Css.borderRadius (Css.px 4)
    , Css.fontSize (Css.px 16)
    ]

update : msg -> User -> User
update msg model =
  initialModel

main : Program Never User msg
main =
  beginnerProgram
    { model = initialModel
    , view = view
    , update = update
    }
