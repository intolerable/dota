module Tests.WebAPI (tests) where

import qualified Tests.WebAPI.Types as Types

import Test.HUnit

tests :: Test
tests = "WebAPI" ~: do Types.tests
