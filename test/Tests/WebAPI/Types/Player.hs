module Tests.WebAPI.Types.Player (tests) where

import Dota.WebAPI.Types.Basics
import Dota.WebAPI.Types.Player

import APIBuilder
import System.Directory (canonicalizePath)
import Test.HUnit
import qualified Data.ByteString.Lazy as BS (readFile) 

tests :: Test
tests = "Player" ~:
  test [ testPlayer ]

testPlayer :: Test
testPlayer = "testPlayer" ~: do
  p <- player
  case p of
    Right x -> checkExamplePlayer x
    Left _ -> assertFailure "should decode properly"

checkExamplePlayer :: Player -> Assertion
checkExamplePlayer p = do
  cs p @?= (157,2)
  kda p @?= (1,4,5)
  playerSlot p @?= PlayerSlot Radiant 0
  items p @?= ( Dust
              , Armlet
              , BlinkDagger
              , StoutShield
              , Desolator
              , PowerTreads )

player :: IO (Either (APIError ()) Player)
player = do
  file <- canonicalizePath "test/json/player.json" >>= BS.readFile
  return $ decode file
