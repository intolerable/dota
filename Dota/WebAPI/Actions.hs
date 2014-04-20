module Dota.WebAPI.Actions where

import Data.Aeson
import Control.Monad.Trans.Maybe

import Dota.WebAPI.Routes
import Dota.WebAPI.Parser ()
import Control.Monad.IO.Class
import Dota.WebAPI.Types

getMatchHistory :: MatchHistorySettings -> WebAPI MatchHistory
getMatchHistory mhs = do
  let route = matchHistoryRoute mhs 
  resp <- runRouteT route
  MaybeT . return $ decode resp

getMatchDetails :: MatchID -> WebAPI Match
getMatchDetails mID = do
  let route = matchDetailsRoute mID
  resp <- runRouteT route
  MaybeT . return $ decode resp

getLeagueListing :: WebAPI LeagueListing
getLeagueListing = do
  resp <- runRouteT leagueListingRoute
  MaybeT . return $ decode resp
