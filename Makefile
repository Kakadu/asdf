OUT=main.exe
all:
	cc -I `ocamlc -where`/ -c inspect.c
	ocamlfind opt -g  inspect.o main.ml -o $(OUT)

clean:
	$(RM) *.cmo *.cmx *.cmi *.o *.a $(OUT)
