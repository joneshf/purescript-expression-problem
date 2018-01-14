module Lit where

import Data.Variant (SProxy(..), Variant, inj, match)

type Lit = Variant (lit :: Int)

eval :: Lit -> Int
eval =
  match
    { lit: \x -> x
    }

lit :: forall r. Int -> Variant (lit :: Int | r)
lit = inj (SProxy :: SProxy "lit")
