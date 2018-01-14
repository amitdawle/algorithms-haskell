import Prelude hiding (even , odd)

data Trampoline a = More (() -> Trampoline a) | Done a

runT :: Trampoline a  -> a
runT (Done a) = a
runT (More k) = runT (k ()) 

even :: [a] -> Trampoline Bool
even []     = Done True
even (x:xs) = More (\_ -> odd xs)

odd :: [a] -> Trampoline Bool
odd []     = Done False
odd (x:xs) = More (\_ -> even xs)