## Environment

The Glasgow Haskell Compiler (GHC) has a compiler and interpreter.

Download GHCup.
## Code
- type 'ghci' in cmd for interpreter

- Haskell script - .hs
- [Literate script](https://wiki.haskell.org/Literate_programming) - .lhs (everything is assumed to be a comment; code starts with '>')

### Interactive environment:
- ghci \[file.hs]
- :load file.hs
- :reload
- :q to exit
### Compile:
- ghc file.hs
- ./file.hs
### Interpret:
- runghc file.hs

## Debugging

[Debug.Trace](https://hackage.haskell.org/package/base-4.14.0.0/docs/Debug-Trace.html) is generally used to 'cheat' when it comes to reading intermediate values.
# References
- [Haskell.org Docs](https://www.haskell.org/downloads/)
- [Graham Hutton L4](https://www.youtube.com/watch?v=YtZIKujkSmU&list=PLF1Z-APd9zK7usPMx3LGMZEHrECUGodd3)
- [Haskell.org](https://www.haskell.org/ghcup/steps/)