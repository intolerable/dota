module Main (main) where

import Tests (tests)

import Control.Monad (void)
import Test.HUnit

main :: IO ()
main = void $ runTestTT tests
