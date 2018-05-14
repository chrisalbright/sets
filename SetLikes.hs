module SetLikes where

import qualified Sets
import qualified Multisets
import qualified FiniteSets

class SetLike s where
  empty :: s a
  isEmpty :: s a -> Bool
  contains :: Eq a => s a -> a -> Bool
  insert :: Ord a => s a -> a -> s a
  union :: Ord a => s a -> s a -> s a

instance SetLike Sets.Set where
  empty = undefined
  isEmpty = undefined
  insert = undefined
  contains = undefined
  union = undefined

instance SetLike Multisets.Multiset where
  empty = undefined
  isEmpty = undefined
  insert = undefined
  contains = undefined
  union = undefined

instance SetLike FiniteSets.FiniteSet where
  empty = undefined
  isEmpty = undefined
  insert = undefined
  contains = undefined
  union = undefined

insertAll :: (SetLike s, Ord a) => s a -> [a] -> s a
insertAll s xs = foldr undefined s xs

fromList :: (SetLike s, Ord a) => [a] -> s a
fromList xs = undefined

filterBy :: (SetLike s, Eq a) => [a] -> s a -> [a]
filterBy xs s = undefined

intersect :: (SetLike s, Ord a) => [a] -> s a -> s a
intersect xs s = undefined

subset :: (SetLike s, Eq a) => [a] -> s a -> s a -> Bool
subset xs s1 s2 = all (\x -> s1 `contains` x <= s2 `contains` x) xs

compare :: (SetLike s, Eq a) => [a] -> s a -> s a -> Maybe Ordering
compare xs s1 s2 = undefined
