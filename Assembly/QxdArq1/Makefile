NOME = main

all: $(NOME).o
	gcc -o $(NOME) $(NOME).o -no-pie
	./$(NOME)
	rm -f *.o
