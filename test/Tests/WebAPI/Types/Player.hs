module Tests.WebAPI.Types.Player (tests) where

import Test.HUnit

import Dota.WebAPI.Types.Player

import APIBuilder
import qualified Data.ByteString.Lazy as BS (readFile) 
import System.Directory (canonicalizePath)

tests :: Test
tests = "Player" ~:
  test [ testPlayer ]

testPlayer :: Test
testPlayer = "testPlayer" ~: do
  _ <- player
  False @? "not implemented yet"

player :: IO (Either (APIError ()) Player)
player = do
  file <- canonicalizePath "test/json/player.json" >>= BS.readFile
  return $ decode file
