module Tests.WebAPI.Types.League (tests) where

import Test.HUnit
import Network.API.Builder
import qualified Data.ByteString.Lazy as BS
import System.Directory (canonicalizePath)

import Dota.WebAPI.Types.League

tests :: Test
tests = "League" ~: testLeagueListing

testLeagueListing :: Test
testLeagueListing = test $ do
  listing <- leagueListing
  BS.null listing @?= False
  case decode listing :: Either (APIError ()) LeagueListing of
    Right _ -> assertBool "" True
    Left _ -> assertFailure "Valid listing should decode correctly"

leagueListing :: IO BS.ByteString
leagueListing = BS.readFile =<< canonicalizePath "test/json/leagueListing.json"
