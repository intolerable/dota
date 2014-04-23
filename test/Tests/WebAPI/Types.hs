module Tests.WebAPI.Types (tests) where

import qualified Tests.WebAPI.Types.Heroes as Heroes
import qualified Tests.WebAPI.Types.Heroes as Items
import qualified Tests.WebAPI.Types.League as League
import qualified Tests.WebAPI.Types.Player as Player
import qualified Tests.WebAPI.Types.MatchHistory as MatchHistory

import Test.HUnit

tests :: Test
tests = "Types" ~:
  test [ Player.tests
       , Heroes.tests
       , Items.tests
       , League.tests
       , MatchHistory.tests ]
