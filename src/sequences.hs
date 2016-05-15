import Data.List
import Data.Function(on)


longestNonContinous :: (Ord a) => (a -> a -> Bool) -> [a] -> [a]
longestNonContinous f xs = maximumBy (compare `on` length) $ allNonContinous f xs

allNonContinous :: (Ord a) => (a -> a -> Bool) -> [a] -> [[a]]
allNonContinous _ [] = [[]]
allNonContinous _ [x] = [[x]]
allNonContinous p (x:xs) = sub ++ map (x:) low
           where sub = allNonContinous p xs
                 low = [] : (filter (\l -> p x (head l)  ) sub )


longestContinous :: (Ord a) => (a -> a -> Bool) -> [a] -> [a]
longestContinous f xs = maximumBy (compare `on` length) $ allContinousSequences f xs

allContinousSequences :: (Ord a) => (a -> a -> Bool) -> [a] -> [[a]]
allContinousSequences _ [] = [[]]
allContinousSequences _ [x] = [[x]]
allContinousSequences p (x:xs) = if (null sub) then [[x]]
                                 else if ( p x (head (head sub))) then (x : ( head sub) ): tail sub
                                 else [x] : sub
                where sub = allContinousSequences p xs
                                   