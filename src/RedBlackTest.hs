import Test.Hspec
import Test.QuickCheck
import Data.List hiding(insert)
import RedBlack (Tree(Empty), Tree(Node), Color(R), Color(B),
                empty, insert, depth, size, root)



main = hspec $
 describe "RedBlack" $ do

  describe "depth" $ do
   it "works for empty tree" $ do
    depth empty `shouldBe` (0)
   it "works for tree with one element " $ do
     depth (Node B empty 1 (Node R empty 2 empty))  `shouldBe` (2)
   it "works for tree with 5 elements " $ do
     depth (Node B (Node B Empty 1 Empty) 2 (Node R (Node B Empty 3 Empty) 4 (Node B Empty 5 Empty)))  `shouldBe`  (3)

  describe "size" $ do
   it "works for empty tree" $ do
    size empty `shouldBe` (0)
   it "works for tree with one element " $ do
     size (Node B empty 1 (Node R empty 2 empty))  `shouldBe` (2)
   it "works for tree with 5 elements " $ do
     size (Node B (Node B Empty 1 Empty) 2 (Node R (Node B Empty 3 Empty) 4 (Node B Empty 5 Empty)))  `shouldBe`  (5)


  describe "insert" $ do
   it "works for empty tree" $ do
    insert 1 empty `shouldBe` (Node B empty 1 empty)
   it "works for tree with one element " $ do
      insert 2 (insert 1 empty) `shouldBe` (Node B empty 1 (Node R empty 2 empty))
   it "height remains balanced for small number of inserts to tree " $ do
      depth ( foldl (\t x -> insert x t) empty [1,3,2])  `shouldBe`  2
   it "root is correct for small number of inserts to tree " $ do
      root ( foldl (\t x -> insert x t) empty [1,3,2])  `shouldBe` (Just 2)
   it "height remains balanced for large number of inserts to tree " $ do
      depth ( foldl (\t x -> insert x t) empty [1,3,4,2,7,6,5,8,9,0,22,23,25,27,78,96])  `shouldBe`  5
   it "height remains balanced for large number of inserts to tree " $ do
      depth ( foldl (\t x -> insert x t) empty [1..511])  `shouldBe`  9
   it "size is correct for large number of inserts to tree " $ do
      size ( foldl (\t x -> insert x t) empty [1..511])  `shouldBe`  511
   it "root node value is correct for large number of inserts to tree " $ do
      root ( foldl (\t x -> insert x t) empty [1..511])  `shouldBe`  (Just 256)


