-- perceptron_builder :: [Int] -> [Int] -> Int
-- perceptron_builder = 
    -- What I want - take weights, provide a perceptron that now gives output
    -- so, currying
    -- generalising is a little hard right now so let's just assume 3 weights and 3 inputs

-- perceptron :: [Int, Int, Int] -> Int -> Int -> Int -> Int
-- perceptron w1 w2 w3 x y z = w1*x + w2*y + w3*z

-- not nice! haskell is mathematical! going with mathematical definitions (https://stackoverflow.com/questions/55838580/how-do-you-properly-implement-and-verify-a-perceptron-gradient-descent-to-lear)
dot_prod :: [Int] -> [Int] -> Int
dot_prod xs ys = foldr (+) 0 $ zipWith (*) xs ys
-- looking at the syntax again, 
-- 'apply + to each value of <> starting with 0'
-- $ separates the function and its arguments
--  <> -> 'xi + yi for i = 0...n'

-- Now, a perceptron is active if its weights dot product xs > threshold
perceptron :: Int -> [Int] -> [Int] -> Bool
perceptron threshold ws xs = dot_prod ws xs > threshold

-- ghci> perceptron_t4 = perceptron 4 
-- ghci> test_perceptron = perceptron_t4 [4, 6, 2]
-- ghci> test_perceptron [0, 1, 0]
-- True
-- ghci> test_perceptron [0, 0, 0]
-- False
-- yay!

dot_prod1 :: [Float] -> [Float] -> Float
dot_prod1 xs ys = foldr (+) 0 $ zipWith (*) xs ys

perceptron1 :: Float -> [Float] -> [Float] -> Bool
perceptron1 threshold ws xs = dot_prod1 ws xs > threshold
-- can do a rename now

perceptron_builder :: Float -> [Float] -> [Float] -> Bool
perceptron_builder threshold ws xs = dot_prod1 ws xs > threshold
-- the actual perceptron is perceptron_builder when provided weights and threshold

-- even better, make output 1/0
perceptron_builder2 :: Float -> [Float] -> [Float] -> Int
perceptron_builder2 threshold ws xs | dot_prod1 ws xs > threshold = 1
                                    | True                        = 0

-- the more elegant definition
elegant_perceptron_builder :: Float -> [Float] -> [Float] -> Int
elegant_perceptron_builder bias ws xs   | (dot_prod1 ws xs) + bias >= 0 = 1
                                        | True                          = 0

bool_nand :: Int -> Int -> Int
bool_nand a b = elegant_perceptron_builder 3 [-2,-2] [int(a),int(b)]
    where int = fromIntegral

    -- now show perceptron in terms of step function

step :: Float -> Int
step x  | x >= 0 = 1
        | True = 0

final_perceptron_builder :: Float -> [Float] -> [Float] -> Int
final_perceptron_builder bias ws xs  = step $ (dot_prod1 ws xs) + bias
