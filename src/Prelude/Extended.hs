{-# LANGUAGE NoImplicitPrelude #-}

module Prelude.Extended
 ( module Prelude
 , roundToXdp
 , floorToXdp
 , ceilToXdp
 , truncToXdp
 , roundToDenominator
 , floorToDenominator
 , ceilToDenominator
 , truncToDenominator
 ) where

import Prelude

zoomInOut
  :: (Fractional a, RealFrac a, Integral b)
  => (a -> b)
  -> a
  -> (a -> a)
zoomInOut f n x = fromInteger (toInteger (f $ n * x)) / n

----

roundToDenominator :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
roundToDenominator n = zoomInOut round (realToFrac n)

floorToDenominator :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
floorToDenominator n = zoomInOut floor (realToFrac n)

ceilToDenominator :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
ceilToDenominator n = zoomInOut ceiling (realToFrac n)

truncToDenominator :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
truncToDenominator n = zoomInOut truncate (realToFrac n)

----

roundToXdp :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
roundToXdp n = roundToDenominator (10^n)

floorToXdp :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
floorToXdp n = floorToDenominator (10^n)

ceilToXdp :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
ceilToXdp n = ceilToDenominator (10^n)

truncToXdp :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
truncToXdp n = truncToDenominator (10^n)
