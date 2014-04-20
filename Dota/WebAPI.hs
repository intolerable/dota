module Dota.WebAPI 
  ( getCDMatchIDs
  , getDrafts
  , main
  , module Export ) where

import Dota.WebAPI.Routes as Export
import Dota.WebAPI.Types as Export
import Dota.WebAPI.Parser as Export
import Dota.WebAPI.Actions as Export

import Data.DateTime
import Control.Arrow
import Data.Function (on)
import Data.List (groupBy)

main :: IO ()
main = undefined

getCDMatchIDs :: MatchHistorySettings -> WebAPI [Integer]
getCDMatchIDs mhs = do
  let cdLeagueID = 203
  let baseMHS = mhs { fromLeague = Just cdLeagueID }
  mh <- getMatchHistory baseMHS
  if resultsRemaining mh /= 0 && not (null $ matches mh)
    then do
      let matchIDs = map (unMatchID . basicMatchID) $ matches mh
      nextIDs <- getCDMatchIDs baseMHS { beforeMatch = Just (MatchID $ last matchIDs) }
      return $ matchIDs ++ nextIDs 
    else
      return $ map (unMatchID . basicMatchID) $ matches mh

getDrafts :: [Integer] -> WebAPI [[(DateTime, Either [Hero] Draft)]]
getDrafts ids = do
  ms <- mapM (getMatchDetails . MatchID) ids
  return $ groupBy ((==) `on` fst) $ map (timeStarted &&& draftOrPicks) ms

draftOrPicks :: Match -> Either [Hero] Draft
draftOrPicks m = 
  case draft m of
    Just d -> Right d
    Nothing -> Left $ map hero $ players m
