module Lib
    ( someFunc
    ) where

import System.Random
import Text.Printf

data Point = Pt {px, py :: Float}

someFunc :: IO ()
someFunc = printf "%.4f\n" $ avgDist 1 (3/5)
