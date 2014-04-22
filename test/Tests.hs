module Tests (tests) where

import qualified Tests.WebAPI as WebAPI

import Test.HUnit

tests :: Test
tests = "Tests" ~: TestList [ WebAPI.tests ]
