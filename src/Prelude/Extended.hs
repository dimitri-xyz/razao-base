{-# LANGUAGE NoImplicitPrelude #-}

module Prelude.Extended
 ( module Prelude
 , roundToXdp
 , floorToXdp
 , ceilToXdp
 , truncToXdp
 ) where

import Prelude

zoomInOut
  :: (Fractional a, RealFrac a, Integral b, Integral n)
  => (a -> b)
  -> n
  -> (a -> a)
zoomInOut f n x = fromInteger (toInteger (f $ (10^n) * x)) / (10^n)

roundToXdp :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
roundToXdp n = zoomInOut round n

floorToXdp :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
floorToXdp n = zoomInOut floor n

ceilToXdp :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
ceilToXdp n = zoomInOut ceiling n

truncToXdp :: (Fractional a, RealFrac a, Integral n) => n -> a -> a
truncToXdp n = zoomInOut truncate n
