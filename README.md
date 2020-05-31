Haskell [fay](https://github.com/faylang/fay/wiki) in a docker container.

Introduced because I ran into [issues with the new Nix approach](https://github.com/faylang/fay/issues/459) of cabal and the package lookups that fay wants to do.

## Usage

Run fay from the container on your local files:

    docker run -it --mount type=bind,src= `pwd` ,dst=/workspace bneijt/fay fay --optimize --output a.js src/Example.hs

This will mount the current working directory at `/workspace` and run `fay` to compile `src/Example.hs` into `a.js` . 

## Trivia

* Inside the container, the user is `app` with home `/home/app` 
* Default working directory is `/workspace` , owned by `app` 
