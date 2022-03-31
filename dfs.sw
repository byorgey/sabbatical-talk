def m2 = move; move end
def m4 = m2; m2 end
def m6 = m4; m2 end

def ifC : forall a. cmd bool -> {cmd a} -> {cmd a} -> cmd a =
  \test. \thn. \els. b <- test; if b thn els end
def while : cmd bool -> cmd () -> cmd () =
  \test. \body. ifC test {body ; while test body} {} end

def dfs : cmd () =
  ifC (ishere "tree") {
    grab;
    turn west;
    ifC blocked {} {move; dfs; turn east; move};
    turn north;
    ifC blocked {} {move; dfs; turn south; move};
  } {}
end
def harvester =
  turn west;
  m6;
  dfs;
  turn east;
  m6;
  while (has "tree") (give base "tree");
  selfdestruct
end
