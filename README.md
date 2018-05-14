# sets

Haskell teaching material, implementing object-like sets

## Mac OS Setup

Assumes you have Homebrew installed and configured.

    brew cask install haskell-platform
    brew cask install visual-studio-code
    cabal update
    cabal install ghcid
    export PATH=$PATH:$HOME/Library/Haskell/bin

## Mac OS Workflow

Use `ghcid` in a terminal while editing your Haskell file in `code`.
`ghcid` will compile your file on every save.

    code Sets.hs
    ghcid Sets.hs

## Ubuntu Setup

    sudo apt install haskell-platform
    cabal update
    cabal install ghcid
    export PATH=$PATH:$HOME/.cabal/bin

## Ubuntu Workflow

Use `ghcid` in a terminal while editing your Haskell file.
`ghcid` will compile your file on every save.

    xdg-open Sets.hs
    ghcid Sets.hs
