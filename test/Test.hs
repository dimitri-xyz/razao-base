
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
  ]
