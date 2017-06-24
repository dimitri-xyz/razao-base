{-# LANGUAGE NoImplicitPrelude #-}

import Prelude.Extended

import Test.Tasty
import Test.Tasty.HUnit

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup " Extended Base Tests"
  [ testCase "100.46 == 100.456 rounded to 2 decimal points test"
              (assertEqual "2 D.P. rounding failed" 100.46 (round2dp 100.4560))
  ]
