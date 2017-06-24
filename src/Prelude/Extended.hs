{-# LANGUAGE NoImplicitPrelude #-}

module Prelude.Extended
 ( module Prelude
 , round2dp
 ) where

import Prelude

round2dp :: (Fractional a, RealFrac a) => a -> a
round2dp x = fromInteger(round (100 * x )) / 100
