module Tests.WebAPI.Types.Heroes (tests) where

import Test.HUnit

import Dota.WebAPI.Types.Heroes 

tests :: Test
tests = "Heroes" ~:
  test [ testToEnum
       , testFromEnum ]

testToEnum :: Test
testToEnum = "testToEnum" ~:
  test [ "Hero for ID 13 is Puck" ~: heroFromID 13 @?= Puck
       , "Enum for ID 11 is Shadow Fiend" ~: toEnum 11 @?= ShadowFiend
       , "Enum for nonsense ID is unknown" ~: heroFromID 20130 @?= UnknownHero ]

testFromEnum :: Test
testFromEnum = "testFromEnum" ~:
  test [ "ID with Hero Puck is 13" ~: heroToID Puck @?= 13
       , "ID from enum Shadow Fiend is 11" ~: fromEnum ShadowFiend @?= 11
       , "ID with unknown hero is -1" ~: heroToID UnknownHero @?= -1 ]
