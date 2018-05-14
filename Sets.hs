module Sets where

data Set a = Set {
  isEmpty :: Bool,
  contains :: a -> Bool,
  insert :: a -> Set a,
  union :: Set a -> Set a
  }

emptySet :: Set a
emptySet = undefined

totalSet :: Set a
totalSet = undefined

insertedSet :: Set a -> a -> Set a
insertedSet x s = undefined

unionedSet :: Set a -> Set a -> Set a
unionedSet s1 s2 = undefined

main :: IO ()
main = do
  let oneThreeFive = emptySet `insert` 3
                              `union` (emptySet `insert` 1)
                              `insert` 5

  let evens = undefined

  putStrLn ("oneThreeFive contains 4: " ++ show (oneThreeFive `contains` 4))
  putStrLn ("evens contains 4: " ++ show (evens `contains` 4))
