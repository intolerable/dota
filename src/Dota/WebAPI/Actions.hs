module Dota.WebAPI.Actions where

import Dota.WebAPI.Routes
import Dota.WebAPI.Types

import Network.API.Builder

getMatchHistory :: MatchHistorySettings -> WebAPI MatchHistory
getMatchHistory mhs = runRoute $ matchHistoryRoute mhs

getMatchDetails :: MatchID -> WebAPI Match
getMatchDetails mID = runRoute $ matchDetailsRoute mID

getLeagueListing :: WebAPI LeagueListing
getLeagueListing = runRoute leagueListingRoute
