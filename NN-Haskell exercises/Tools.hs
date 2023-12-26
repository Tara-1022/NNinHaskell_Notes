module Tools (get_max, normalise, clip, pow_2) where

or_else :: Bool
or_else = True

get_max :: Ord a => [a] -> a
get_max (a:as) = foldr max a as

normalise :: [Float] -> [Float]
normalise xs = [x / sum xs | x <- xs]

clip :: Float -> Float
clip a  | a == (log 0)  = 1-1e-7
        | a == (- log 0)= 1e-7
        | or_else       = a

pow_2 :: Float -> Float
pow_2 x = x ^ 2