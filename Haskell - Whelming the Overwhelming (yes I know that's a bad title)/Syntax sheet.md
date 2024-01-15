# Basic

- implicit grouping -> levels based on indentation
- can also use {} for grouping
- lines can be separated with ;
## Types

- generally all caps 
- a collection of related values
- types are inferred at compile time; good practice to write down these types
- an expression is of type *t* if evaluating it would return a type *t* -> e :: t
### :type
- get the type signature of anything
- does not evaluate; looks at structure
- :type \<thing>

You can create your own [[Haskell types]] to work with
### Bool
- True, False
- 64 bit
### Float

### Char
- single quotes
### String
- a list of characters 
- is represented in shorthand with double quotes
## Lists

- conventionally suffixed with 's'
- type: \[\<t>]; e.g., \[Bool], \[\[Bool]]
- **must** be of same type

> "lists in Haskell are (internally) implemented as **_linked lists_**. This is different from many other languages, where the word "list" and "array" is used interchangably. Linked lists and arrays have very different performance characterstics when operating on large amounts of data. Keep this in mind for the future. If you're dealing with very large lists, where you want to randomly access the `i`-th element multiple times, use a [`Vector`](Libraries) instead." - [Haskell Tutorials.com](https://www.haskelltutorials.com/guides/haskell-lists-ultimate-guide.html#:~:text=lists%20in%20Haskell%20are%20(internally,times%2C%20use%20a%20Vector%20instead.)

Range
- \[first..last]
### \[]
- lists
- must be of homogenous type
- \[] is an empty list
- \[*item*] is a singleton list
### !!
- indexing
- 0-indexing performed

> arr !! 0 === arr\[0]
### ++
- concatenates lists
### :
- appends/prepends a single element
- constructs a list
- 1:\[2,3] -> \[1,2,3]
### List generation

> \[start..end]

E.g,
> \[1..10]

### List comprehensions

Extremely similar to mathematical set-building notation
> {a | \<condition> ^ \<condition>..}

is now

> \[a | \<condition>, \<condition>..]

> \[a | a <- xs, a <= x]
 'List of all a S.T a is taken from xs and a <= x'

### List patterns

lists are internally represented as 

>\[a1, a2, .. an] = a1 : ( a2: ( a3: (.. an: \[]))) 

this is the idea behind x:xs patterns: [[Syntax sheet#x:xs]]
## Tuples

- sequence of values of different types
- type signature: (t1,t2,t3..tn); e.g, (Bool, Bool, Char)
- the type encodes the size

To retrive values, 
- use fst, snd to retrieve form a tuple pair

[Reference](https://en.wikibooks.org/wiki/Haskell/Lists_and_tuples)
## Functions

- function and args must start with lower-case letter
- map values from one type to another
- functions that return booleans are 'properties' or 'predicates'

> f = \<expression>
> 	   where 
> 		   \<definitions>

type signature

> func_name :: constraint => input_type -> output_type

- infix operators are defined as 
 >	(\<op>) = ..
 
- function composition: see [[Tricks#Point-free programming]]
- currying:  see [[Syntax sheet#Currying]]
- polymorphic [[Syntax sheet#Polymorphic functions]]
- overloaded [[Syntax sheet#Overloaded functions]]
## Conditionals

### If

> if \<cond> then \<exp> else \<exp>

the else must *always* be specified

Nested:
>  func \<in> = if \<cond> then \<exp> else
> 						 if \<cond> then \<exp> else \<exp>

### Guarded equations

more mathematical conditionals

> otherwise = True
> func \<in> | \<cond>             = \<exp>
> 				 |\<cond>              = \<exp>
> 				 | otherwise          = \<exp>

- assignment **must** be at the same level
- the first guard that evaluates to True is considered

### Pattern matching

An even simpler way to define functions.

> (&&) :: Bool -> Bool -> Bool
> True  && b      = b
> False && _       = False

_  is the wildcard pattern, matches anything
True is a pattern that matches only to Bool True

- patterns are matched in order; top down
- patterns are not allowed to repeat variables
- broken down to if.. else by compiler

see list patterns

> head (x:\_) = x
> tail (\_:xs) = xs
# Inbuilt

## Library functions

- map
- zipWith - f list1 list2 => i f j for all i of list1, j of list2
- foldr - f z xs => applies f as (f... (f (f z x1) x2) ... xn)
- flip - takes a function, returns a function that has order or params flipped

Useful functions to know: `map`, `zipWith`, `filter`, `foldr`/`foldl`/`foldMap`, `traverse`, `takeWhile`/`dropWhile`, `scanr`/`scanl`, `mapAccumL`/`mapAccumR`, `init`
### List

function list

- length
- sum; default 0
- product; default 1
- reverse
- head - first element of a list; tail - rest of the elements
- take n xs - takes first n elements; drop n xs - drops first n elements
- zip -> same as for python
	```
	ghci> zip [1,2,3] ['o','p','y']
	> [(1,'o'),(2,'p'),(3,'y')]
	ghci> zip [1,2,3] ['o','p']    
	> [(1,'o'),(2,'p')]
	```
- null -> list is empty

### Logical
- not
- \==, >=, <=, ..

### Numeric
- +, -, div, *
- even

## Currying

type signature:
```
func :: t -> (t -> t)
```

is simply represented by 
```
func :: t -> t -> t
```

by default. provides flexibility

See [currying]([[Lambda calculus]]), ![currying code](./Katas/02_currying.hs)

## Polymorphic functions

type signature is variable (applies to most library functions)

> 	length :: \[a]  -> Int
> where a is any type

These type variables **must** be lowercase, preferably a,b,..

## Overloaded functions

type contains one or more [class constraints](https://en.wikibooks.org/wiki/Haskell/Classes_and_types)
- Num
- Seq
- Eq (can be determined to be equal)
- Ord (can be ordered)

> (+) :: Num a => a -> a -> a

## x:xs
- use the colon to break apart lists
- it's a pattern that matches a list. extracts first element to *x*, and the rest to *xs*
- does not match non-empty lists
- paranthesized for priority in evaluation
see [[Syntax sheet#List patterns]]
# References
- **[Functional Programming in Haskell](https://youtu.be/rIprO6zoujM?si=7DyodsK-X0Cn6D1w)**