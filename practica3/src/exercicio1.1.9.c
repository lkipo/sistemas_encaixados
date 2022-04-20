char str[] = "hello";
int len = 0;
char *p = str;

int main(void)
{
	for( ; ; )
	{
		if (*p == '\0')
		{
			break;
		}
		p++;
		len++;
	}
}
