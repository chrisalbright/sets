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
  empty = Sets.empty
  isEmpty = Sets.isEmpty
  insert = Sets.insert
  contains = Sets.contains
  union = Sets.union

instance SetLike Multisets.Multiset where
  empty = Multisets.empty
  isEmpty = Multisets.isEmpty
  insert = Multisets.insert
  contains s x = s `Multisets.count` x > 0
  union = Multisets.merge

instance SetLike FiniteSets.FiniteSet where
  empty = FiniteSets.empty
  isEmpty = FiniteSets.isEmpty
  insert = FiniteSets.insert
  contains = FiniteSets.contains
  union = FiniteSets.union

insertAll :: (SetLike s, Ord a) => s a -> [a] -> s a
insertAll s xs = foldr (\x acc -> acc `insert` x) s xs

fromList :: (SetLike s, Ord a) => [a] -> s a
fromList xs = empty `insertAll` xs

filterBy :: (SetLike s, Eq a) => [a] -> s a -> [a]
filterBy xs s = filter (\x -> s `contains` x) xs

intersect :: (SetLike s, Ord a) => [a] -> s a -> s a
intersect xs s = empty `insertAll` (xs `filterBy` s)

subset :: (SetLike s, Eq a) => [a] -> s a -> s a -> Bool
subset xs s1 s2 = all (\x -> s1 `contains` x <= s2 `contains` x) xs

compare :: (SetLike s, Eq a) => [a] -> s a -> s a -> Maybe Ordering
compare xs s1 s2 = case (subset xs s1 s2, subset xs s2 s1) of
  (True, True) -> Just EQ
  (True, _) -> Just LT
  (_, True) -> Just GT
  _ -> Nothing
