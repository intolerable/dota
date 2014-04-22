module Dota.WebAPI.Types.MatchHistory where

import Dota.WebAPI.Types.League
import Dota.WebAPI.Types.Match
import Dota.WebAPI.Types.GameModes

import Control.Applicative
import Data.Monoid
import Data.Aeson
import Data.DateTime
import Data.Default
import qualified Data.Text as T

data MatchHistory = MatchHistory { matches :: [BasicMatch]
                                 , resultsRemaining :: Integer }
  deriving (Show)

instance FromJSON MatchHistory where
  parseJSON (Object o) = do
    r <- o .: "result"
    MatchHistory <$> r .: "matches"
                 <*> r .: "results_remaining"
  parseJSON _ = mempty

data MatchHistorySettings = MatchHistorySettings
                              { withPlayer :: Maybe T.Text
                              , withHero :: Maybe Integer
                              , afterDate :: Maybe DateTime
                              , beforeDate :: Maybe DateTime
                              , fromLeague :: Maybe LeagueID
                              , withAccount :: Maybe ()
                              , beforeMatch :: Maybe MatchID
                              , matchesLimit :: Maybe Integer
                              , tournamentOnly :: Maybe Bool
                              , gameMode :: Maybe GameMode }
  deriving (Show)

instance Default MatchHistorySettings where
  def = MatchHistorySettings { withPlayer = Nothing
                             , withHero = Nothing
                             , afterDate = Nothing
                             , beforeDate = Nothing
                             , fromLeague = Nothing
                             , withAccount = Nothing
                             , beforeMatch = Nothing
                             , matchesLimit = Nothing
                             , tournamentOnly = Nothing
                             , gameMode = Nothing }

defaultMatchHistorySettings :: MatchHistorySettings
defaultMatchHistorySettings = def
