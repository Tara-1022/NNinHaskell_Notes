module Neurons (Weights, Neuron, neuron_builder, perceptron_builder, sigmoid_neuron_builder, relu_neuron_builder, linear_neuron_builder) where

type Weights = [Float]
type Neuron = [Float] -> Float
-- assume first weight is the bias
or_else :: Bool
or_else = True

dot_prod :: [Float] -> [Float] -> Float
dot_prod xs ys = foldr (+) 0 $ zipWith (*) xs ys

neuron_builder :: (Float -> Float) -> Weights -> Neuron
neuron_builder activation (bias:ws) xs  = activation $ (dot_prod ws xs) + bias

step :: Float -> Float
step x  | x >= 0 = 1
        | or_else = 0

perceptron_builder :: Weights -> Neuron
perceptron_builder = neuron_builder step

sigmoid :: Float -> Float
sigmoid x = 1 / (1 + (exp $ -x))

sigmoid_neuron_builder :: Weights -> Neuron
sigmoid_neuron_builder = neuron_builder sigmoid

relu :: Float -> Float
relu x  | x > 0 = x
        | or_else = 0

relu_neuron_builder :: Weights -> Neuron
relu_neuron_builder = neuron_builder relu

linear_neuron_builder :: Weights -> Neuron
linear_neuron_builder = neuron_builder (\x -> x)