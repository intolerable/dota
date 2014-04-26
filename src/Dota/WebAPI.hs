module Dota.WebAPI 
  ( getCDMatchIDs
  , getDrafts
  , getTournamentGames
  , getTournamentDrafts
  , module Export ) where

import Dota.WebAPI.Actions as Export
import Dota.WebAPI.Routes as Export
import Dota.WebAPI.Types as Export

import Control.Arrow
import Control.Monad.IO.Class (liftIO)
import Data.DateTime
import Data.Function (on)
import Data.List (groupBy)
import Data.Maybe (mapMaybe)

getCDMatchIDs :: MatchHistorySettings -> WebAPI [MatchID]
getCDMatchIDs mhs = do
  let cdLeagueID = 203
  let baseMHS = mhs { fromLeague = Just cdLeagueID }
  mh <- getMatchHistory baseMHS
  if resultsRemaining mh /= 0 && not (null $ matches mh)
    then do
      let matchIDs = map basicMatchID $ matches mh
      nextIDs <- getCDMatchIDs baseMHS { beforeMatch = Just (last matchIDs) }
      return $ matchIDs ++ nextIDs 
    else
      return $ map basicMatchID $ matches mh

getDrafts :: [MatchID] -> WebAPI [[(DateTime, Either [Hero] Draft)]]
getDrafts ids = do
  ms <- mapM getMatchDetails ids
  return $ groupBy ((==) `on` fst) $ map (timeStarted &&& draftOrPicks) ms

draftOrPicks :: Match -> Either [Hero] Draft
draftOrPicks m = 
  case draft m of
    Just d -> Right d
    Nothing -> Left $ map hero $ players m

getTournamentGames :: MatchHistorySettings -> WebAPI [BasicMatch]
getTournamentGames mhs = do
  let mhs' = mhs { tournamentOnly = Just True
                 , afterDate = Just $ fromGregorian' 2014 4 19
                 , beforeDate = Just $ fromGregorian' 2014 4 25 }
  mh <- getMatchHistory mhs'
  if resultsRemaining mh /= 0 && not (null $ matches mh)
    then do
      nextMatches <- getTournamentGames mhs { beforeMatch = Just (basicMatchID $ last $ matches mh) }
      return $ matches mh ++ nextMatches
    else return $ matches mh

getTournamentDrafts :: [BasicMatch] -> WebAPI [Draft]
getTournamentDrafts bms = do
  let matchIDs = map basicMatchID bms
  ms <- mapM (\m -> liftIO (print m) >> getMatchDetails m) matchIDs
  return $ mapMaybe draft ms
