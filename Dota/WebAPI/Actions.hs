module Dota.WebAPI.Actions where

import Dota.WebAPI.Routes
import Dota.WebAPI.Parser ()
import Dota.WebAPI.Types

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
