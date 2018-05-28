module Lib
    ( someFunc,
      interpointDist
    ) where

import System.Random
import Text.Printf


someFunc :: IO ()
someFunc = printf "%.4f\n" $ avgDist 1 (3/5)

interpointDist :: IO ()
interpointDist = do
  g <- newStdGen
  printf "%.4f\n" $ avgDistMC g 1 (3/5)

avgDist :: Float -> Float -> Float
avgDist a b = 1/15 * ((a^3/b^2) + (b^3/a^2) + ac * (3-a^2/b^2 - b^2/a^2))
   + 1/6 * (b^2/a * archosh (ac/b) + a^2/b * archosh (ac/a))
   where
     ac = sqrt(a^2 + b^2)

archosh :: Float -> Float
archosh t = log (t + sqrt (t^2 - 1.0))

dist (x1, x2) = sqrt ((fst x1 - fst x2)^2 + (snd x1 - snd x2)^2)

avgDistMC :: StdGen -> Float -> Float -> Float
avgDistMC sg a b = sum (map dist (take 1000 (recPoints (rndFromRec sg a b)))) / 1000

recPoints :: [(Float, Float)] -> [((Float, Float), (Float, Float))]
recPoints (q:r:xs) = (q,r): recPoints xs

rndFromRec :: StdGen -> Float -> Float -> [(Float, Float)]
rndFromRec sg a b = zip x y
  where
    (sg1, sg2) = split sg
    x = randomRs (0.0, a) sg1
    y = randomRs (0.0,  b) sg2
