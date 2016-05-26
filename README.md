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
-- A Tree can be created a follows
---- With 511 nodes
import RedBlack (Tree(Empty), Tree(Node), Color(R), Color(B),
                empty, insert, depth, size, root)

(foldl (\t x -> insert x t) empty [1..511])

-- Check depth of the tree
    depth (Node B empty 1 (Node R empty 2 empty))  -- `shouldBe` (2)

-- Size of tree
    size (Node B empty 1 (Node R empty 2 empty))  -- `shouldBe` (2)

-- Inserts into tree
    insert 1 empty                                 -- `shouldBe` (Node B empty 1 empty)

-- Root value 
    root (foldl (\t x -> insert x t) empty [1..511]) -- `shouldBe`  (Just 256)

```




 




