module Expr where

import Add as Add
import Data.Variant (SProxy(..), Variant, inj, match)
import Lit as Lit

type Expr e = Variant (lit :: Int, add :: {left :: e, right :: e})

map :: forall e. (e -> e) -> Expr e -> Expr e
map f =
  match
    { add: \{left, right} -> Add.add (f left) (f right)
    , lit: \x -> Lit.lit x
    }

eval :: forall e. (e -> Int) -> Expr e -> Int
eval f =
  match
    { add: \x -> Add.eval f (inj (SProxy :: SProxy "add") x)
    , lit: \x -> Lit.eval (inj (SProxy :: SProxy "lit") x)
    }
