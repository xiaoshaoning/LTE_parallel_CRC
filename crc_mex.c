#include "mex.h"

void mexFunction(int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[])
{
  int index, crc_length, crc_type, input_bits_size;
  double * input = mxGetPr(prhs[0]);
  double * crc_result;
  int * crc;
  int * input_bits;

  input_bits_size = (int) mxGetScalar(prhs[1]);
  crc_type = (int) mxGetScalar(prhs[2]);

  switch(crc_type)
  {
    case 0:
      crc_length = 8;
      break;
    case 1:
      crc_length = 16;
      break;
    default:
      crc_length = 24;
  }

  input_bits = (int *) malloc(sizeof(int) * input_bits_size);

  for(index=0; index < input_bits_size; index++)
  {
    (input[index] > 0)? (input_bits[index] = 1):(input_bits[index] = 0);
  }


  plhs[0] = mxCreateDoubleMatrix(1, crc_length, mxREAL);
  
  crc_result = mxGetPr(plhs[0]);

  crc = (int *) malloc(sizeof(int) * crc_length);

  parallel_crc_calculate(crc, input_bits, input_bits_size, crc_type);

  for(index = 0; index < crc_length; index++)
    crc_result[index] = crc[index];

  free(input_bits);
}