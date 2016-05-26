# Some Algorithms in Haskell

## sequences.hs
- Find longest monotonically increasing/decreasing continous or non-contious sequence
```haskell
-- longestNonContinous :: (Ord a) => (a -> a -> Bool) -> [a] -> [a]
longestNonContinous (<) [2,3,4,2,3,4,5,6,2,3,4,2,9]
[2,3,4,5,6,9]
```

```haskell
-- longestContinous :: (Ord a) => (a -> a -> Bool) -> [a] -> [a]
longestContinous (<) [2,3,4,2,3,4,5,6,2,3,4,2,9]
[2,3,4,5,6]
```

## Red Black Tree
### An implementation of Reb-Black tree from Chris Okasaki's Purely Functional Data Structures.
```haskell
-- Tree can be created a follows

```




 




