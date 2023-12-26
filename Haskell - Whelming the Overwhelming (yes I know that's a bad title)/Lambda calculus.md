# What even

Defines how to create functions and call them.

**Purpose**: Study how functions work and interact.

**Core idea**: functions as values. Only variables used are bound - can only express the input to the function

## Basic structure
Not technically correct lambda calculus; seen through a programming lens

```
f(x) = x + 2 => does not actually define the function; how would we define f?
f = λx. x+2

i.e;
- λ - indicates that it is a function
- x - inputs (may also be functions) (formally variable)
- . - separator
- x + 2 - what the function does to the input (formally, expression)

Calling the function:
f(3) => (λx. x+2) 3
applies '3' to f
```

In programming, this is expressed as anonymous functions or closures.
Python equivalent:
```
f = lambda x: x + 2
```

Haskell equivalent:
```
\x -> x + 2
```

## Currying

(named after Haskell Curry!)

How would you write a function to act on multiple input?

Most programming languages - 'box up' input into a single input (array, tuple..) and unbox

Lambda calculus? - split up. Write a function that takes the first input. This generates a function, applied on the second..
Effectively speaking, the outermost variables are bound to their value at all levels of the function. Think nesting

```
add = λx. (λy. x + y)
add 5 3
```

JavaScript equivalent
```
function add(x){
	return function(y){
	return x + y
	}
}
```

If you pass in less params? You simply get a customised function

```
add 5
=> λy. 5+y (we can calll this 'addFive')
```

Conciseness
```
λxyz. x+y+z <- λx. (λy. (λz. x+y+z))
```

"A function that takes their arguments one at a time is a curried function"

Also think of it as a customised function. (Seems equivalent to closures)

"A closure is a poor person's object"
## Church encoding
Not exactly relevant; a way to replicate the existence of numbers within lambda calculus.

# References
- [Lambda Calculus: The foundation of....](https://www.youtube.com/watch?v=_n4LIt2WPzE)
- [The purest coding style,..](https://youtu.be/HlgG395PQWw?si=c0AHrJ1sRqjnfsHo)