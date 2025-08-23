## OCAML-Intro

This is a repository for me to learn the basics of OCaml

Set up using ```opam switch create 5.3.0```

Also run ```opam install ocaml-lsp-server odoc ocamlformat utop```

Following https://ocaml.org/docs/your-first-program

Steps

1. Ran ```dune init proj hello```
    1. This generated the hello directory all following notes will be from within this dir unless noted otherwise
2. lib and bin contain source code files for libraries and programs respectively
3. Dont edit anything in _build, it will be overwritten during subsequent builds
4. Need to cd into hello direc before running ```dune build```
5. Execute with ```dune hello```
6. Can use -w to use watch mode (will run when file(s) are altered)

### Calculator App
Made a stateful command line calculator app to work on using classes and multiple files in the lib folder

Can be run by going into the calc dir and running ```dune exec calc```