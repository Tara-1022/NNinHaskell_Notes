-- barebones NN
-- let's try to import the neuron builder
import Neurons (Weights, Bias, Neuron, sigmoid_neuron_builder, perceptron_builder)

-- test
sigmoid_1 = sigmoid_neuron_builder 1
-- works

-- one idea; make a similar 'function constructor' assuming the entire NN to be a function
-- first takes in the size, then the weights & biases of each neuron
-- approach seems bulky
-- use types & data declarations to make it easier to read
type Layer = [Neuron]

-- neural_network_builder :: [Bias] -> [Weights] -> [Layer]
-- neural_network_builder biases weights = map sigmoid_neuron_builder $ zip biases weights

-- is there a less object-oriented way to think of this?
-- A neural network is basically a function that takes n inputs and gives m outputs
-- it consists of layers
-- layers consist of neurons, which themselves are functions
-- so a neural network is a function that recursively applies input to the neurons of each layer until we obtain a single array (output)
-- so..

-- neural_network :: [Layer] -> [Float] -> [Float]
-- neural_network [] xs = xs
-- neural_network layer:layers xs = neural_network layers (apply_layer layer xs)

-- map applies a function to each element in the array
--  I want to apply each function to the array. Maybe I can achieve this with a Layer function rather than type?
-- okay, what does this function exactly do? it returns a list of float, float[i] is obtained by applying layer[i] to xs
-- i'd do this in python with list comprehension..
-- set of all ys where ys = f(xs) for f in [f]
apply_layer :: Layer -> [Float] -> [Float]
apply_layer layer xs = [neuron xs | neuron <- layer]
-- that was stupidly easy once i figured it out..

neural_network_builder :: [Layer] -> [Float] -> [Float]
neural_network_builder [] xs = xs
neural_network_builder (layer:layers) xs = neural_network_builder layers (apply_layer layer xs)
-- so my neural network is a function that applies the output of the previous layer to the next ones
-- though a little less simple, using layers as first param since i want to be able to curry it away

-- output:
-- ghci> sig_1 = sigmoid_1 [2,3]
-- ghci> sig_2 = sigmoid_neuron_builder 2 [4,5]
-- ghci> sig_3 = sigmoid_neuron_builder 4 [5, 0]
-- ghci> l1 = [sig_1, sig_2]
-- ghci> l2 = [sig_3]
-- ghci> nn = neural_network_builder [l1,l2]
-- ghci> nn [1,2] -> [0.9998765]

-- which was a lot of thinking for exactly 3 lines of actual code..
-- and will probably require refactoring when it comes to backpropagation later