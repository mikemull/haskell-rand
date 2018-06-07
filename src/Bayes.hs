module Bayes where

import Control.Monad
import Control.Monad.Primitive
import Data.Vector (singleton, toList)
import Data.List
import System.Random.MWC as MWC
import System.Random.MWC.Distributions as MWC

s0 = 2.7
v0 = s0^2

muSigma u v x = ((v * x + v0 * u)/(v + v0), (v * v0)/(v + v0))

updateParams :: Double -> Double -> [Double] -> [(Double, Double)]
updateParams u v [x] = [muSigma u v x]
updateParams u v (x:xs) = let (uu, uv) = muSigma u v x
                          in (u, v) : updateParams uu uv xs

bayes :: Double -> Int -> IO [(Double, Double)]
bayes u n = do
  rng <- initialize (singleton 123)
  x <- replicateM n (normal u v0 rng)
  let mu = (10000 * head x + v0 * 0) / (10000 + v0)
  let sigma = (10000 * v0)/(10000 + v0)
  return $ updateParams mu sigma (tail x)
