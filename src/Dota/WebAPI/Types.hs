module Dota.WebAPI.Types
  ( WebAPI
  , WebAPIKey
  , module Types ) where

import Dota.WebAPI.Types.GameModes as Types
import Dota.WebAPI.Types.Heroes as Types
import Dota.WebAPI.Types.Items as Types
import Dota.WebAPI.Types.League as Types
import Dota.WebAPI.Types.Match as Types
import Dota.WebAPI.Types.MatchHistory as Types
import Dota.WebAPI.Types.PicksBans as Types
import Dota.WebAPI.Types.Player as Types

import Network.API.Builder
import Data.Text (Text)

type WebAPI a = API WebAPIKey () a

type WebAPIKey = Text
