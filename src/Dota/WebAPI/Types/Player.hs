module Dota.WebAPI.Types.Player where

import Dota.WebAPI.Types.Basics

import Control.Applicative
import Control.Monad (liftM)
import Data.Monoid
import Data.Aeson
import Data.Aeson.Types (Parser)
import Data.Bits
import Data.Word (Word8)

newtype AccountID = AccountID Integer
  deriving (Show, Eq)

data Player = Player { accountID :: Maybe AccountID
                     , playerSlot :: PlayerSlot
                     , hero :: Hero
                     , kda :: (Integer, Integer, Integer)
                     , level :: Integer
                     , cs :: (Integer, Integer)
                     , items :: (Item, Item, Item, Item, Item, Item)
                     , goldSpent :: Integer
                     , heroDamage :: Integer
                     , towerDamage :: Integer
                     , heroHealing :: Integer }
  deriving (Show, Eq)

instance FromJSON Player where
  parseJSON (Object o) = do
    let kda' = (,,) <$> o .: "kills"
                    <*> o .: "deaths"
                    <*> o .: "assists"
    Player <$> liftM (fmap AccountID) (o .:? "account_id")
           <*> o .: "player_slot"
           <*> (toEnum <$> o .: "hero_id")
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
  deriving (Show, Eq)

instance FromJSON BasicPlayer where
  parseJSON (Object o) =
    BasicPlayer <$> liftM (fmap AccountID) (o .:? "account_id")
                <*> o .: "player_slot"
                <*> (toEnum <$> o .: "hero_id")
  parseJSON _ = mempty

data PlayerSlot = PlayerSlot { playerTeam :: Team
                             , teamPosition :: Int}
  deriving (Show, Eq)

instance FromJSON PlayerSlot where
  -- player slot is a byte where
  --   T.......: T is whether the team is Radiant
  --   .....SSS: S is the slot (0-4) of the player
  parseJSON (Number n) = do
    let bits = floor n :: Word8
    let team = if bits `testBit` 7 then Dire else Radiant
    let position = bits .&. 7
    pure (PlayerSlot team (fromIntegral position))
  parseJSON _ = mempty
