module Dota.WebAPI 
  ( getCDMatchIDs
  , getDrafts
  , module Export ) where

import Dota.WebAPI.Actions as Export
import Dota.WebAPI.Routes as Export
import Dota.WebAPI.Types as Export

import Control.Arrow
import Data.DateTime
import Data.Function (on)
import Data.List (groupBy)

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
