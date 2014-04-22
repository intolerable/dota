module Tests.WebAPI.Types (tests) where

import qualified Tests.WebAPI.Types.Player as Player
import qualified Tests.WebAPI.Types.Heroes as Heroes

import Dota.WebAPI.Types
import Test.HUnit

tests :: Test
tests = "Types" ~:
  test [ Player.tests
       , Heroes.tests ]
