# Infinity
Type 1/0 to get infinity
# $
use $ to separate function & its inputs (rather than so may nested brackets)

```
neuron_builder :: (Float -> Float) -> Float -> [Float] -> [Float] -> Float

neuron_builder activation bias ws xs  = activation ((dot_prod ws xs) + bias)
```
is now

```
neuron_builder :: (Float -> Float) -> Float -> [Float] -> [Float] -> Float

neuron_builder activation bias ws xs  = activation $ (dot_prod ws xs) + bias
```
# Type synonyms
use different names for types:
```
type Vector = [Float]
type Matrix = [[Float]]
f :: Vector -> (Vector, Matrix) -> Vector
```
see [[Haskell types]]
# Point-free programming

See [Stackexhange](https://stackoverflow.com/questions/944446/what-is-point-free-style-in-functional-programming/944540#944540)

basically, composition of functions is performed using . operator

```
f :: a -> a
f x = inc (square x)
```

is now

```
f :: a -> a
f = inc . square
```

# Infix function

x \`f\` y is a shortcut for ``` f x y ```

### Prefix operator
(\<op>) x y applies an infix operator like a function
``` x <op> y ```
is now
``` (<op>) x y```
- can include 1 or more operands to create compact functions
    ```
	  (1+) - incrementor
	  (/2) - function to halve
	```
# Lambda expressions

Nameless function

>( \\\<in> -> \<exp>)

\\  to represent $\lambda$

e.g, 
```
(\x -> x + x) z

will give z + z
```

# Wildcard parameter

**\_** is the wildcard param, used to 'dispose of' irrelevant params.

`safe_div _ 0 = 0`