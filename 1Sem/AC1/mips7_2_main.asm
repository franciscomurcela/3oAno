char *strrev(char *);
int main(void)
{
 static char str[]="ITED - orievA ed edadisrevinU";

 print_string( strrev(str) );
 return 0; }
 
 	.data
 str:	.asciiz "ITED - orievA ed edadisrevinU"
 	.eqv print_str,4
 	