Figuring out what'll get things working. Focusing on [Benchmark problems](https://www.mathworks.com/help/deeplearning/ug/choose-a-multilayer-neural-network-training-function.html#:~:text=six%20benchmark%20problems)

# ReLU
- ReLU ([[NN - The basics but better#ReLU]]) is suited for problems with faster learning and non-negative outputs.
- [Leads to death of network]([[Maybe the real learnings are the errors we make along the way#Network using ReLu always outputs 0]]) if the learning rate is too high
# tanh
- fast learning but only outputs between 0 and 1. Good for binary classification.
- Lower learning rates appropriate