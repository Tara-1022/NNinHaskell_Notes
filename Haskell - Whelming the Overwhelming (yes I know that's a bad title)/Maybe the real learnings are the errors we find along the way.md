# Template summary
### template error
### template solution
### template notes

## "No instance for (Num (Float -> [Float] -> [Float] -> Int)) arising from a use of -'"
>e = elegant_perceptron_builder - 3 \[2, 3, 4]
### solution: '-' is an operator
> e = elegant_perceptron_builder (-3) \[2,3,4]

# No instance for (Ord a) arising from a use of \`min'
### issue

>get_min :: [a] -> a
>get_min (a:as) = foldr min a as
### solution: Proper syntax for functions dealing with general types

>get_min :: Ord a => [a] -> a
>get_min (a:as) = foldr min a as