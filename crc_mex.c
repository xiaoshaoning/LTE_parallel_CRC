#include "mex.h"
#include <string.h>

void mexFunction(int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[])
{
  int index, crc_length, crc_type_1, input_bits_size;
  double * input = mxGetPr(prhs[0]);
  double * crc_result;
  int * crc;
  int * input_bits;
  
  char * crc_type;

  /* input_bits_size = (int) mxGetScalar(prhs[1]); */
  input_bits_size = mxGetN(prhs[0]);
  
  crc_type = mxArrayToString(prhs[1]);

  if (strcmp(crc_type, "8") == 0)
  {
      crc_type_1 = 0;
      crc_length = 8;
  }
  else
  {
    if (strcmp(crc_type, "16") == 0)
    {
       crc_type_1 = 1;
       crc_length = 16;
    }
    else
    {
      if ((strcmp(crc_type, "24a") == 0) || (strcmp(crc_type, "24A") == 0))
      {
        crc_type_1 = 2;
        crc_length = 24;
      }
      else
      {
        crc_type_1 = 3;
        crc_length = 24;
      }
    }
  }
  
  mxFree(crc_type);
  
  input_bits = (int *) malloc(sizeof(int) * input_bits_size);

  for(index=0; index < input_bits_size; index++)
  {
    (input[index] > 0)? (input_bits[index] = 1):(input_bits[index] = 0);
  }

  plhs[0] = mxCreateDoubleMatrix(1, crc_length, mxREAL);
  
  crc_result = mxGetPr(plhs[0]);

  crc = (int *) malloc(sizeof(int) * crc_length);

  parallel_crc_calculate(crc, input_bits, input_bits_size, crc_type_1);

  for(index = 0; index < crc_length; index++)
    crc_result[index] = crc[index];

  free(input_bits);
}