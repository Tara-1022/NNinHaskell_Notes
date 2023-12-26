A simple mathematical approximation of biological neuron structure.

Cell body sends out pulses through an axon (where learning happens); goes through synapses to activate next neurons.

I.e, 
input(s), multiplication, passage & output

Inputs - $x~i~$
are weighed by weights - $w~i~$
which, if sufficiently strong (>$b$), activate the neuron & pass the signal on

> $\Sigma w~i~x~i~ + b$

For a layer of neurons, represent this as matrices
## Activation functions

Determines if the input is enough to turn the neuron 'on'
### Binary step
> $f(x) = 0, x < 0; 1, x >= 0$

### Logistic regression
> $g(z) = 1/(1+e ^ {-i})$

a.k.a Sigmoid
has smooth derivative
### Rectified linear unit (ReLU)
> $f(x) = 0, x < 0; x, x>0$
### Softmax
> $e^{zi}/ \Sigma e^{zj}, 1<j<k$

Outputs 0-1
# Propagation

## Forward propagation

## Backward propagation

## Building up a network

Layer - a set of neurons that take common input and whose output is combined

### Hidden layers
buffer layers

> (4x3x1) => 4 input, 3 buffer, 1 output
> Suppose it was for [handwritten digits](Handwritten%20digits.md); the output layer would have 10 neurons

Allows us to model complex systems
# References
- [Neural Network architectures - Simplilearn](https://www.youtube.com/watch?v=2l4t7bQPBCM) (not really recommended)

for more detail see [[NN - The basics but better]]