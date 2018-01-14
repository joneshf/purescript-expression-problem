module Add where

import Data.Semiring (class Semiring, (+))
import Data.Variant (SProxy(..), Variant, inj, match)

type Add e = Variant (add :: {left :: e, right :: e})

eval :: forall a e. Semiring a => (e -> a) -> Add e -> a
eval f =
  match
    { add: \{left, right} -> f left + f right
    }

add :: forall e r. e -> e -> Variant (add :: {left :: e, right :: e} | r)
add left right = inj (SProxy :: SProxy "add") { left, right }
