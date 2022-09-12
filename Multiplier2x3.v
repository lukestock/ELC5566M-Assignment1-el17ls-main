/* 2-Bit by 3-Bit Multiplier
 * -------------------------
 * By: Luke Stock 
 * SID: 201148579
 * Date: 13th February 2021
 *
 * Module Description:
 * -------------------
 * This module performs the multiplication of two input binary numbers - ie 'm x q = p'.
 * The input numbers are m and q, with bit widths of 2 and 3, respectively. 
 * The resultant ouput of the multiplation is p, a 5 bit width binary number. 
 * 
 * This is a top level design module that incoporates the submodules MultiplierFirstRow.v
 * (which are used exclusively in the first row) and MultiplierRemainingRow.v files (which
 * are used exclusively in all rows not in the first row).
 */
module Multiplier2x3 (
	 // Declare input and output ports 
    input  [1:0] m,
    input  [2:0] q,
    
    output [4:0] p
);
	 // Declare single-bit wires that we can use to interconnect the gates.
	 wire line1, line2, line3, line4, line5;
	 wire zeroWire = 1'b0; // wire with binary value of 0, used for initial cIn values without a preceding carry value
	 
	 // Instantiate gates to calculate lsb of output p 
	 and(p[0], m[0], q[0]);

//Instantiate submodules 
MultiplierFirstRow row1col1 (
	 .m (m[1:0] ), 
	 .q (q[1:0] ),
	 .cOut (line1 ),
	 .s (p[1])
);

MultiplierFirstRow row1col2(
	 .m (m[1] ), 
	 .q (q[1:0] ),
	 .cIn (line1),
	 .cOut (line2 ),
	 .s (line3)
);

MultiplierRemainRow row2col1 (
	 .m (m[0] ),
	 .q (q[2] ),
	 .pp (line3),
	 .cOut (line4 ),
	 .s (p[2] )
);

MultiplierRemainRow row2col2 (
	 .m (m[1] ),
	 .q (q[2] ),
	 .pp (line2),
	 .cOut (p[4] ),
	 .s (p[3] )
);

endmodule //End of module

