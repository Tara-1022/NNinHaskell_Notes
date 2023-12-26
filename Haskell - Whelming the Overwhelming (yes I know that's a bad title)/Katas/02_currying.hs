add :: Int -> (Int -> Int)
-- takes an integer, returns a function (Int -> Int)
add x y = x + y
-- add3 = add 3
-- add3 5

--mult :: Int -> (Int -> (Int -> Int))
--OR
mult :: Int -> Int -> Int -> Int
-- understood to be right- associative
mult x y z = x*y*z
-- ((mult x) y) z

increment :: Int -> Int
increment = add 1
--OR
increment = (+1)

l :: [a] -> Int
l [] = 0
l (x:xs) = 1 + l xs

-- https://youtu.be/uBEPFkuPrcU?si=rXQqhUKqhh_ohGWG