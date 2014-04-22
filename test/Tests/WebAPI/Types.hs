module Tests.WebAPI.Types (tests) where

import qualified Tests.WebAPI.Types.Player
import qualified Tests.WebAPI.Types.Heroes

import Dota.WebAPI.Types
import Test.HUnit

tests :: Test
tests = TestList [ Tests.WebAPI.Types.Player.tests
                 , Tests.WebAPI.Types.Heroes.tests ]
