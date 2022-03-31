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

data Frame where
  AddL :: Expr -> Frame
  AddR :: Int -> Frame
type Cont = [Frame]

data State where
  S :: Expr -> Cont -> State

step :: State -> State
step (S (Add e1 e2) k)          = S e1 (AddL e2 : k)
step (S (Lit n1) (AddL e2 : k)) = S e2 (AddR n1 : k)
step (S (Lit n2) (AddR n1 : k)) = S (Lit (n1 + n2)) k
step s                          = s

eval :: Expr -> Int
eval e = go (S e [])
  where
    go (S (Lit n) []) = n
    go s              = go (step s)
