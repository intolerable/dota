module Dota.WebAPI.Types.Basics
  ( Team(..)
  , module Dota.WebAPI.Types.Items
  , module Dota.WebAPI.Types.Heroes ) where

import Dota.WebAPI.Types.Heroes
import Dota.WebAPI.Types.Items

data Team = Radiant | Dire
  deriving (Show, Eq)
