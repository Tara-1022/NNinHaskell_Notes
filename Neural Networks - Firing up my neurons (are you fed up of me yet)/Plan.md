- [x] Implement 2-3 simple snippets to understand haskell (12/23)
- [x] Implement individual components (~ 12/23)
- [x] Combine to form a basic NN (01/24)
- [ ] Figure out how to deal with dataset, images
- [ ] UI?
- [-] If still confused on the whys, analyse performance for different activation functions, hidden layer size.. compare (started - 01/24)
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

## 27-12-2023
- I've done the structure!! I have everything in place for a working NN! sure it's buggy (it insists on doing the reverse of learning.. not sure why) and it feels a little like cheating because I didn't come up with the implementation entirely by myself and I'm not doing this in an efficient or _Haskell-y_ way but. It's fine. 
- I'm finding it pretty tough to debug. I mean, building something complex with moving parts is very nice because I know that if it compiles, I'm probably not messing up too badly. The type checking does help. But I also really miss being able to plop in print statements wherever & so yes, debugging is a tough one
- In the future, i'd like to try this again using matrices from one of the three available libraries  so I can try SGD - another issue; using & choosing libraries is not very convenient & I ended up doing everything by hand so I don't go down a rabbit hole. The learning curve is deceptive - it's really easy to learn the Haskell basics but it's really difficult to move up that slope
- I really do want to give this another go - but after having done a few other intermediate things.
- Another thing - the mind-blowing wow-factor _Haskelly_ one-liners are very very unreadable in my opinion. Which is a shame. Maybe i'm not yet comfortable enough in the language
- What I've gained from this project so far, summarised
	- I can really appreciate the simplicity & beauty of ML and how perfectly Haskell (or rather FP) is suited for ML. Not extremely accessible though
	- I can appreciate that everything that imperative programming does can (often more elegantly) be done with functions alone. Also lazy evaluation is fun
	- I learnt a ton about neural networks & they're still as interesting
	- I used a total of **none** of the very helpful workbooks I downloaded. The best way to learn is to dive head first (but after a little dipping of toes)
	- Surprsised myself with how you can convert object-oriented to functional code pretty seamlessly

To do:
- debug, debug, debug, debug
- after debugging, play around with different activations & errors. See how learning rate & number of epochs affect the result. Learn about optimisers

Update:
- I was right! I seem to have reversed the mse_prime function and it works well now! I had also somehow written a function that got the exact reverse of the list I'd intended it to but oh well. It's fixed! It solved the simple linear function pretty well
```
xs =  [[5],[6],[3],[9],[1]]
train_model [[[0.1, 0.5]]] xs xs 500
> [[[5.9204506e-8,1.0]]]
predict_values [[[5.9204506e-8,1.0]]] xs
> [[5.0],[6.0],[3.0],[9.0],[1.0]]

for learning_rate around 0.01
```

- It's failing to learn the XOR function. wonder what's going wrong.
## 07-01-2024
- debugged a little and have two issues
	- working with very high precision numbers sometimes leads to all NaN values
	- i'm going wrong somewhere when it comes to the layering
- taking a detour back to the haskell basics before i continue

To do:
- catch up on more advanced Haskell
- fix precision error

## 08-01-2024
- I did a little of Haskell for Imperative Programmers - mostly wanted to know about monads and IO. That is in progress.
- [I trained the model on a single point](https://towardsdatascience.com/checklist-for-debugging-neural-networks-d8b2a9434f21#--responses:~:text=before%20moving%20on.-,Train%20your%20model%20on%20a%20single%20data%20point,-As%20a%20quick) and an interesting result
```
	ghci> xs = [[1, 0]]
	ghci> ys = [[0]]
	ghci> w = [[[0.4, 0.6], [0.05, 0.03], [1, 0.005]], [[0.07, 0.9, 0.3]]]
	ghci> w2 = train_model w xs ys 10000
	ghci> w2
	[[[0.20125102,0.4012512],[-2.6787722e-2,-4.678723e-2]],[[-0.3232574,0.6404044,0.29696804]]]
	ghci> predict_values w2 xs
	[[1.7881393e-7]]
	ghci> w = train_model w2 xs ys 10000
	ghci> predict_values w xs
	[[1.7881393e-7]]
```
it looks like it's getting really close to 0 but - atleast for the tanh activation - it can't go lower than 1.7 e-7. 
```
ghci> xs = [[1, 1]]
ghci> ys = [[1]]   
ghci> w2 = train_model w xs ys 10000
ghci> predict_values w2 xs
[[0.99900955]]
```
and works very well. it's not the learning in itself that's the issue here.

Clipped values and tried with two points:
```
ghci> xs = [[1, 0], [0, 0]]
ghci> ys = [[1], [0]]
ghci> w = [[[0.4, 0.6], [0.05, 0.03], [1, 0.005]], [[0.07, 0.9, 0.3]]]
ghci> w2 = train_model w xs ys 10000
ghci> predict_values w2 xs 
[[0.9983639],[1.475435e-3]]
```
which seems quite close! i'll train it further and observe.

```
xs = [[1, 0], [0, 0]]
ghci> ys = [[1], [0]]
ghci> w = [[[0.4, 0.6], [0.05, 0.03], [1, 0.005]], [[0.07, 0.9, 0.3]]]
ghci> w2 = train_model w xs ys 10000
ghci> predict_values w2 xs
[[0.99986607],[0.0]]
ghci> w = train_model w2 xs ys 10000
ghci> predict_values w xs
[[0.9999358],[0.0]]
```
is what happens when adjusting the learning rate. The network is very clearly learning! maybe the activation function or structure or number of epochs or error function or any number of things is making it difficult for it to learn the XOR function. I am following the same structure the video did for XOR so i'm very curious why. it's essentially the same maths is it not?

It's a huge relief that my implementation is fine! let me choose a function other than XOR to learn. A 'smoother' function of sorts.

Done:
- add clipping

To Do:
- figure out _why_ this is happening
- get a fairly complex function learnt (enough linear functions!)
- the implementation is not very efficient - figure out how to use matrix libraries & do a little rewrite
- A known issue - the net learns slowly because I calculated all gradients before updating the weights. Figure out how to update each weight before propagating the gradient calculations.

I'll shift focus to a [benchmark problem](./HyperParams) like Sin since I know the learning itself works fairly well.

P.S i just realised that rather than thinking of it of a function that does two different things, i can think of it as a function that calls two different functions (maybe?). Maybe i should ask for help

Also I find it a little frustrating that lower, more basic Haskell (the MOST basic Haskell) has really useful tutorials & guides but there's this sudden jump from 'Haskell is a fun programming language!' to 'Haskell is simply a means to implement Advanced Math™ and no I will not elaborate further'. There's not as much of actually creating things that _do_ things. I'm sure it's extremely possible but it not being as present makes Haskell seem a very niche and haughty language.

## 10-01-2024
I feel absolutely idiotic. I completely forgot you can pass params down recursive functions.

## 11-01-2024
I forgot all about biases.

```
w = [[[0.04, 0.5, 0.08], [0.9, 0.08, 0.7], [0.07, 0.9, 0.6]], [[0.7, 0.05, 0.06, 0.08]]]
xs = [[0, 0], [0, 1], [1, 0], [1, 1]]
ys = [[1], [0], [0], [1]]

train_model w xs ys 500
```

what is happening is I'm calculating the backpropagation for activation layer based on the input to the dense layer. After fixing,

```
ghci> w = [[[0.04, 0.5, 0.08], [0.9, 0.08, 0.7], [0.07, 0.9, 0.6]], [[0.7, 0.05, 0.06, 0.08]]]
ghci> xs = [[0, 0], [0, 1], [1, 0], [1, 1]]
ghci> ys = [[1], [0], [0], [1]]
ghci> w2 = train_model w xs ys 500
ghci> predict_values w2 xs
[[0.9851537],[1.060858e-3],[6.017508e-3],[0.9790084]]
ghci> w2 = train_model w xs ys 5000
ghci> predict_values w2 xs
[[0.99946594],[1.4219995e-2],[-2.1435076e-2],[0.99926984]]
```

It works!

Sin function - 1:5:1

```
w = [ [[0.3, 0.4], [0.9, 0.6], [5, 0.3], [2, 1], [0.001, 0.5]], [[0.6, 0.5, 0.6, 0.3, 0.8, 0.9]]]
xs = [[]]
```

power function - cube

```
w = [ [[0.3, 0.4], [0.9, 0.6], [5, 0.3], [2, 1], [0.001, 0.5]], [[0.6, 0.5, 0.6, 0.3, 0.8, 0.9]]]
xs = [[1], [2], [3]]
ys = [[1], [8], [27]]
```

it did not work. maybe i was delulu when it worked for xor or maybe the structure needs work.

## 15-01-2024

```
ghci> xs = [[1], [2], [3], [4], [9], [8], [5], [3], [1], []]
ghci> ys = map (map (\x -> x*x)) xs
ghci> ys
[[1],[4],[9],[16],[81],[64],[25],[9],[1],[0],[81],[64]]     
ghci> w2 = train_model w xs ys 5000                         
ghci> predict_values w2 xs                                  
[[0.99015695],[0.9999206],[0.9999899],[0.9999944],[0.9999954],[0.9999954],[0.9999952],[0.9999899],[0.99015695],[1.626967e-3],[0.9999954],[0.9999954]]
```
What caught my eye is that it predicted 0 right - so the issue is the activation function i'm using. tanh can only output between 0 and 1 - so i'd have to scale my input accordingly.

[Why use tanh for MLP](https://stackoverflow.com/questions/24282121/why-use-tanh-for-activation-function-of-mlp)

```
ghci> xs = [[1], [2], [3], [4], [9], [8], [5], [3], [1], [0], [9], [8]]
ghci> w = [ [[0.3, 0.4], [0.9, 0.6], [5, 0.3], [2, 1], [0.001, 0.5]], [[0.6, 0.5, 0.6, 0.3, 0.8, 0.9]]]
ghci> xs = [[1], [2], [3], [4], [9], [8], [5], [3], [1], [0], [9], [8]]                              
ghci> ys = map (map (\x -> 5*x)) xs                                                                  
ghci> w2 = train_model w xs ys 50                                                                    
ghci> predict_values w2 xs                                                                           
[[4.9379373],[9.953882],[14.969826],[19.985771],[45.065495],[40.049545],[25.001715],[14.969826],[4.9379373],[0.17317355],[45.065495],[40.049545]]

Params: 
activation :: Activation
activation = relu

activation' :: Activation_Prime
activation' = relu_prime

error_prime :: Y -> Y -> [Float]
error_prime = mse_prime

learning_rate :: Float
learning_rate = 0.001
```

Obviously, i'm testing the prediction of the learning set, not actually seeing how what the net has 'learnt' extrapolates to unseen points. Actually testing:
```
ghci> predict_values w2 [[3], [0], [-1], [10]]
[[14.969826],[0.17317355],[0.0],[50.081436]]
```
which is great!

putting the code on hiatus for a bit until i finish working on the paper

### To Do:
- Add & test more activation functions & errors
- Add code to evaluate metrics s.a accuracy
- Remove redundant calculations by storing activation partial inputs as well

Way-off-in-the-future to-dos
- implement SGD
- wrap weights in a monad to avoid [NaN]([[Maybe the real learnings are the errors we make along the way#NaN]])
- create an efficient version of the library with hmatrix (or similar)
- allow different layers to have different activations