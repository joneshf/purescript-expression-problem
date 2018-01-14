module Main where

import Prelude

import Add (add)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow)
import Expr as Expr
import Lit (lit)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  logShow $ Expr.eval id (lit 1)
  -- logShow $ Expr.eval (Expr.eval id) (add (lit 1) (lit 2))
