CC = cc

CFLAGS = -Wall -Wextra -Werror

NAME = cub3d

NAME_B = cub3d_bonus

UNAME = $(shell uname -s)

CFILES = main.c \
	./mandatory/tools/tools_00.c \
	./mandatory/tools/tools_01.c \
	./mandatory/parse/get_map.c \
	./mandatory/tools/get_next_line.c \
	./mandatory/parse/map_element_00.c \
	./mandatory/parse/check_map.c \
	./mandatory/parse/check_color.c \
	./mandatory/rayCasting/ray_calculation.c \
	./mandatory/rayCasting/player_direction.c \
	./mandatory/rayCasting/screen.c \
	./mandatory/rayCasting/movement_rotate.c \
	./mandatory/rayCasting/hook_keys.c

CFILES_bonus = main.c \
	./bonus/tools/tools_00_bonus.c \
	./bonus/tools/tools_01_bonus.c \
	./bonus/parse/get_map_bonus.c \
	./bonus/tools/get_next_line_bonus.c \
	./bonus/parse/map_element_00_bonus.c \
	./bonus/parse/check_map_bonus.c \
	./bonus/parse/check_color_bonus.c \
	./bonus/rayCasting/ray_calculation_bonus.c \
	./bonus/rayCasting/player_direction_bonus.c \
	./bonus/rayCasting/screen_bonus.c \
	./bonus/rayCasting/movement_rotate_bonus.c \
	./bonus/rayCasting/hook_keys_bonus.c


OFILES = $(CFILES:.c=.o)

OFILES_bonus = $(CFILES_bonus:.c=.o)

ifeq ($(UNAME), Darwin)
	MLXFLAGS =  -O3 -lmlx -framework OpenGL -framework AppKit -lz mandatory/minilibx_opengl_20191021/libmlx.a
endif

ifeq ($(UNAME), Linux)
	MLXFLAGS = -lmlx -lXext -lX1
endif

all : $(NAME)

$(NAME) : $(OFILES)
	@${CC} -fsanitize=address $^ -o $@ ${MLXFLAGS}

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

bonus : $(OFILES_bonus)
	@${CC} -fsanitize=address $^ -o ${NAME_B} ${MLXFLAGS}

clean :
	@rm -rf ${OFILES} $(OFILES_bonus)

fclean : clean
	@rm -rf ${NAME} ${NAME_B}

re : fclean all

.PHONY : all clean fclean re bonus