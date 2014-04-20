module Dota.WebAPI.Types
  ( WebAPI
  , WebAPIKey
  , module Types ) where

import Dota.WebAPI.Types.PicksBans as Types
import Dota.WebAPI.Types.Heroes as Types
import Dota.WebAPI.Types.Items as Types
import Dota.WebAPI.Types.MatchHistory as Types
import Dota.WebAPI.Types.Match as Types
import Dota.WebAPI.Types.Player as Types
import Dota.WebAPI.Types.League as Types

import APIBuilder

import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Reader
import qualified Data.Text as T

type WebAPI a = API WebAPIKey () a

type WebAPIKey = T.Text
