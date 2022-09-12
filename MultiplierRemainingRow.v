/* Remaining Row of Multiplier for the 2-Bit by 3-Bit Multiplier
 * -------------------------
 * By: Luke Stock 
 * SID: 201148579
 * Date: 13th February 2021
 *
 * Module Description:
 * -------------------
 * Submodule for remaining rows of multiplier for the 
 * 2-Bit by 3-Bit Multiplier.
 * This submodule is the only module subsequently performed after the 
 * MultiplierFirstRow subsystem for all remaining rows in the 2x3 bit multiplication structure.
 * The input binary numbers are pp, m, q and cIn. All the inputs are 1 bit wide.
 * The output binary numbers are qOut, cOut, mOut and s. All outputs are 1 bit wide. 
 */
module MultiplierRemainRow (
	 // Declare input and output ports 
    input  pp,
    input  m,
    input  q,
    input  cIn,
    
    output qOut,
    output cOut,
    output mOut,
    output s
);
	 // Declare single-bit wires that we can use to interconnect the gates.
	 wire A, wire1, wire2, wire3;
	 
	 // Assign the carry of inputs directly to the output of the module
	 assign mOut = m;
	 assign qOut = q;
	 
	 // Instantiate gates to calculate 1-Bit Full Adder inputs
	 and(A, m, q);
	 
	 //Instantiate gates to calculate sum output for 1-Bit Full Adder
	 xor(wire1, A, pp);
	 xor(s, wire1, cIn);
	 //Instantiate gates to calculate carry (cOut) output for 1-Bit Full Adder
	 and(wire2, A, pp);
	 and(wire3, cIn, wire1);
	 or(cOut, wire2, wire3);
	

endmodule //End of module
