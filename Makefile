
all:
	cc -I `ocamlc -where`/ -c inspect.c
	# ocamlfind opt -c main.ml
	#ocamlfind opt inspect.o Main.o -o main.exe
	ocamlfind opt -g  inspect.o main.ml

clean:
	$(RM) *.cmo *.cmx *.cmi *.o *.a
