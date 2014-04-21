module Dota.WebAPI.Types.Player where

import Dota.WebAPI.Types.Heroes
import Dota.WebAPI.Types.Basics

import Control.Applicative
import Data.Monoid
import Data.Aeson
import Data.Aeson.Types (Parser)

newtype AccountID = AccountID Integer
  deriving (Show)

data Player = Player { accountID :: Maybe AccountID
                     , hero :: Hero
                     , kda :: (Integer, Integer, Integer)
                     , level :: Integer
                     , cs :: (Integer, Integer)
                     , items :: (Item, Item, Item, Item, Item, Item)
                     , goldSpent :: Integer
                     , heroDamage :: Integer
                     , towerDamage :: Integer
                     , heroHealing :: Integer }
  deriving (Show)

instance FromJSON Player where
  parseJSON (Object o) = do
    let kda' = (,,) <$> o .: "kills"
                    <*> o .: "deaths"
                    <*> o .: "assists"
    Player <$> (o .: "account_id" >>= return . fmap AccountID)
           <*> (heroFromID <$> o .: "hero_id")
           <*> kda'
           <*> o .: "level"
           <*> ((,) <$> o .: "last_hits"
                    <*> o .: "denies" )
           <*> buildItems o
           <*> o .: "gold_spent"
           <*> o .: "hero_damage"
           <*> o .: "tower_damage"
           <*> o .: "hero_healing"
  parseJSON _ = mempty

buildItems :: Object -> Parser (Item, Item, Item, Item, Item, Item)
buildItems o = (,,,,,) <$> (itemFromID <$> o .: "item_0")
                       <*> (itemFromID <$> o .: "item_1")
                       <*> (itemFromID <$> o .: "item_2")
                       <*> (itemFromID <$> o .: "item_3")
                       <*> (itemFromID <$> o .: "item_4")
                       <*> (itemFromID <$> o .: "item_5")

data BasicPlayer = BasicPlayer { basicAccountID :: Maybe AccountID
                               , basicPlayerSlot :: Integer
                               , basicHero :: Hero }
  deriving (Show)

instance FromJSON BasicPlayer where
  parseJSON (Object o) =
    BasicPlayer <$> (o .:? "account_id" >>= return . fmap AccountID)
                <*> o .: "player_slot"
                <*> (heroFromID <$> o .: "hero_id")
  parseJSON _ = mempty
