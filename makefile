# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bebosson <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/12 17:38:05 by bebosson          #+#    #+#              #
#    Updated: 2021/08/12 18:46:35 by bebosson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BLACK   =       \033[30m
RED             =       \033[31m
GREEN   =       \033[32m
YELLOW  =       \033[33m
BLUE    =       \033[34m
PURPLE  =       \033[35m
TUR             =       \033[36m
WHITE   =       \033[37m
END             =       \033[0m

UP              =       \033[A
CUT     =       \033[K

#	project

NAME	=	computor

#	directories
SRCDIR	=	./srcs
INCDIR	=	./includes
OBJDIR	=	./obj

#	srcs / obj
SRC		=	main.c \
			tool_math.c

INC		=	computor.h

OBJ		=	$(addprefix $(OBJDIR)/,$(SRC:.c=.o))
HEADER  =	$(addprefix $(INCDIR)/,$(INC))

#	compiler
CC		=	gcc
CFLAGS	=	-Wall -Wextra -Werror

#	libs
FT		=	./libft/
FT_LIB	=	$(addprefix $(FT)/,libft.a)

all: obj $(FT_LIB) $(NAME)

obj:
	@mkdir -p $(OBJDIR)

$(OBJDIR)/%.o:$(SRCDIR)/%.c $(HEADER)
						@echo "${TUR}compiling [$@] ...${END}"
						@$(CC) $(CFLAGS) -I $(INCDIR) -c -o $@ $<
						@printf "$(UP)$(CUT)"

$(FT_LIB):
						@$(MAKE) -C $(FT)
						@echo "${GREEN}[LIBRARY COMPILED]${END}"

$(NAME):  $(OBJ) $(FT_LIB)
						@$(CC) $(CFLAGS) $(OBJ) $(FT_LIB) -o $@
						@echo "${GREEN}[$@ COMPILED]${END}"

clean:
						@/bin/rm -rf $(OBJDIR)
						@$(MAKE) -C $(FT) clean
						@echo "${PURPLE}[.o deleted]${END}"

fclean:         clean
						@/bin/rm -rf $(NAME)
						@$(MAKE) -C $(FT) fclean
						@echo "${RED}[$(NAME) deleted]${END}"
						@echo "${RED}[$(LIB) deleted]${END}"

re:				fclean all

.PHONY:			all clean fclean re
