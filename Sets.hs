module Sets where

data Set a = Set {
  isEmpty :: Bool,
  contains :: a -> Bool
  }

emptySet :: Set a
emptySet = Set {
  isEmpty = True,
  contains = \a -> False
}

totalSet :: Set a
totalSet = Set {
  isEmpty = False,
  contains = \a -> True
}

insert :: Eq a => Set a -> a -> Set a
insert s x = Set {
  isEmpty = False,
  contains = \a -> (contains s a) || a == x
}

union :: Set a -> Set a -> Set a
union s1 s2 = Set {
  isEmpty = isEmpty s1 && isEmpty s2,
  contains = \a -> contains s1 a || contains s2 a
}

main :: IO ()
main = do
  let oneThreeFive = emptySet `insert` 3
                              `union` (emptySet `insert` 1)
                              `insert` 5

  let evens = Set {
    isEmpty = False,
    contains = \a -> (mod a 2) == 0
  }

  putStrLn ("oneThreeFive contains 4: " ++ show (oneThreeFive `contains` 4))
  putStrLn ("evens contains 4: " ++ show (evens `contains` 4))
