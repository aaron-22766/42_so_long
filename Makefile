# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arabenst <arabenst@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/14 17:40:26 by arabenst          #+#    #+#              #
#    Updated: 2023/02/06 16:51:47 by arabenst         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	so_long
BON_NAME	=	so_long_bonus

SRCDIR		=	./src
BONDIR		=	./bonus
OBJDIR		=	./obj
BONOBJDIR	=	./bonus_obj
LIBDIR		=	./lib

SRCS		=	$(wildcard $(SRCDIR)/*.c)
OBJS		=	$(addprefix $(OBJDIR)/,$(notdir $(SRCS:.c=.o)))
BONSRCS		=	$(wildcard $(BONDIR)/*.c)
BONOBJS		=	$(addprefix $(BONOBJDIR)/,$(notdir $(BONSRCS:.c=.o)))

CC			=	gcc
CFLAGS		=	-Wall -Werror -Wextra

RM			=	rm
RMFLAGS		=	-f

LIBFT_DIR	= $(LIBDIR)/libft
LIBFT_LIB	= libft.a
LIBFT		= $(LIBFT_DIR)/$(LIBFT_LIB)

MLX_DIR		= $(LIBDIR)/mlx
MLX_LIB		= libmlx42.a
MLX			= $(MLX_DIR)/$(MLX_LIB)

ARCS		=	$(LIBFT) $(MLX)
GLFW		=	-lglfw -L "$(HOME)/.brew/opt/glfw/lib/"

$(NAME): $(LIBFT) $(MLX) $(OBJS)
	$(CC) -o $(NAME) $(CFLAGS) $(OBJS) $(ARCS) $(GLFW)

$(BON_NAME): $(LIBFT) $(MLX) $(BONOBJS)
	$(CC) -o $(BON_NAME) $(CFLAGS) $(BONOBJS) $(ARCS) $(GLFW)

$(LIBFT): $(LIBDIR)
	git clone https://github.com/aaron-22766/libft.git $(LIBFT_DIR); make -C $(LIBFT_DIR)

$(MLX): $(LIBDIR)
	git clone https://github.com/codam-coding-college/MLX42 $(MLX_DIR); (cd $(MLX_DIR) && cmake -B . && make -j4)

$(LIBDIR):
	mkdir -p $(LIBDIR)
ifeq ($(shell which brew),$(HOME)/.brew/bin/brew)
	brew install glfw
	brew install cmake
else
	@echo "Please install brew!"
endif

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) -c $(CFLAGS) $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(BONOBJDIR)/%.o: $(BONDIR)/%.c | $(BONOBJDIR)
	$(CC) -c $(CFLAGS) $< -o $@

$(BONOBJDIR):
	mkdir -p $(BONOBJDIR)

all: $(NAME)

clean:
	$(RM) $(RMFLAGS) $(wildcard $(OBJDIR)/*.o)
	$(RM) $(RMFLAGS) $(wildcard $(BONOBJDIR)/*.o)
	if [ -d $(OBJDIR) ]; then rm -Rf $(OBJDIR); fi
	if [ -d $(BONOBJDIR) ]; then rm -Rf $(BONOBJDIR); fi
	make -C $(LIBFT_DIR) clean
	make -C $(MLX_DIR) clean/fast

fclean: clean
	$(RM) $(RMFLAGS) $(NAME) $(BON_NAME)
	make -C $(LIBFT_DIR) fclean
	make -C $(MLX_DIR) clean

libclean: fclean
	$(RM) -R $(RMFLAGS) $(LIBDIR)
	if [ -d $(LIBDIR) ]; then $(RM) -R $(RMFLAGS) $(LIBDIR); fi

re: fclean all

reb: fclean bonus

bonus: $(BON_NAME)

testall: maps/invalid/* maps/valid/* | $(NAME)
	@for file in $^ ; do \
		echo "\nRUNNING: " $${file} ; \
		./$(NAME) $${file} ; \
	done
	@echo "\n\n\n\n\nEND OF TEST"

testall_bonus: maps/invalid_bonus/* maps/bonus/* | $(BON_NAME)
	@for file in $^ ; do \
		echo "\nRUNNING: " $${file} ; \
		./$(BON_NAME) $${file} ; \
	done
	@echo "\n\n\n\n\nEND OF TEST"

.PHONY: all clean fclean libclean re reb testall testall_bonus