#include "computor.h"

void    ft_read_poly(char *seq)
{
    int i;

    i = -1;
    while (seq[++i])
        ft_putchar(seq[i]);
}

int     main(int ac, char **av)
{
    (void)av;
    if (ac == 2)
        printf("%d\n", ft_square(ft_atoi(av[1])));
    else
        ft_putstr("donc la tu marches plus saloperie");
}