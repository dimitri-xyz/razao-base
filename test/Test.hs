{-# LANGUAGE NoImplicitPrelude #-}

import Prelude.Extended
import Razao.Util

import Test.Tasty
import Test.Tasty.HUnit

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup " Extended Base Tests"
  [ testCase "100.46 == 100.456 rounded to 2 decimal points test"
              (assertEqual "2 D.P. rounding failed" 100.46 (round2dp 100.456))
  , testCase "100.45 == 100.456 floored to 2 decimal points test"
              (assertEqual "2 D.P. flooring failed" 100.45 (floor2dp 100.456))
  , testCase "100.46 == 100.451 ceiling to 2 decimal points test"
              (assertEqual "2 D.P. ceiling failed"  100.46 (ceil2dp  100.451))
  , testCase "100.55 -> 100.40 floor to 5 parts test"
              (assertEqual "floor to 5 parts failed"  100.40 (floorToDenominator 5 100.55))
  , testCase "100.76 -> 100.875 ceil to 8 parts test"
              (assertEqual "ceil to 8 parts failed"  100.875 (ceilToDenominator  8 100.76))
  ]
