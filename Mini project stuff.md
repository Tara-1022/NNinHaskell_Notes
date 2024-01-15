Work on Haskell is sponsored by [Google Research](https://www.haskell.org/ghc/#:~:text=IOHK-,Google%20Research,-Tweag%20I/O)
# Paper

(Multi-swarm parallel PSO: Hardware implementation)

is used in academia. pros & cons. compare to rust? why? scope for regular users? performance?

merging point of maths, cs 

what libraries are they using - options summary

- [Get a brain](https://crypto.stanford.edu/~blynn/haskell/brain.html#:~:text=The%20neural%20network%20takes%20about,takes%20about%20another%2040%20lines.&text=Let's%20walk%20through%20a%20sample,a%20reasonably%20legible%20%229'.) mine is much much more readable

- [neural library](https://hackage.haskell.org/package/neural) experimental 
		"""[There are already a couple of neural network libraries out there on Hackage, but as far as I can tell, they either-  are wrappers for an engine written in another language or- offer a limitted choice of network architectures, training algorithms or error functions or are not easily extensible.](https://hackage.haskell.org/package/neural#:~:text=There%20are%20already,not%20easily%20extensible.)"""
		and [other libraries](https://stackoverflow.com/questions/4942392/neural-networks-in-haskell-advice)
		[Lib list](https://stackoverflow.com/questions/4942392/neural-networks-in-haskell-advice)
- _TensorSafe_ Structure verification of deep neural networks at compilation time (2019)

People like [Sacha](https://elifesciences.org/articles/64615#x02f779e4) implement in Haskell - but not always mentioned in the paper - ubiquitous

Is Genome Written in Haskell? (2021) - so ubiquitos it is compared to Haskell, not another fp. But why is it not widely known?
data on popular reaearch langs

-  A functional neural network prototype for multidimensional data analysis
-  Accelerating Haskell array codes with multicore GPUs
- General Methodologies for Neural Network Programming
- Forward- or reverse-mode automatic differentiation: What's the difference?
- Monadic Deep Learning (2023)
- Text Classification using Artificial Neural Networks (2015)
- Cloud Haskell: First impressions and applications to processing large image datasets (2013)
- A Framework for the Merger and Practical Exploitation of Formal Logic and Artificial Neural Networks (2009)
- Modelling Neural Networks with Recursion Schemes (2019) - "The concept of recursion schemes with neural nets is one that has very little, if at all any, formal research"
- Implementing Bayesian Inference with Neural Networks(2019) " In my opinion (which is
	shared by many in the Haskell community) Haskell has the potential to provide an
	excellent and type-safe interface to numerical algorithms, but the right abstractions
	for describing these algorithms must first be found."
- A Study of Cloud Haskell With Applications to MapReduce (2018)  - haskell faster?
- Attractor Neural Networks for Modelling Associative Memory (2013) sings praises
- Learnable Commutative Monoids for Graph Neural Networks (2022) "Furthermore, in the spirit of Olah [2015], we observe that there is a very close correspondence between the construction of neural networks and the construction of purely functional programs: indeed, we believe that strongly typed, purely functional languages like Haskell offer great potential for safe, succinct specification and training of neural networks."
- A genetic algorithm framework using Haskell (2000) "One of the many benets of using Haskell is the ability to specify functions that operate on (potentially) innite data structures. A program will evaluate only as much of an innite structure as required to compute its result. This liberates our program from considerations such as the number of ospring needed | we can generate the innite list of ospring and rely on the combine function to use only as many ospring as necessary to construct the new population."
- Folding over Neural Networks (2022) "ls. However, a deeper analysis reveals that 
- structured recursion can be used instead, so that traversal is directed by the structure of the network itself. This paper shows how such an approach can be realised in Haskell," - composability
- Experience Report: Haskell in Computational Biology (2012) "To be able to use Haskell, we had to reimplement the standard algorithm for solving Viterbi’s equations. Haskell made it possible for us to write code that looks like the math, which made the code easy to write and gives us confidence that it is correct."
- An Auto-Parallelizer for Distributed Computing in Haskell (2023) 
- The Monad.Reader 21: "The primary advantage of using functions such as map and scanl1 is not that they save a few lines of code over an equivalent for loop, but that these functions more clearly indicate the programmer’s intent" - power of expression esp in comparison to python (map)

Key points extracted:
- Use of Haskell makes it easier to implement math structures - in turn means that primary use of the language in implementation serves to improve knowledge of subject matter.

# Model

- Cube, square - [Approximating square function with NN](https://stackoverflow.com/questions/55170460/neural-network-for-square-x2-approximation)