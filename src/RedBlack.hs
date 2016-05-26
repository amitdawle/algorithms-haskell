module RedBlack where
import Prelude hiding (max, min)


{--
An implementation of Reb-Black tree from Chris Okasaki's Purely Functional Data Structures
--}

data Color = R | B deriving (Show, Eq)
data Tree a = Empty | Node Color (Tree a) a (Tree a) deriving (Show, Eq)

empty = Empty

member :: (Ord a) => a -> Tree a -> Bool
member _ Empty = False
member v (Node _ l x r)
         |  v > x = member v r
         |  v < x = member v l
         | otherwise = True


balance :: (Tree a) -> (Tree a)
balance (Node B (Node R (Node R l2 v2 r2) v1 r1) v0 r0) = Node R (Node B l2 v2 r2) v1 (Node B r1 v0 r0)
balance (Node B (Node R l1 v1 (Node R l2 v2 r2)) v0 r0) = Node R (Node B l1 v1 r2) v2 (Node B l2 v0 r0)
balance (Node B l0 v0 (Node R (Node R l2 v2 r2) v1 r1)) = Node R (Node B l0 v0 l2) v2 (Node B r2 v1 r1)
balance (Node B l0 v0 (Node R l1 v1 (Node R l2 v2 r2))) = Node R (Node B l0 v0 l1) v1 (Node B r2 v2 r2)
balance (Node c l v r ) =  (Node c l v r )


insert :: (Ord a) => a -> (Tree a) -> (Tree a)
insert v t = (Node B l v1 r)
         where ins x Empty =  Node R empty x empty
               ins x (Node c l v r )
                     |  x > v  = balance (Node c l v (ins x r))
                     |  x < v  = balance (Node c (ins x l) v r)
                     | otherwise = (Node c l v r )
               (Node _ l v1 r)  = ins v t



depth :: (Tree a) -> Int
depth Empty = 0
depth (Node _ l _ r ) = if dl > dr then dl + 1 else dr + 1
                    where dl  = depth l
                          dr  = depth r

-- Max value
max :: (Tree a) -> Maybe a
max Empty = Nothing
max (Node _ _ v Empty ) = Just v
max (Node _ l v r ) = max r


-- Min value
min :: (Tree a) -> Maybe a
min Empty = Nothing
min (Node _ Empty v _ ) = Just v
min (Node _ l v r ) = min l


-- Size
size :: (Tree a) -> Int
size Empty = 0
size (Node _ l _ r ) = 1 + (size l) + (size r)


root :: (Tree a) -> Maybe a
root Empty = Nothing
root (Node _ _ v _) = Just v
