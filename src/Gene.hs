module Gene where

import System.Random.MWC
import Data.Vector (Vector, toList)

data Resource = A | T | G | C deriving (Enum, Show, Bounded, Eq, Ord)

instance Variate Resource where
  uniform = uniformR (minBound, maxBound)
  uniformR (a, b) g = uniformR (fromEnum a, fromEnum b) g >>= \x -> return (toEnum x)

randomGene :: GenIO -> Int -> IO [Resource]
randomGene g n = do
                v <- uniformVector g n :: IO (Vector Resource)
                return $ toList v
