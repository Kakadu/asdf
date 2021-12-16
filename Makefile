OUT=main.exe
INSPECT=myinspect.exe

all:
	cc -I `ocamlc -where`/ $(CFLAGS) -c inspect.c
	#ocamlfind opt -g  -package lazy-trie inspect.o main.ml -o $(OUT)
	ocamlfind opt -g  -S inspect.o myinspect.ml -o $(INSPECT)

clean:
	$(RM) *.cmo *.cmx *.cmi *.o *.a $(OUT) $(INSPECT)
