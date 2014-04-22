module Dota.WebAPI.Types.Basics
  ( Team(..)
  , module Export ) where

import Dota.WebAPI.Types.GameModes as Export
import Dota.WebAPI.Types.Heroes as Export
import Dota.WebAPI.Types.Items as Export

data Team = Radiant | Dire
  deriving (Show, Eq)
