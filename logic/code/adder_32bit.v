// source: https://www.fpga4student.com/2017/07/n-bit-adder-design-in-verilog.html
`timescale 1ns / 1ns

module half_adder(x, y, s, c);
  input x, y;
  output s, c;
  assign s = x ^ y;
  assign c = x & y;
endmodule

module full_adder(x, y, c_in, s, c_out);
  input x, y, c_in;
  output s, c_out;
  assign s = (x ^ y) ^ c_in;
  assign c_out = (y & c_in) | (x & y) | (x & c_in);
endmodule

module adder_32bit(num1, num2, result);
  parameter n = 32;
  input [n - 1 : 0] num1,num2;
  output [n - 1 : 0] result;
  wire  carry_out;
  wire [n - 1 : 0] carry;

  genvar i;
  generate 
    for(i = 0; i < n; i = i + 1)
      begin: generate_N_bit_Adder
        if(i==0) 
          half_adder f(num1[0],num2[0],result[0],carry[0]);
        else
          full_adder f(num1[i],num2[i],carry[i-1],result[i],carry[i]);
      end
    assign carry_out = carry[n-1];
  endgenerate
endmodule 