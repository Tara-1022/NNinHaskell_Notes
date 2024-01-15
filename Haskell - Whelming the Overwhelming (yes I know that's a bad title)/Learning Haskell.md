Saachi's resources: 
- [Youtube playlist](https://www.youtube.com/playlist?list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV) => 15 hours
- [NN in Haskell](https://crypto.stanford.edu/~blynn/haskell/brain.html) full implementation
- Progamming in Haskell (Graham Hutton); did not find a copy

Mine:
- [Monday Morning Haskell](https://mmhaskell.com/liftoff)=>
- [Graham Hutton's lectures (absolute beginners)](https://www.youtube.com/playlist?list=PLF1Z-APd9zK7usPMx3LGMZEHrECUGodd3) => 10 hours *\**
- [Haskel Beginners Course](https://github.com/haskell-beginners-2022/course-plan)
- [CIS Haskell Course](https://www.cis.upenn.edu/~cis1940/spring13/lectures.html)

More:
- [Hoogle](https://hoogle.haskell.org/) *\**
# Intro
## What is Haskell?
Purely functional language based on [lambda calculus](Lambda%20calculus.md); named after Haskell Curry.

Language of academic interest; represent mathematical ideas effectively

The standard lazy functional programming language

### 'Functional language'
In the name; a language that encourages functional programming. Functional programming -> computation based on application of functions to arguments.

Easier to capture the essence of algorithms
### Top features
- Lazy evaluation -> unevaluated until used; unpredicted memory use
- All data immutable -> garbage collector present
- All values are first class -> can be passed as arguments (functions included)
- No side-effects; a function is deterministic (depends only on input)
- when it comes to operations, functions are highest priority (evaled first)
> f a + b => f(a) + b
### Learning practices
- make sure the type signature compiles before actually writing a function; define how you'll use it (Bonus: the compiler checks if you follow it)
- always include relevant class constraints
- know how you'll test before you implement
- keep track of [errors](Maybe%20the%20real%20learnings%20are%20the%20errors%20we%20make%20along%20the%20way.md)
- functions are all usually recursive. write the base case first
- add library expressions to the .cabal file; then import to make sure it's the right dependency
# First steps
- [Just looks cool](https://youtu.be/dAeECyntQJg?si=T5Ff_PaAurUTeJbF)
- [Basic syntax](Syntax%20sheet.md)
- [Technical steps](Actually%20running%20things.md)
# References
- [Haskell in 100 seconds](https://www.youtube.com/watch?v=Qa8IfEeBJqk)
- **[Functional Programming in Haskell](https://youtu.be/rIprO6zoujM?si=7DyodsK-X0Cn6D1w)**

# Impressions
- so very very concise! Hours of effort boils down to like 3 lines of code.
- when they said functional they meant _functional_. My constants are technically functions. My structures are just functions. My types are synonyms for functions and my data declarations can only take on meaning I ascribe to it... through functions.