module Tests.WebAPI.Types.MatchHistory (tests) where

import Dota.WebAPI.Types.Basics
import Dota.WebAPI.Types.Match
import Dota.WebAPI.Types.MatchHistory
import Dota.WebAPI.Types.Player

import Network.API.Builder
import System.Directory (canonicalizePath)
import Test.HUnit
import qualified Data.ByteString.Lazy as BS

tests :: Test
tests = "MatchHistory" ~: do
  mh <- matchHistory
  case mh of
    Right x -> checkMatchHistory x
    Left _ -> assertFailure "should decode properly"

checkMatchHistory :: MatchHistory -> Assertion
checkMatchHistory h = do
  resultsRemaining h @?= 475
  length (matches h) @?= 25
  let m = head $ matches h
  basicMatchID m @?= MatchID 624035295
  map basicHero (basicPlayers m) @?= [ UnknownHero
                                , Spectre
                                , UnknownHero
                                , UnknownHero
                                , UnknownHero
                                , UnknownHero
                                , Clockwerk
                                , UnknownHero
                                , Rubick
                                , Pudge ]
  return ()

matchHistory :: IO (Either (APIError ()) MatchHistory)
matchHistory = do
  file <- canonicalizePath "test/json/matchHistory.json" >>= BS.readFile
  return $ decode file
