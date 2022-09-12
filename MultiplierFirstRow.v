/* First Row of Multiplier for the 2-Bit by 3-Bit Multiplier
 * -------------------------
 * By: Luke Stock 
 * SID: 201148579
 * Date: 13th February 2021
 *
 * Module Description:
 * -------------------
 * Submodule for First Row of Multiplier for the 
 * 2-Bit by 3-Bit Multiplier
 * This submodule is used for the first row of modules in the top level design of the
 * 2x3 bit multiplication structure.
 * The input binary numbers are m, q and cIn. 
 * Inputs m and q have a bit width of 2. 
 * The output binary numbers are qOut, cOut, mOut and s. Outputs cOut, mOut 
 * and s are 1 bit wide. Output qOut has a bit width of 2.
 */
module MultiplierFirstRow (
	 // Declare input and output ports 
    input  [1:0] m,
    input  [1:0] q,
    input        cIn,
    
    output [1:0] qOut,
    output       cOut,
    output       mOut,
    output       s
);
	 // Declare single-bit wires that we can use to interconnect the gates.
	 wire a, b, link1, link2, link3;
	 
	 // Assign the carry of inputs directly to the output of the module
	 assign mOut = m[0];
	 assign qOut = q;
	 
	 // Instantiate gates to calculate 1-Bit Full Adder inputs
	 and(a, m[0], q[1]);
	 and(b, m[1], q[0]);	 
	 
	 //Instantiate gates to calculate sum output for 1-Bit Full Adder
	 xor(link1, a, b);
	 xor(s, link1, cIn);
	 //Instantiate gates to calculate carry (cOut) output for 1-Bit Full Adder
	 and(link2, a, b);
	 and(link3, cIn, link1);
	 or(cOut, link2, link3);

endmodule //End of module
