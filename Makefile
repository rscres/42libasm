NAME= libasm.a

SRC= ft_strlen.s	\
	 ft_strcpy.s	\
	 ft_write.s		\
	 ft_strcmp.s	\
	 ft_read.s		\
	 ft_strdup.s

OBJ=$(SRC:.s=.o)

CC = gcc -Wall -Werror -Wextra -g
NASM = nasm -f elf64

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)

%.o: %.s
	$(NASM) $< -o $@

test: all
	$(CC) test.c $(NAME) -o test
	./test
	rm -f test 

clean:
	rm -f $(OBJ) libasm

fclean: clean
	rm -f $(NAME)

re: fclean all
