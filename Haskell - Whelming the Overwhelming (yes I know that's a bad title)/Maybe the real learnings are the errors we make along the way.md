# Template summary
### template error
### template solution
### template notes

# "No instance for (Num (Float -> [Float] -> [Float] -> Int)) arising from a use of -'"

```
e = elegant_perceptron_builder - 3 \[2, 3, 4]
```
## solution: '-' is an operator
```
 e = elegant_perceptron_builder (-3) \[2,3,4]
```

# No instance for (Ord a) arising from a use of \`min'
## issue

```
get_min :: [a] -> a
get_min (a:as) = foldr min a as
```
## solution: Proper syntax for functions dealing with general types

```
get_min :: Ord a => [a] -> a
get_min (a:as) = foldr min a as
```

# NaN
## function returns NaN when floating point is expected

```
w = [[[4.911397e35,-2.9032095e36]]]
train_model w xs xs 1
> [[[NaN, NaN]]]
```
## causes
seems to be an issue with computations on high precision values. 
Looks like exponent overflow, will scale results 
[The same issue](https://stackoverflow.com/questions/25787167/division-returning-nan#:~:text=You%20could%20use%20a%20different%20type%20for%20your%20numbers%20that%20don%27t%20lose%20precision%2C%20or%20scale%20your%20result%20in%20some%20way.). It seems that exceedingly large numbers are set to Infinity, division by Infinity give NaN
## fixes
- tried truncating, but did not work. Will avoid bad learning rates for now
- That did not work because the issue is the high value, not the exponent itself; implemented a clip function to map to the weights after an a round of learning. 
```
clip :: Float -> Float

clip x  | x <= 1.0e-7 = 1.0e-7

        | x >= 1.0e7 = 1.0e7

        | or_else = x
```
a better approach would be to implement a weight as a monad - after any function is applied, auto-clip the value.

# Network using ReLu always outputs 0
### Network always dies
```
ghci> xs = [[1], [2], [3], [4], [9], [8], [5], [3], [1], [0], [9], [8]]
ghci> ys = map (map (\x -> 5*x)) xs
ghci> ys      
[[5],[10],[15],[20],[45],[40],[25],[15],[5],[0],[45],[40]]
ghci> w2 = train_model w xs ys 5000
ghci> predict_values w2 xs
[[0.0],[0.0],[0.0],[0.0],[0.0],[0.0],[0.0],[0.0],[0.0],[0.0],[0.0],[0.0]]
ghci> w2
[[[-5.59602,-46.830845],[-7.638906,-67.7734],[-3.9031825,-70.87825],[-11.722836,-108.8455],[-8.387722,-66.7388]],[[-3.1026514,-48.932346,-67.63601,-67.8697,-104.29494,-75.10529]]]
```
## cause
Dying reLu: """If our learning rate (α) is set too high, there is a significant chance that our new weights will end up in the highly negative value range since our old weights will be subtracted by a large number. These negative weights result in negative inputs for ReLU, thereby causing the dying ReLU problem to happen."" [source](https://www.google.com/search?q=relu+turns+weights+negative&oq=relu+turns+weights+negative&gs_lcrp=EgZjaHJvbWUyBggAEEUYOdIBCTEyNDk4ajBqN6gCALACAA&sourceid=chrome&ie=UTF-8#:~:text=If%20our%20learning,problem%20to%20happen.)
### fix

reduce learning rate (from `0.01` to `0.001`)