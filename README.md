# haskell-rand

Simple examples of the use of random number generators in System.Random (random) System.Random.MWC (mwc-random) and Crypto.Random (cryptonite)

## Introduction

You can think of a random number generator as having an internal state space (S), and function f that transitions from the current state value to a new state value in S, and a function g that converts the current state value to the output that is used by other functions.

```
f:S -> S
g:S -> output
```

The initial state s0 is called the _seed_.  Sometimes g is just the identity.

For the purpose of simulation or Monte Carlo calculations you want a random number generator that is fast, statistically valid, has a long period, and is repeatable (ie, given the same seed will product the same sequence).  Note that you not only want the numbers to be uniformly distributed, but you want pairs, triples, etc. to be uniformly distributed within the space of that dimension.

This type of pseudo-random number generator works fine for most probabilistic algorithms, but is not safe for cryptographic use.  That's because given some number of values from the output sequence, it's usually possible to find the initial seed.  For cryptographically secure applications you need a generator that is not predictable, even though it is still usually deterministic.  This requires using a seed from a source that is "truly" random, and also using an algorithm that, while much slower, is unpredictable.

### System.Random

### System.Random.MWC and System.Random.MWC.Distributions

### Defining your own variates

### Crypto.Random

