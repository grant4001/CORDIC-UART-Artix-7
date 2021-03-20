`default_nettype none

package pkg_cordic_sincos;

// In this package, we have:
//  1. Look-up table for K values (rotation gain) as a function of iteration #
//  2. Look-uptable for arctan values as a function of iteration #
//  3. Values of pi/2, pi, 3pi/2, and 2pi

parameter MAX_STAGES = 48;
parameter MAX_D_WIDTH = 48;

// K look-up table (gain compensation value for a certain # of iters)
//
// The 2 MSBs are integer bits; rest are fractional.

parameter bit signed [MAX_D_WIDTH-1:0] K[0:MAX_STAGES-1] = {
    48'h2d413cccfe78,
    48'h287a26c49092,
    48'h2744c374daf4,
    48'h26f72283bd68,
    48'h26e3b58305de,
    48'h26ded9f57b2c,
    48'h26dda30d3e50,
    48'h26dd5552e164,
    48'h26dd41e4454e,
    48'h26dd3d089dfa,
    48'h26dd3bd1b421,
    48'h26dd3b83f9aa,
    48'h26dd3b708b0c,
    48'h26dd3b6baf65,
    48'h26dd3b6a787b,
    48'h26dd3b6a2ac0,
    48'h26dd3b6a1752,
    48'h26dd3b6a1276,
    48'h26dd3b6a113f,
    48'h26dd3b6a10f2,
    48'h26dd3b6a10de,
    48'h26dd3b6a10d9,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8,
    48'h26dd3b6a10d8
};

// Arctan lookup table
//
// The 2 MSBs are integer bits; rest are fractional

parameter bit signed [MAX_D_WIDTH-1:0] ATAN[0:MAX_STAGES-1] = {
    48'h3243f6a8885a,
    48'h1dac670561bb,
    48'h0fadbafc9640,
    48'h07f56ea6ab0c,
    48'h03feab76e5a0,
    48'h01ffd55bba97,
    48'h00fffaaadddc,
    48'h007fff5556ef,
    48'h003fffeaaab7,
    48'h001ffffd5556,
    48'h000fffffaaab,
    48'h0007fffff555,
    48'h0003fffffeab,
    48'h0001ffffffd5,
    48'h0000fffffffb,
    48'h00007fffffff,
    48'h000040000000,
    48'h000020000000,
    48'h000010000000,
    48'h000008000000,
    48'h000004000000,
    48'h000002000000,
    48'h000001000000,
    48'h000000800000,
    48'h000000400000,
    48'h000000200000,
    48'h000000100000,
    48'h000000080000,
    48'h000000040000,
    48'h000000020000,
    48'h000000010000,
    48'h000000008000,
    48'h000000004000,
    48'h000000002000,
    48'h000000001000,
    48'h000000000800,
    48'h000000000400,
    48'h000000000200,
    48'h000000000100,
    48'h000000000080,
    48'h000000000040,
    48'h000000000020,
    48'h000000000010,
    48'h000000000008,
    48'h000000000004,
    48'h000000000002,
    48'h000000000001,
    48'h000000000001
};

// Angle correction constants: pi/2, pi/ 3pi/2, 2pi, generated on MATLAB
parameter bit signed [MAX_D_WIDTH-1:0] PI_DIV_2         = 48'h1921fb54442d;
parameter bit signed [MAX_D_WIDTH-1:0] PI               = 48'h3243f6a8885a;
parameter bit signed [MAX_D_WIDTH-1:0] PI_MULT_3_DIV_2  = 48'h4b65f1fccc87;
parameter bit signed [MAX_D_WIDTH-1:0] PI_MULT_2        = 48'h6487ed5110b4;

// Rounding function
function bit signed [MAX_D_WIDTH-1:0] round ( input bit signed [MAX_D_WIDTH-1:0] input_val, input int BITS );
    if (BITS >= MAX_D_WIDTH) 
        return input_val;
    else
        return (input_val + (1 << (MAX_D_WIDTH - BITS - 1)));
endfunction

endpackage






  