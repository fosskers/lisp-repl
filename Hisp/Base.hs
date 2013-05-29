module Hisp.Base where

import Control.Monad.State.Lazy
import Data.Map.Lazy (insert)

import Hisp.Eval (none)
import Hisp.Types
import Hisp.Builtins

---

initialState :: Scope
initialState = builtins

-- | Inject a new Value into Scope.
-- Signature will always stay the same while the implementation changes :)
inject :: Monad m => Value -> StateT Scope m ()
inject v = modify $ insert "x" (newX v)

newX :: Value -> Function
newX x = Function "x" None (none x)