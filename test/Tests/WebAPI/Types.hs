module Tests.WebAPI.Types (tests) where

import qualified Tests.WebAPI.Types.Heroes as Heroes
import qualified Tests.WebAPI.Types.Heroes as Items
import qualified Tests.WebAPI.Types.Player as Player

import Dota.WebAPI.Types
import Test.HUnit

tests :: Test
tests = "Types" ~:
  test [ Player.tests
       , Heroes.tests
       , Items.tests ]
