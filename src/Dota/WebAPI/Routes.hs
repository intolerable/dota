module Dota.WebAPI.Routes where

import Dota.WebAPI.Types

import Network.API.Builder
import Control.Applicative ((<$>))
import qualified Data.DateTime as DateTime (toSeconds)

builder :: Builder
builder = basicBuilder "Dota WebAPI"
                       "https://api.steampowered.com/IDOTA2Match_570"

webAPI :: WebAPIKey -> WebAPI a -> IO (Either (APIError ()) a)
webAPI key act =
  execAPI builder key $ do
    customizeRoute (addAPIKey key)
    act

addAPIKey :: WebAPIKey -> Route -> Route
addAPIKey key r@(Route _ params _) = r { urlParams = ("key" =. key):params }

matchHistoryRoute :: MatchHistorySettings -> Route
matchHistoryRoute mhs = Route [ "GetMatchHistory", "V001" ]
                              [ "player_name" =. withPlayer mhs
                              , "hero_id" =. (fromEnum <$> withHero mhs)
                              , "league_id" =. fromLeague mhs
                              , "matches_requested" =. matchesLimit mhs
                              , "tournament_games_only" =. (fromEnum <$> tournamentOnly mhs)
                              , "game_mode" =. (fromEnum <$> gameMode mhs)
                              , "date_min" =. (DateTime.toSeconds <$> afterDate mhs)
                              , "date_max" =. (DateTime.toSeconds <$> beforeDate mhs)
                              , "start_at_match_id" =. (pred <$> beforeMatch mhs) ]
                              "GET"

matchDetailsRoute :: MatchID -> Route
matchDetailsRoute m = Route [ "GetMatchDetails", "V001" ]
                            [ "match_id" =. m ]
                            "GET"

leagueListingRoute :: Route
leagueListingRoute = Route [ "GetLeagueListing", "v1" ]
                           [ ]
                           "GET"
