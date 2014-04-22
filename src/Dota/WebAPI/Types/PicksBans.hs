module Dota.WebAPI.Types.PicksBans where

import Dota.WebAPI.Types.Basics

import Data.Aeson
import Control.Applicative
import Data.Monoid
import qualified Data.Vector as V

data PickBan = Pick | Ban
  deriving (Show, Eq)

data Draft = Draft [(PickBan, Team, Hero)]
  deriving (Show, Eq)

instance FromJSON Draft where
  parseJSON (Array a) =
    Draft <$> mapM f (V.toList a)
    where
      f (Object o) = do
        isPick <- o .: "is_pick"
        team <- o .: "team"
        hero <- toEnum <$> o .: "hero_id"
        return (if isPick == Bool True then Pick else Ban, if team == Number 0 then Radiant else Dire, hero)
      f _ = mempty
  parseJSON _ = mempty
