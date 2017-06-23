module Data.List.Extended
 ( module Data.List
 , safeHead
 , defaultHead
 ) where

import Data.List

safeHead :: [a] -> Maybe a
safeHead  []    = Nothing
safeHead  (a:_) = Just a

defaultHead :: a -> [a] -> a
defaultHead  d []    = d
defaultHead  _ (h:_) = h
