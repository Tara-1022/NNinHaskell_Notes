-- let's reuse the nice builder
or_else :: Bool
or_else = True

dot_prod :: [Float] -> [Float] -> Float
dot_prod xs ys = foldr (+) 0 $ zipWith (*) xs ys

neuron_builder :: (Float -> Float) -> Float -> [Float] -> [Float] -> Float
neuron_builder activation bias ws xs  = activation $ (dot_prod ws xs) + bias

step :: Float -> Float
step x  | x >= 0 = 1
        | or_else = 0

sigmoid :: Float -> Float
sigmoid x = 1 / (1 + (exp $ -x))

perceptron_builder :: Float -> [Float] -> [Float] -> Float
perceptron_builder = neuron_builder step

sigmoid_neuron_builder :: Float -> [Float] -> [Float] -> Float
sigmoid_neuron_builder = neuron_builder sigmoid
