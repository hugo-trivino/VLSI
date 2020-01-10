# Welcome to this VLSI Project

This project consisted on extending an 8-bit CPU into 32-bits. Of course due to delays difference in the carry logic in 32 vs 8-bits adder
made necessary to implement a different type of adder. In this case I implemented a lookahead adder. I also implemented a division instruction.

In this project I used **Verilog** (you can look into the computer organization repository to see VHDL)
and **CADENCE** for synthesis. I used ESP to do the formal equivalence, DRC and LVS for rules verifications and mapping to schematic.

## I wrote a simple assembler in python ( **`convert.py`** )to turn this specific assembly language into hex machine code.
## The `solution` folder has the `basic`, `divider`, and `lookahead' solutions for this project.
## The `intermediate_results_and_Libraries` have all sample documents produced by the synthesis process.

## See `final_report.pdf` for more details.

## Introduction (beggining of report)

During the first stage of this project I first synthesize an 8-bit CPU that supported 16-bit instructions, and
during the second stage I modify the original design in order to work with 32-bits registers instead of 8-bit.
The operations had to be modified to support 32-bits as well. The architecture of the carry-ripple adder
was modified since the delay produced by the serialization of carry-in to carry-out along a 32 full adders
was inefficient. For this process as I show later, I implemented a look-ahead adder architecture that was
significantly faster. The subtraction operation is deeply intertwined with the addition operation since it is
only an addition between a complementary representation of the sustained. The implementation of the
shift right and left consisted basically of the inclusion of a 8-bits shift and 16-bits in cascade from the 1,2,4
bits that were already implemented in the 8-bit CPU. The exclusive NOR and the AND implementations
were fairly straightforward since it was required only to extend the code bit by bit to 32. In order to
implement the jump if zero, I added all bits from the register to evaluate within a OR statement in order
to set the jz bit. The jump if not zero was not modified since it is calculated as a negation of the jz bit.
Finally, the most challenging implementation was to create an integer divider using only the functions that
were already implemented. I will go into details about the overall implementation in the sections to follow...
