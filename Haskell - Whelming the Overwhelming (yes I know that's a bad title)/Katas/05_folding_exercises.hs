-- https://youtu.be/46dksIrx6jQ?si=zNoguIFIE1pNudBM

-- a function rev to reverse a list 
rev :: [a] -> [a]
rev = foldl (\xs x -> x : xs) []

-- prefix to return all prefixes of a given list
prefixes :: [a] -> [[a]]
prefixes = foldr (\x xs -> [x]:(map (prepend x) xs)) []
            where
                prepend = (:)

-- lagrange - generates interpolation polynomial in the lagrange form
-- lagrange :: [(Float, Float)] -> Float -> Float

-- Datatypes
data PeaNum = Succ PeaNum | Zero

add_Peas :: PeaNum -> PeaNum -> PeaNum
add_Peas Zero n = n
add_Peas (Succ m) n = Succ $ add_Peas m n

sum_Peas :: [PeaNum] -> PeaNum
sum_Peas []  = Zero
sum_Peas (x:xs) = add_Peas x $ sum_Peas xs