module Tests.WebAPI (tests) where

import qualified Tests.WebAPI.Types.Heroes as Heroes
import qualified Tests.WebAPI.Types.Player as Player

import Test.HUnit

import Dota.WebAPI

tests :: Test
tests = "WebAPI" ~:
  [ Heroes.tests
  , Player.tests ]
