double x = x + x

quadruple x = double (double x)

factorial :: Int -> Int
factorial n = product [1..n]

average ns = div (sum ns) (length ns)

mean ns =  (sum ns) `div` (length ns)

last xs = head (reverse xs)

last1 xs = xs !! (length xs - 1)

-- focus on clear, concise and correct! compiler can worry about efficiency

init xs = reverse( drop 1 (reverse xs))

init xs = take (length xs - 1) xs

-- https://youtu.be/YtZIKujkSmU?si=9CXQZM9tfffYkKUp