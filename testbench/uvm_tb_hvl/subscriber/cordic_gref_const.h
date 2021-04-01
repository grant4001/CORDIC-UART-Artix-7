//
// File:        cordic_gref_const.h
// Author:      Grant Yu
// Date:        03/2021
// Description: Constants header file for golden reference C++ implementation of CORDIC-UART 
//

static const unsigned char POLY                = 0x9b;
static const unsigned char BYTE_HEADER         = 0x5a;
static const unsigned char CMD_SINGLE_TRANS    = 0xd1;
static const unsigned char CMD_BURST_TRANS     = 0xd2;
static const unsigned char CMD_DISABLE         = 0xe1;
static const unsigned char CMD_ENABLE          = 0xe2;
static const unsigned char CMD_ERR             = 0x01;

// K
static const long long K[48] = {
    0x2d413cccfe78,
    0x287a26c49092,
    0x2744c374daf4,
    0x26f72283bd68,
    0x26e3b58305de,
    0x26ded9f57b2c,
    0x26dda30d3e50,
    0x26dd5552e164,
    0x26dd41e4454e,
    0x26dd3d089dfa,
    0x26dd3bd1b421,
    0x26dd3b83f9aa,
    0x26dd3b708b0c,
    0x26dd3b6baf65,
    0x26dd3b6a787b,
    0x26dd3b6a2ac0,
    0x26dd3b6a1752,
    0x26dd3b6a1276,
    0x26dd3b6a113f,
    0x26dd3b6a10f2,
    0x26dd3b6a10de,
    0x26dd3b6a10d9,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8,
    0x26dd3b6a10d8
};

// ARCTAN LUT

static const long long ATAN[48] = {
    0x3243f6a8885a,
    0x1dac670561bb,
    0x0fadbafc9640,
    0x07f56ea6ab0c,
    0x03feab76e5a0,
    0x01ffd55bba97,
    0x00fffaaadddc,
    0x007fff5556ef,
    0x003fffeaaab7,
    0x001ffffd5556,
    0x000fffffaaab,
    0x0007fffff555,
    0x0003fffffeab,
    0x0001ffffffd5,
    0x0000fffffffb,
    0x00007fffffff,
    0x000040000000,
    0x000020000000,
    0x000010000000,
    0x000008000000,
    0x000004000000,
    0x000002000000,
    0x000001000000,
    0x000000800000,
    0x000000400000,
    0x000000200000,
    0x000000100000,
    0x000000080000,
    0x000000040000,
    0x000000020000,
    0x000000010000,
    0x000000008000,
    0x000000004000,
    0x000000002000,
    0x000000001000,
    0x000000000800,
    0x000000000400,
    0x000000000200,
    0x000000000100,
    0x000000000080,
    0x000000000040,
    0x000000000020,
    0x000000000010,
    0x000000000008,
    0x000000000004,
    0x000000000002,
    0x000000000001,
    0x000000000001
};

// PI multiples

static const long long PI_DIV_2 		= 0x1921fb54442d;
static const long long PI 				= 0x3243f6a8885a;
static const long long PI_MULT_3_DIV_2  = 0x4b65f1fccc87;
static const long long PI_MULT_2 		= 0x6487ed5110b4;

//