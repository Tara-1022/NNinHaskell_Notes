# The dataset
[MNIST data set](http://yann.lecun.com/exdb/mnist/)

Part 1 - training data; 60,000 images
Part 2 - test data; 10,000 images (different people)

Input - 784 dimensional vector

Part 1 split into 50,000 training & 10,000 validation
# Parts

## Digit recognition
- simply; identify digits
- If image is 28x28; i.e, 784 pixels => we'll have 784 neurons in the input layer
- 10 neurons in the output layer to reflect 10 possible digits
	- could be 4 if encoding in binary, but it doesn't give as good results (maybe a better learning algorithm?)
	- could add another layer to convert from 10 to 4 output
- ? neurons in the hidden layer
- Input is assumed to be grayscale (1 for black, 0 for white)
### Structure
We're going with a three-layer NN 

Why?
- one input layer
- one output layer
- >1 hidden layer; keeping it simple with 1

See [[NN - The basics but better#Chapter 1.3]]
### Converting NN object to functional-style code
- I'll first try to set up a basic barebones nn where i'll manually set weights and biases (to see how it works)

![file](03_non_learning_nn.hs)
- For this, I'm using  a module ![Neurons](Neurons.hs)
- For simplicity of use & implementation, I'm not considering input and output layers as 'layers' in any sense. To me, they're simply.. inputs and outputs (arrays)
- This will mean that functionally (pun) my implementation of the NN will simply be a single array of neurons. good for me! (unless something comes up..)

### Implementing learning
- Learning (for each sample of a mini-batch), involves,
	- calculating the error
	- backpropagating to get the 'step'
	- moving a step
Doing this for each sample in a mini-batch is called an 'epoch' of training.
## Image segmentation
(I might not implement this) - For a sequence of digits, figure out which part of the image 'belongs' to which digit.

- Trial segmentation - high score if digit recognition is confident for all segments, low score if not

# References

- [Samson Zhang - Building a neural..](https://youtu.be/w8yWXqWQYmU?si=wugJeinxPxKdF-Df)
- http://neuralnetworksanddeeplearning.com/chap1.html