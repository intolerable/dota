module Tests.WebAPI.Types.MatchHistory (tests) where

import Dota.WebAPI.Types.MatchHistory

import APIBuilder
import qualified Data.ByteString.Lazy as BS
import System.Directory (canonicalizePath)
import Test.HUnit

tests :: Test
tests = "MatchHistory" ~: do
  _ <- matchHistory
  False @? "not implemented yet"

matchHistory :: IO (Either (APIError ()) MatchHistory)
matchHistory = do
  file <- canonicalizePath "test/json/matchHistory.json" >>= BS.readFile
  return $ decode file
