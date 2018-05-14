module FiniteSets (
  -- We explicitly list our exports so that we can hide `FS`.
  FiniteSet, isEmpty, contains, empty, insert, union, intersection, toSet
  ) where

-- `sort` does what it sounds like it does.
-- `nub` removes duplicates from a list.
import Data.List (nub, sort)
import qualified Sets

-- We don't export `FS` so that we can maintain the following properties:
--   * the underlying list should always be sorted, and
--   * the underlying list should never contain duplicates.
data FiniteSet a = FS [a]

isEmpty :: FiniteSet a -> Bool
isEmpty (FS []) = undefined
isEmpty _ = undefined

contains :: Eq a => FiniteSet a -> a -> Bool
contains (FS xs) x = undefined

empty :: FiniteSet a
empty = undefined

insert :: Ord a => FiniteSet a -> a -> FiniteSet a
insert s x = undefined

union :: Ord a => FiniteSet a -> FiniteSet a -> FiniteSet a
union (FS xs) (FS ys) = undefined

intersection :: Eq a => FiniteSet a -> FiniteSet a -> FiniteSet a
intersection (FS xs) (FS ys) = undefined

toSet :: Eq a => FiniteSet a -> Sets.Set a
toSet (FS xs) = undefined
