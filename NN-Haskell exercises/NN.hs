import Neurons (Weights, Neuron, sigmoid_neuron_builder, perceptron_builder, relu_neuron_builder, linear_neuron_builder)

import Tools (get_max, normalise, clip, pow_2)

type Layer = [Neuron]

apply_softmax_layer :: [Float] -> [Float]
apply_softmax_layer xs = normalise $ map exp $ [x - (get_max xs) | x <- xs]

apply_layer :: Layer -> [Float] -> [Float]
apply_layer layer xs = [neuron xs | neuron <- layer]

neural_network_builder :: [Layer] -> [Float] -> [Float]
neural_network_builder [] xs = []
neural_network_builder (layer:layers) xs = neural_network_builder layers (apply_layer layer xs)

-- softmax_loss :: [Float] -> Int -> Float
-- softmax_loss outputs tgt_class = clip (- log (outputs !! tgt_class))

mse_loss :: [Float] -> [Float] -> Float
mse_loss outputs tgt = (sum $ map pow_2 $ zipWith (-) outputs tgt) / (fromIntegral (length outputs))

mse_prime :: [Float] -> [Float] -> [Float]
mse_prime outputs tgt = zipWith (\x y -> (2 * (x - y) / (fromIntegral (length outputs)))) outputs tgt