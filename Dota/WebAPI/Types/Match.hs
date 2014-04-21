module Dota.WebAPI.Types.Match where

import Dota.WebAPI.Types.GameModes
import Dota.WebAPI.Types.League
import Dota.WebAPI.Types.PicksBans
import Dota.WebAPI.Types.Player

import Control.Applicative
import Data.Monoid
import Data.Aeson
import Data.DateTime

newtype MatchID = MatchID { unMatchID :: Integer }
  deriving (Show)

data Team = Radiant | Dire
  deriving (Show)

data Match = Match { matchID :: MatchID
                   , players :: [Player]
                   , matchLeague :: LeagueID
                   , positiveVotes :: Integer
                   , negativeVotes :: Integer
                   , matchMode :: GameMode
                   , draft :: Maybe Draft
                   , timeStarted :: DateTime }
  deriving (Show)

instance FromJSON Match where
  parseJSON (Object o) = do
    r <- o .: "result"
    Match <$> (MatchID <$> r .: "match_id")
          <*> (r .: "players")
          <*> (r .: "leagueid")
          <*> (r .: "positive_votes")
          <*> (r .: "negative_votes")
          <*> (toEnum <$> r .: "game_mode")
          <*> (r .:? "picks_bans")
          <*> (fromSeconds <$> r .: "start_time")
  parseJSON _ = mempty

data BasicMatch = BasicMatch { basicMatchID :: MatchID
                             , basicStartTime :: DateTime
                             , basicPlayers :: [BasicPlayer] }
  deriving (Show)

instance FromJSON BasicMatch where
  parseJSON (Object o) = do
    ps <- fmap parseJSON (o .: "players")
    BasicMatch <$> (MatchID <$> (o .: "match_id"))
               <*> (fromSeconds <$> (o .: "start_time"))
               <*> ps
  parseJSON _ = mempty
