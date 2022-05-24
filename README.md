# Design-Assignment-2-Design-of-a-Simple-8-bit-Processor

In this assignment, an 8-bit processor will be designed that contains eight registers and
performs eight different operations. Moreover, this design consists of an arithmetic and logical
operations module, data path, multiplexer, and control unit. All the listed components will be
liked together under the top module design.
-------------------------------------------------------------------------------------------------

First the main design was analyzed, and the block diagram of the top module as well, as shown
in Figure1. Thereafter the top module was split into a data path and control unit and within
each part the required modules were designed to implement the 8-bit processor, as shown in
Figure2,3. Furthermore, the 8-bit processor consists of 8 registers and is used to perform 8
different operations which are listed below:
1. Load
2. Mov
3. Add
4. Sub
5. And
6. Or
7. Xor
8. Store

- 8 operations means that the number of bits for opcode needed/ addresses are 3 as 2^3=8
- 8 Rigestors are used in this processor then the address of those rigestores consists of 3
bits and ranges from 000-111
