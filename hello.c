#include <stdio.h>

int
main(
	int		argc,
	char * *	argv
)
{
	puts( "Hello, World!" );
	while( argc-- )	{
		printf( "%s%c", *argv++, argc ? ' ' : '\n' );
	}
	return( 0 );
}
