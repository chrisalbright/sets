module Multisets where

import qualified Sets

data Multiset a = Multiset { isEmpty :: Bool, count :: a -> Int }

empty :: Multiset a
empty = undefined

insert :: Eq a => Multiset a -> a -> Multiset a
insert s x = undefined

merge :: Multiset a -> Multiset a -> Multiset a
merge s1 s2 = undefined

toSet :: Multiset a -> Sets.Set a
toSet s = undefined
