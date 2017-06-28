module Razao.Util
  ( throwIfNothing
  , throwIfLeft
  , floor2dp
  , ceil2dp
  , round2dp
  , round5dp
  , round8dp
  , format2dp
  , format5dp
  , format8dp
  , maybePositive
  , backtrackCursor
  ) where

import Prelude.Extended
import Data.Foldable
import Text.Printf (printf)

import Control.Exception

throwIfNothing :: Exception e => e -> Maybe a -> IO a
throwIfNothing _ (Just a)  = return a
throwIfNothing e (Nothing) = throwIO e

throwIfLeft :: Exception e => (l -> e) -> Either l r -> IO r
throwIfLeft _ (Right r) = return r
throwIfLeft f (Left  l) = throwIO (f l)

floor2dp :: (Fractional a, RealFrac a) => a -> a
floor2dp = floorToXdp 2

ceil2dp :: (Fractional a, RealFrac a) => a -> a
ceil2dp = ceilToXdp 2

round2dp, round5dp, round8dp :: (Fractional a, RealFrac a) => a -> a
round2dp = roundToXdp 2
round5dp = roundToXdp 5
round8dp = roundToXdp 8

format2dp, format5dp, format8dp :: Double -> String
format2dp x = printf "%.2f" x
format5dp x = printf "%.5f" x
format8dp x = printf "%.8f" x


-- | Ensures prices and volumes are *non-negative* numbers
maybePositive :: (Eq a, Num a) =>  a -> Maybe a
maybePositive x = if abs x == x then Just x else Nothing


-- | (on ANSI terminals) Backtracks cursor as many lines as the string has
backtrackCursor :: String -> String
backtrackCursor ss =
    let newLines = foldl' (\count char -> if char == '\n' then (count + 1) else count) (0::Int) ss
     in ss ++ "\ESC[" ++ show newLines ++ "A"
