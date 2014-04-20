module Dota.WebAPI.Actions where

import Control.Monad.Trans.Maybe

import Dota.WebAPI.Routes
import Dota.WebAPI.Parser ()
import Control.Monad.IO.Class
import Dota.WebAPI.Types
import Control.Monad.Trans.Either

import APIBuilder

getMatchHistory :: MatchHistorySettings -> WebAPI MatchHistory
getMatchHistory mhs = do
  let route = matchHistoryRoute mhs 
  runRoute route

getMatchDetails :: MatchID -> WebAPI Match
getMatchDetails mID = do
  let route = matchDetailsRoute mID
  runRoute route

getLeagueListing :: WebAPI LeagueListing
getLeagueListing = do
  runRoute leagueListingRoute
