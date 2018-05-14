module Multisets where

import qualified Sets

data Multiset a = Multiset { isEmpty :: Bool, count :: a -> Int }

empty :: Multiset a
empty = Multiset True (\x -> 0)

insert :: Eq a => Multiset a -> a -> Multiset a
insert s x0 = Multiset False (\x -> s `count` x + if x == x0 then 1 else 0)

merge :: Multiset a -> Multiset a -> Multiset a
merge s1 s2 = Multiset (isEmpty s1 && isEmpty s2)
                       (\x -> s1 `count` x + s2 `count` x)

toSet :: Multiset a -> Sets.Set a
toSet s = Sets.Set (isEmpty s) (\x -> s `count` x > 0)
