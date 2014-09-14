module Dota.WebAPI.Types.PicksBans where

import Dota.WebAPI.Types.Basics

import Data.Aeson
import Control.Applicative
import Data.Monoid
import qualified Data.Vector as V

data PickBan = Pick | Ban
  deriving (Show, Read, Eq)

instance FromJSON PickBan where
  parseJSON (Bool True) = pure Pick
  parseJSON (Bool False) = pure Ban
  parseJSON _ = mempty

data Draft = Draft [(PickBan, Team, Hero)]
  deriving (Show, Read, Eq)

instance FromJSON Draft where
  parseJSON (Array a) =
    Draft <$> mapM f (V.toList a)
    where
      f (Object o) = do
        isPick <- o .: "is_pick"
        team <- o .: "team"
        hero <- toEnum <$> o .: "hero_id"
        return (isPick, if team == Number 0 then Radiant else Dire, hero)
      f _ = mempty
  parseJSON _ = mempty
