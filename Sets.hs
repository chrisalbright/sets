module Sets where

data Set a = Set { isEmpty :: Bool, contains :: a -> Bool }

empty :: Set a
empty = Set True (\x -> False)

total :: Set a
total = Set False (\x -> True)

insert :: Eq a => Set a -> a -> Set a
insert s x0 = Set False (\x -> x == x0 || s `contains` x)

union :: Set a -> Set a -> Set a
union s1 s2 = Set (isEmpty s1 && isEmpty s2)
                  (\x -> s1 `contains` x || s2 `contains` x)

main :: IO ()
main = do
  let oneThreeFive = empty `insert` 3
                           `union` (empty `insert` 1)
                           `insert` 5

  let evens = Set { isEmpty = False, contains = \x -> even x }

  putStrLn ("oneThreeFive contains 4: " ++ show (oneThreeFive `contains` 4))
  putStrLn ("evens contains 4: " ++ show (evens `contains` 4))
