with (import <nixpkgs> {});

let
  haskellDeps = ps: with ps; [
    haskell-language-server
    cabal-install
  ];
  haskellEnv = haskell.packages.ghc902.ghcWithPackages haskellDeps;
in mkShell {
  buildInputs = [
    haskellEnv
  ];
  shellHook = ''
    export PATH=$PATH:$HOME/.cabal/bin/
  '';

}
