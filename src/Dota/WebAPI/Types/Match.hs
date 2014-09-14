module Dota.WebAPI.Types.Match where

import Dota.WebAPI.Types.Basics
import Dota.WebAPI.Types.League
import Dota.WebAPI.Types.PicksBans
import Dota.WebAPI.Types.Player

import Network.API.Builder.Query
import Control.Applicative
import Data.Monoid
import Data.Aeson
import Data.DateTime

newtype MatchID = MatchID { unMatchID :: Integer }
  deriving (Show, Read, Eq, Ord, Enum)

instance FromJSON MatchID where
  parseJSON j = MatchID <$> parseJSON j

instance ToQuery MatchID where
  toQuery = toQuery . unMatchID

data Match = Match { matchID :: MatchID
                   , players :: [Player]
                   , matchLeague :: LeagueID
                   , positiveVotes :: Integer
                   , negativeVotes :: Integer
                   , matchMode :: GameMode
                   , draft :: Maybe Draft
                   , timeStarted :: DateTime }
  deriving (Show, Read, Eq)

instance FromJSON Match where
  parseJSON (Object o) = do
    r <- o .: "result"
    Match <$> r .: "match_id"
          <*> r .: "players"
          <*> r .: "leagueid"
          <*> r .: "positive_votes"
          <*> r .: "negative_votes"
          <*> r .: "game_mode"
          <*> r .:? "picks_bans"
          <*> (fromSeconds <$> r .: "start_time")
  parseJSON _ = mempty

data BasicMatch = BasicMatch { basicMatchID :: MatchID
                             , basicStartTime :: DateTime
                             , basicPlayers :: [BasicPlayer] }
  deriving (Show, Read, Eq)

instance FromJSON BasicMatch where
  parseJSON (Object o) = do
    BasicMatch <$> o .: "match_id"
               <*> (fromSeconds <$> (o .: "start_time"))
               <*> o .: "players"
  parseJSON _ = mempty
