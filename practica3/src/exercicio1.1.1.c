#include <stdint.h>

uint32_t x, y, z;


int main(void)
{
	x = 0x00000001;
	y = 0xFFFFFFFF;
	if (x > y)
	{
		z = 1;
	}
	else
	{
		z = 0;
	}
}
