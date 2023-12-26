- Implement 2-3 simple snippets to understand haskell
- Implement individual components
- Combine to form a basic NN
- Figure out how to deal with dataset, images
- UI?
- If still confused on the whys, analyse performance for different activation functions, hidden layer size.. compare
### Links
- [Markdown syntax](https://csrgxtu.github.io/2015/03/20/Writing-Mathematic-Fomulars-in-Markdown/)
- [Colab notes](https://colab.research.google.com/drive/1eGQ309ABxYMu5OuA-cVytoI_UadOxppA)
# Progress

## 08-11-2023
So far,
- followed around half of the Graham Hutton Course (see [[Learning Haskell]]) & played around replicating functions
- Went through & tried out the first chapter of Neural Networks and Deep Learning book (see [[NN - The basics but better]]) (I'm still a little confused on his gradient mathematics? i'll have to revisit that)
- Implemented perceptron, sigmoid neuron & played around with values
- I'd like to know backpropagation well enough! He does not cover it in chapter 1, so will have to skip through chapters
- I want to first have an idea of my Haskell NN structure - understood his in [[Handwritten digits]], but it's object-based code.. So draft a structure
- My notes from last month were pretty unreadable, so i'll try to be more verbose for future reference
### To-do
Now:
- create NN structure
- Understand back propagation
- watch maybe 1-2 more videos
- see if I can get the [Obsidian excalibur plugin](https://github.com/zsviczian/obsidian-excalidraw-plugin) to work ( i think it'll help create diagrams later)

Later:
- understand his vectorised gradient descent
- figure out the structure of NN with learning

## 11-11-2023
- Thinking about efficiently representing a barebones NN functionally; I had to look up [[Haskell types]] and am going to give it another go
- coincidentally came across importing modules, which is just fun!

- i think i'm about done with the barebones structure (for now). It's neat to see the entire structure concisely represented in a total of 26 (and less if you don't want perceptrons) lines of code. But also... _just_ 26?!
### To-do
- gradient descent - understand & implement (i'm just aiming to implement a general gradient descent)
- backpropagation

## 12-11-2023
- Reading up and i think the way forward from here is to understand where exactly backpropagation fits into all this. I understand that gradient descent optimises the neural network; adjusts weights & biases so that an error function is minimised. But then, why backpropagate?
- Done - what I understood is backpropagating gives us our optimised step without derivation
### To-do
- learn about backpropagation
- implement gradient descent & backpropagation functions (independently)

## 23-12-2023
- Came back after exams and decided the sources i was using were going nowhere with helping me actually apply learning. Using another source and trying again

## 24-12-2023
- shifted to the softmax layer activation as per the video
- I'll implement SGD now. Before that, I'll have to rewrite what I have so it works with batching.
- Just realised that the implementation of backpropagation depends on the activation function used. I feel quite silly now. I think I understand enough to implement my own network now.
- I'm going to redo the code so that weights are represented by an array independent of the neural network (as a function) itself. This should simplify updations later

## 26-12-2023
- took a day off. Will get the simplest possible net done by tomorrow. will look into softmax, cross entropy etc at my own pace later.
- While I now do understand SGD, online, softmax quite well I really should focus on the basic of basics when it comes to implementation
- Haskell is so nice and expressive but why does it have such a steep learning curve. As in, Haskell Basics are easy to understand but Python Basics in Haskell are fairly advanced to implement.