{-# LANGUAGE GADTSyntax #-}

data Expr where
  Lit  ::  Int -> Expr
  Add  ::  Expr -> Expr -> Expr

expr1 :: Expr
expr1 =
  Add
    (Add
      (Add (Lit 5) (Lit 7))
      (Add (Lit 6) (Lit 1)))
    (Lit 2)
