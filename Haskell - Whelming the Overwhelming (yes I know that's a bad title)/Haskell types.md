# Type

A type declaration mechanism is used to declare a new name for an **existing type**.

i.e, a 'String' is simply a list of Char, which is something that exists in Haskell.

> type NewType = <thing we're naming>

E.g, `type String = [Char]`

- types usually have the first character in uppercase
- they're simply synonyms; why use them? for ease & specificity of comprehension.
- can be nested but **not** recursive.
- functions can have custom types too. E.g, `type CharChange = Char -> Char`

Type declaration can have parameters for flexibility! (Polymorphism)
> type ParamType a = <\thing involving a>
> where a is a placeholder

E.g, `type Pair a = (a,a)`

this is later referenced as
>ParamType <\type>

E.g, `mult :: Pair Int -> Int` or `copy a -> (a,a)`

See [Neurons]('NN-Haskell exercises\Neurons.hs')
# Data
Data declaration is used when you want to specify a completely new type.

>data NewType = <\constructors>
>constructors - values it can be

E.g. `data Bool = False | True`
	or, `data Availability = Available | Unavailable`

these constructors can take params (and are themselves parameterisable)
> data NewType = Con1 <\type1> <\type2> | Con2 <\type1>....

they are viewed as functions that 'build' values of the NewType type

- must also start with uppercase
- the types have no intrinsic meaning to the system; we define functions to do so
- can be recursive (see Peano integers, binary trees)
- often used to create tree-like structures
# References

- [Graham Hutton (again)](https://www.youtube.com/watch?v=sYgvpTyFpZ4&list=PLF1Z-APd9zK7usPMx3LGMZEHrECUGodd3&index=12)