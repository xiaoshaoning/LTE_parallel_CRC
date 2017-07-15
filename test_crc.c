/* an example to show how to use parallel_crc_calculate.c
 * compile: gcc test_crc.c parallel_crc_calculate.c -o test_crc
 * run: ./test_crc
 *  
 */

#include <stdio.h>
#include <stdlib.h>

int main()
{
  int input_bits[10] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

  int * crc = (int *) malloc(sizeof(int) * 24);

  int index;

  parallel_crc_calculate(crc, input_bits, 10, 2);

  for(index = 0; index < 24; index++)
    printf("%d", crc[index]);

  printf("\n");

  free(crc);

  return 0;
}
