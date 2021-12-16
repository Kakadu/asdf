### Trying to make sens of OCaml closures


##### Compilation

    CFLAGS=-m32 make && ./myinspect.exe

  or

    make && ./myinspect.exe


#### Current state of things


````
✗ export OPAMSWITCH=4.12.1 && eval $(opam env) && make && ./myinspect.exe
cc -I `ocamlc -where`/  -c inspect.c
#ocamlfind opt -g  -package lazy-trie inspect.o main.ml -o main.exe
ocamlfind opt -g  -S inspect.o myinspect.ml -o myinspect.exe
....memory block: size=2  -  closure with 1 free variables
........code pointer: 0x55c3d5311bd0
........arity = 2
....memory block: size=4  -  closure with 3 free variables
........code pointer: 0x55c3d5311c20
........arity = 2
........immediate value (27)
....memory block: size=4  -  closure with 3 free variables
........code pointer: 0x55c3d5311c20
........arity = 2
........immediate value (27)

....memory block: size=3  -  closure with 2 free variables
........code pointer: 0x55c3d5311a70
........arity = 3
....memory block: size=4  -  closure with 3 free variables
........code pointer: 0x55c3d5311cb0
........arity = 2
........memory block: size=3  -  closure with 2 free variables
............code pointer: 0x55c3d5311a70
............arity = 3




✗ export OPAMSWITCH=4.12.1+flambda && eval $(opam env) && make && ./myinspect.exe
cc -I `ocamlc -where`/  -c inspect.c
#ocamlfind opt -g  -package lazy-trie inspect.o main.ml -o main.exe
ocamlfind opt -g  -S inspect.o myinspect.ml -o myinspect.exe
....memory block: size=2  -  closure with 1 free variables
........code pointer: 0x55aad889cbf0
........arity = 2
....memory block: size=2  -  closure with 1 free variables
........code pointer: 0x55aad889cc60
........arity = 2
....memory block: size=2  -  closure with 1 free variables
........code pointer: 0x55aad889cc50
........arity = 2

....memory block: size=3  -  closure with 2 free variables
........code pointer: 0x55aad889ca70
........arity = 3
....memory block: size=2  -  closure with 1 free variables
........code pointer: 0x55aad889cbb0
........arity = 2
````
