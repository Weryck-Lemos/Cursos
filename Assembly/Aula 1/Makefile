hello: hello.asm
	nasm -f elf64 hello.asm -o hello.o
	ld -s -o hello hello.o
	./hello

clean:
	rm -f hello.o hello
