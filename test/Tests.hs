module Tests (tests) where

import qualified Tests.WebAPI.Types as Types

import Dota.WebAPI
import Test.HUnit

tests :: Test
tests = TestList [Types.tests, TestCase $ return ()]
