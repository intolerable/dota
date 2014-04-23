module Tests.WebAPI.Types.Items (tests) where

import Test.HUnit

import Dota.WebAPI.Types.Items

tests :: Test
tests = test [ testToEnum 
             , testFromEnum ]

testToEnum :: Test
testToEnum = test [ "Item from ID 29 is Boots" ~: itemFromID 29 @?= BootsOfSpeed
                  , "Enum from ID 46 is TP" ~: toEnum 46 @?= TownPortalScroll
                  , "Enum for nonsense ID is unknown" ~: toEnum 123123 @?= UnknownItem ]

testFromEnum :: Test
testFromEnum = test [ "ID for item Bottle is 41" ~: itemToID Bottle @?= 41
                    , "ID for enum Reaver is 53" ~: fromEnum Reaver @?= 53 ]
