# parallel LTE CRC calculation

A C implementation of the LTE CRC calculation which can be compiled to mex file under matlab.

The CRC algorithm is according to [A Painless Guide to CRC Error Detection Algorithms](http://www.repairfaq.org/filipg/LINK/F_crc_v3.html).

## Features
* LTE CRC 24A
* LTE CRC 24B
* LTE CRC 16
* LTE CRC 8

## Build in matlab

```
mex parallel_crc_calculate.c crc_mex.c
```
## Run in matlab

```
test_crc_mex
```

## Build in C execution

```
gcc test_crc.c parallel_crc_calculate.c -o test_crc
```

## Run

```
./test_crc
```

## Authors
The parallel LTE CRC calculation files except lte_calc_crc.m was written by Xiao, Shaoning. <xiaoshaoning@foxmail.com>

## Credit
The included matlab file lte_calc_crc.m is from [LTE-Cell-Scanner](https://github.com/JiaoXianjun/LTE-Cell-Scanner)
and its authors include Ben Wojtowicz and James Peroulas.

## License
All contributions by Xiao, Shaoning:
Copyright (c) 2017, Xiao, Shaoning.
All rights reserved.

All other contributions:
Copyright (c) 2017, the respective contributors.
All rights reserved.

Each contributor holds copyright over their respective contributions.

### The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
