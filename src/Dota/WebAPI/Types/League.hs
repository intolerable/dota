module Dota.WebAPI.Types.League where

import Control.Applicative
import Data.Aeson
import Data.Monoid
import Data.Text (Text)

type LeagueID = Integer

data LeagueListing = LeagueListing { leagues :: [League] }
  deriving (Show, Read, Eq)

instance FromJSON LeagueListing where
  parseJSON (Object o) =
    LeagueListing <$> (o .: "result" >>= (.: "leagues"))
  parseJSON _ = mempty

data League = League { leagueID :: LeagueID
                     , leagueName :: Text
                     , leagueDescription :: Text
                     , leagueURL :: Text }
  deriving (Show, Read, Eq)

instance FromJSON League where
  parseJSON (Object o) =
    League <$> o .: "leagueid"
           <*> o .: "name"
           <*> o .: "description"
           <*> o .: "tournament_url"
  parseJSON _ = mempty
