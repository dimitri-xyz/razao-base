module Data.List.Extended
 ( module Data.List
 , safeHead
 , defaultHead
 , elem'
 , isSubsetOf
 , isEquivTo
 ) where

import Data.List

safeHead :: [a] -> Maybe a
safeHead  []    = Nothing
safeHead  (a:_) = Just a

defaultHead :: a -> [a] -> a
defaultHead  d []    = d
defaultHead  _ (h:_) = h

-- Generalizations (to distinct types a and b) from Data.List
elem' :: Foldable t => (a -> b -> Bool) -> a -> t b -> Bool
elem' f a = any (f a)

-- This is O(N*M), but it will have to do for now
isSubsetOf :: (a -> b -> Bool) -> [a] -> [b] -> Bool
isSubsetOf _   []     _      = True
isSubsetOf iso (a:as) bs = elem' iso a bs && isSubsetOf iso as bs

-- O(N*M) asymptotic complexity
isEquivTo :: ( a -> b -> Bool) -> [a] -> [b] -> Bool
isEquivTo iso as bs = isSubsetOf iso as bs && isSubsetOf (flip iso) bs as
