//
// File:        cordic_gref.cpp
// Author:      Grant Yu
// Date:        03/2021
// Description: Golden reference C++ implementation of CORDIC-UART 
//

#include "svdpi.h"
#include <stdio.h>
#include <iostream>  
#include <bitset> 

#include "cordic_gref_const.h"

/* Calculates odd parity of a byte */
bool parity_calc(unsigned char i_data_frame) {
    bool parity = 1;
    for (int i = 0; i < 8; i++) {
        parity ^= (i_data_frame & 1);
        i_data_frame >>= 1;
    }
    return parity;
}

/* Extracts frames from a UART packet */
void extract_packet(short int packet, bool* start_bit, unsigned char* data_frame,
                    bool* parity_bit, bool* stop_bit) {
    *start_bit   = (packet & 1);
    *data_frame  = (packet >> 1)  & 0xff;
    *parity_bit  = (packet >> 9)  & 1;
    *stop_bit    = (packet >> 10) & 1;
    return;    
}

/* Sets frames of a UART packet */
void set_packet(short int* packet, unsigned char data_frame) {
    *packet &= (~1);
    *packet |= (data_frame << 1);
    *packet |= (parity_calc(data_frame) << 9);
    *packet |= (1 << 10);
    return;
}

/* Calculates the CRC-8 using a shift register implementation */
void crc_8_calc(unsigned char* crc_8, unsigned char i_byte) {
    (*crc_8) ^= i_byte;
    //std::cout << "crc_8 after xor is: "  << std::bitset<8>(+(*crc_8)) << std::endl;
    for (int i = 0; i < 8; i++) {
        //std::cout << "crc_8 masked is: "  << std::bitset<16>(+((*crc_8) >> 7)) << std::endl;
        if ((*crc_8) >> 7) {
            (*crc_8) = ((*crc_8) << 1) ^ POLY;
            //std::cout << "MSB set. crc_8 is: "  << std::bitset<8>(+(*crc_8)) << std::endl;
        } else {
            (*crc_8) = ((*crc_8) << 1);
            //std::cout << "MSB not set. crc_8 is: "  << std::bitset<8>(+(*crc_8)) << std::endl;
        }
    }
}

/* CORDIC model */
void cordic_sincos(long long* theta, long long* x, long long* y) {
    
    /*
    std::cout << "Starting cordic C++ golden ref..." << std::endl;
    std::cout << "Theta input is " << std::hex << "0x" << *theta << std::endl;
    */

    long long z;
    z =     ((*theta) > PI_MULT_3_DIV_2)                                  ? (*theta) - PI_MULT_2    :
            ((*theta) > PI_DIV_2          && (*theta) <= PI_MULT_3_DIV_2) ? (*theta) - PI           :
            ((*theta) > -PI_MULT_3_DIV_2  && (*theta) <= -PI_DIV_2)       ? (*theta) + PI           :
            ((*theta) <= -PI_MULT_3_DIV_2)                                ? (*theta) + PI_MULT_2    :
            (*theta);
    z <<= 2;

    bool sign;
    sign =  ((*theta) > PI_MULT_3_DIV_2)                                  ? 0 :
            ((*theta) > PI_DIV_2          && (*theta) <= PI_MULT_3_DIV_2) ? 1 :
            ((*theta) > -PI_MULT_3_DIV_2  && (*theta) <= -PI_DIV_2)       ? 1 :
            ((*theta) <= -PI_MULT_3_DIV_2)                                ? 0 :
            0;

    /*
    std::cout << "Sign corrected is " << std::hex << "0x" << sign << std::endl;
    */

    (*x) = K[47];
    (*y) = 0;

    /*
    std::cout << "x_0 is " << std::hex << "0x" << (*x) << std::endl;
    std::cout << "y_0 is " << std::hex << "0x" << (*y) << std::endl;
    std::cout << "z_0 is " << std::hex << "0x" <<    z << std::endl;
    */

    long long dx, dy, dz;
    for (int i = 0; i <= 47; i++) {
        dx = (z < 0) ? ((*y) >> i)    : ((-(*y)) >> i);
        dy = (z < 0) ? ((-(*x)) >> i) :    ((*x) >> i);
        dz = (z < 0) ?      ATAN[i] :     -ATAN[i];
        (*x) += dx;
        (*y) += dy;
        z    += dz;

        /*
        std::cout << "Iteration " << i << ":" << std::endl;
        std::cout << "x = " << std::hex << "0x" << (*x) << std::endl;
        std::cout << "y = " << std::hex << "0x" << (*y) << std::endl;
        std::cout << "z = " << std::hex << "0x" <<    z << std::endl;
        std::cout << std::endl;
        std::cout << "dx = " << std::hex << "0x" << dx << std::endl;
        std::cout << "dy = " << std::hex << "0x" << dy << std::endl;
        std::cout << "dz = " << std::hex << "0x" << dz << std::endl;
        std::cout << std::endl;
        std::cout << std::endl;
        */
    }
    
    if (sign) {
        (*x) = -(*x);
        (*y) = -(*y);
    }

    /*
    std::cout << "x final is " << std::hex << "0x" << (*x) << std::endl;
    std::cout << "y final is " << std::hex << "0x" << (*y) << std::endl;
    std::cout << "z final is " << std::hex << "0x" <<    z << std::endl;
    */

    return;
}
 
/* SystemVerilog exported C++ function */
extern "C" void cordic_gref(const short int     i_header,
                            const short int     i_cmd, 
                            const short int     i_burst_cnt, 
                            const short int*    i_theta,
                            const short int     i_crc_8,
                            char*               disabled,           
                            short int*          o_header,
                            short int*          o_cmd, 
                            short int*          o_burst_cnt,
                            short int*          o_cos_theta,
                            short int*          o_sin_theta,
                            short int*          o_crc_8 ) 
{
    unsigned char crc_8_calculated = 0, header = 0, cmd = 0, burst_cnt = 0, crc_8 = 0; 
    bool start = 0, parity = 0, stop = 0;
    long long * theta = new long long[8];
    long long * cos_theta = new long long[8];
    long long * sin_theta = new long long[8];
    
    /* Initialize memory to 0 */
    memset(o_header,    0, sizeof(short int));
    memset(o_cmd,       0, sizeof(short int));
    memset(o_burst_cnt, 0, sizeof(short int));
    memset(o_cos_theta, 0, sizeof(short int)*6*8);
    memset(o_sin_theta, 0, sizeof(short int)*6*8);
    memset(o_crc_8,     0, sizeof(short int));
    memset(theta,       0, sizeof(long long)*8);
    memset(cos_theta,   0, sizeof(long long)*8);
    memset(sin_theta,   0, sizeof(long long)*8);
    
    /* Header byte */
    extract_packet(i_header, &start, &header, &parity, &stop);
    //std::cout << "Header: " <<  std::hex << +header << std::endl;
    crc_8_calc(&crc_8_calculated, header);
    //std::cout << "crc after header is: " <<  std::hex << +crc_8_calculated << std::endl;
    if (!(!start && (header == BYTE_HEADER) && (parity_calc(header) == parity) && stop)) {
        std::cout << "Error detected when extracting header byte." << std::endl;
        crc_8_calculated = 0;
        set_packet(o_header, BYTE_HEADER);
        crc_8_calc(&crc_8_calculated, *o_header);
        set_packet(o_cmd, CMD_ERR);
        crc_8_calc(&crc_8_calculated, *o_cmd);
        set_packet(o_crc_8, crc_8_calculated);
        delete[] theta;
        delete[] cos_theta;
        delete[] sin_theta;
        return;
    }
   
    /* Cmd byte */
    extract_packet(i_cmd, &start, &cmd, &parity, &stop);
    //std::cout << "Cmd: " <<  std::hex << +cmd << std::endl;
    crc_8_calc(&crc_8_calculated, cmd);
    //std::cout << "crc after cmd is: "  << std::hex <<  +crc_8_calculated << std::endl;
    if (!(!start && (cmd == CMD_SINGLE_TRANS || cmd == CMD_BURST_TRANS || cmd == CMD_DISABLE || cmd == CMD_ENABLE) 
        && (parity_calc(cmd) == parity) && stop)) {
            std::cout << "Error detected when extracting cmd byte." << std::endl;
        crc_8_calculated = 0;
        set_packet(o_header, BYTE_HEADER);
        crc_8_calc(&crc_8_calculated, *o_header);
        set_packet(o_cmd, CMD_ERR);
        crc_8_calc(&crc_8_calculated, *o_cmd);
        set_packet(o_crc_8, crc_8_calculated);
        delete[] theta;
        delete[] cos_theta;
        delete[] sin_theta;
        return;
    }

    if (cmd == CMD_DISABLE) {

        /* CRC byte */
        extract_packet(i_crc_8, &start, &crc_8, &parity, &stop);
        //std::cout << "CRC-8: " <<  std::hex << +crc_8 << std::endl;
        crc_8_calc(&crc_8_calculated, crc_8);
        //std::cout << "crc after crc_8 is: " << std::hex << +crc_8_calculated << std::endl;
        if (!(!start && !crc_8_calculated && (parity_calc(crc_8) == parity) && stop)) {
            std::cout << "Error detected when extracting crc byte." << std::endl;
            crc_8_calculated = 0;
            set_packet(o_header, BYTE_HEADER);
            crc_8_calc(&crc_8_calculated, BYTE_HEADER);
            set_packet(o_cmd, CMD_ERR);
            crc_8_calc(&crc_8_calculated, CMD_ERR);
            set_packet(o_crc_8, crc_8_calculated);
            delete[] theta;
            delete[] cos_theta;
            delete[] sin_theta;
            return;
        }

        (*disabled) = 1;

        /* Construct output msg */
        crc_8_calculated = 0;
        set_packet(o_header, BYTE_HEADER);
        crc_8_calc(&crc_8_calculated, BYTE_HEADER);
        set_packet(o_cmd, CMD_DISABLE);
        crc_8_calc(&crc_8_calculated, CMD_DISABLE);
        set_packet(o_crc_8, crc_8_calculated);
        delete[] theta;
        delete[] cos_theta;
        delete[] sin_theta;
        return;
        
    } else if (cmd == CMD_ENABLE) {

        /* CRC byte */
        extract_packet(i_crc_8, &start, &crc_8, &parity, &stop);
        crc_8_calc(&crc_8_calculated, crc_8);
        //std::cout << "crc after crc_8 is: " << std::hex << +crc_8_calculated << std::endl;
        if (!(!start && !crc_8_calculated && (parity_calc(crc_8) == parity) && stop)) {
            std::cout << "Error detected when extracting crc byte." << std::endl;
            crc_8_calculated = 0;
            set_packet(o_header, BYTE_HEADER);
            crc_8_calc(&crc_8_calculated, BYTE_HEADER);
            set_packet(o_cmd, CMD_ERR);
            crc_8_calc(&crc_8_calculated, CMD_ERR);
            set_packet(o_crc_8, crc_8_calculated);
            delete[] theta;
            delete[] cos_theta;
            delete[] sin_theta;
            return;
        }

        (*disabled) = 0;

        /* Construct output msg */
        crc_8_calculated = 0;
        set_packet(o_header, BYTE_HEADER);
        crc_8_calc(&crc_8_calculated, BYTE_HEADER);
        set_packet(o_cmd, CMD_ENABLE);
        crc_8_calc(&crc_8_calculated, CMD_ENABLE);
        set_packet(o_crc_8, crc_8_calculated);
        delete[] theta;
        delete[] cos_theta;
        delete[] sin_theta;
        return;
        
    } else if (cmd == CMD_SINGLE_TRANS) {
        
        /* Theta bytes */
        for (int i = 0; i < 6; i++) {
            extract_packet(*(i_theta+i), &start, ((unsigned char*)theta)+i, &parity, &stop);
            crc_8_calc(&crc_8_calculated, *(((unsigned char*)theta)+i) );
            if (!(!start && (parity_calc( *(((unsigned char*)theta)+i) ) == parity) && stop)) {
                std::cout << "Error detected when extracting theta byte." << std::endl;
                crc_8_calculated = 0;
                set_packet(o_header, BYTE_HEADER);
                crc_8_calc(&crc_8_calculated, BYTE_HEADER);
                set_packet(o_cmd, CMD_ERR);
                crc_8_calc(&crc_8_calculated, CMD_ERR);
                set_packet(o_crc_8, crc_8_calculated);
                delete[] theta;
                delete[] cos_theta;
                delete[] sin_theta;
                return;
            }
        }
        
        /* std::cout << "Theta is: " << std::hex << *theta << std::endl;
        */
        
        /* CRC byte */
        extract_packet(i_crc_8, &start, &crc_8, &parity, &stop);
        crc_8_calc(&crc_8_calculated, crc_8);
        if (!(!start && !crc_8_calculated && (parity_calc(crc_8) == parity) && stop)) {
            std::cout << "Error detected when extracting crc byte." << std::endl;
            crc_8_calculated = 0;
            set_packet(o_header, BYTE_HEADER);
            crc_8_calc(&crc_8_calculated, BYTE_HEADER);
            set_packet(o_cmd, CMD_ERR);
            crc_8_calc(&crc_8_calculated, CMD_ERR);
            set_packet(o_crc_8, crc_8_calculated);
            delete[] theta;
            delete[] cos_theta;
            delete[] sin_theta;
            return;
        }

        /* Sign extension */
        (*theta) |= ( (((*theta) >> 47) & 1UL) ? 0xFFFF000000000000 : 0 );
            
        /* CORDIC call */
        cordic_sincos(theta, cos_theta, sin_theta);
        
        /* Construct output msg */
        if (!(*disabled)) {
            crc_8_calculated = 0;
            set_packet(o_header, BYTE_HEADER);
            crc_8_calc(&crc_8_calculated, BYTE_HEADER);
            set_packet(o_cmd, CMD_SINGLE_TRANS);
            crc_8_calc(&crc_8_calculated, CMD_SINGLE_TRANS);
            for (int i = 0; i < 6; i++) {
                set_packet(o_cos_theta+i, *(((unsigned char*)cos_theta)+i));
                crc_8_calc(&crc_8_calculated, *(((unsigned char*)cos_theta)+i));
            }
            for (int i = 0; i < 6; i++) {
                set_packet(o_sin_theta+i, *(((unsigned char*)sin_theta)+i));
                crc_8_calc(&crc_8_calculated, *(((unsigned char*)sin_theta)+i));
            }
            set_packet(o_crc_8, crc_8_calculated);
        }
        delete[] theta;
        delete[] cos_theta;
        delete[] sin_theta;
        return;
        
    } else if (cmd == CMD_BURST_TRANS) {

        /* Burst cnt byte */
        extract_packet(i_burst_cnt, &start, &burst_cnt, &parity, &stop);
        crc_8_calc(&crc_8_calculated, burst_cnt);
        if (!(!start && (burst_cnt >= 1 && burst_cnt <= 8) && (parity_calc(burst_cnt) == parity) && stop)) {
            std::cout << "Error detected when extracting burst_cnt byte." << std::endl;
            crc_8_calculated = 0;
            set_packet(o_header, BYTE_HEADER);
            crc_8_calc(&crc_8_calculated, *o_header);
            set_packet(o_cmd, CMD_ERR);
            crc_8_calc(&crc_8_calculated, *o_cmd);
            set_packet(o_crc_8, crc_8_calculated);
            delete[] theta;
            delete[] cos_theta;
            delete[] sin_theta;
            return;
        }

        /* Theta bytes */
        for (int j = 0; j < burst_cnt; j++) {
            for (int i = 0; i < 6; i++) {
                extract_packet( *(i_theta + i + 6*j) , &start , ((unsigned char*)theta) + i + 8*j , &parity , &stop );
                crc_8_calc(&crc_8_calculated, *(((unsigned char*)theta) + i + 8*j) );
                if (!(!start && (parity_calc( *(((unsigned char*)theta) + i + 8*j) ) == parity) && stop)) {
                    std::cout << "Error detected when extracting theta byte." << std::endl;
                    crc_8_calculated = 0;
                    set_packet(o_header, BYTE_HEADER);
                    crc_8_calc(&crc_8_calculated, BYTE_HEADER);
                    set_packet(o_cmd, CMD_ERR);
                    crc_8_calc(&crc_8_calculated, CMD_ERR);
                    set_packet(o_crc_8, crc_8_calculated);
                    delete[] theta;
                    delete[] cos_theta;
                    delete[] sin_theta;
                    return;
                }
            }
        }

       /* CRC byte */
        extract_packet(i_crc_8, &start, &crc_8, &parity, &stop);
        crc_8_calc(&crc_8_calculated, crc_8);
        if (!(!start && !crc_8_calculated && (parity_calc(crc_8) == parity) && stop)) {
            std::cout << "Error detected when extracting crc byte." << std::endl;
            crc_8_calculated = 0;
            set_packet(o_header, BYTE_HEADER);
            crc_8_calc(&crc_8_calculated, BYTE_HEADER);
            set_packet(o_cmd, CMD_ERR);
            crc_8_calc(&crc_8_calculated, CMD_ERR);
            set_packet(o_crc_8, crc_8_calculated);
            delete[] theta;
            delete[] cos_theta;
            delete[] sin_theta;
            return;
        }

        /* Sign extension */
        for (int i = 0; i < burst_cnt; i++)
            (*(theta + i)) |= ( (((*(theta + i)) >> 47) & 1UL) ? 0xFFFF000000000000 : 0 );

        /*
        for (int i = 0; i < 8; i++)
            std::cout << "Theta " << i << " is: " << std::hex << *(theta+i) << std::endl;
        */

        /* CORDIC call */
        for (int i = 0; i < burst_cnt; i++) 
            cordic_sincos(theta + i, cos_theta + i, sin_theta + i);

        /*
        for (int i = 0; i < 8; i++)
            std::cout << "Cos theta " << i << " is: " << std::hex << *(cos_theta+i) << std::endl;
        for (int i = 0; i < 8; i++)
            std::cout << "Sin theta " << i << " is: " << std::hex << *(sin_theta+i) << std::endl;
        */

        /* Construct output msg */
        if (!(*disabled)) {
            crc_8_calculated = 0;
            set_packet(o_header, BYTE_HEADER);
            crc_8_calc(&crc_8_calculated, BYTE_HEADER);
            set_packet(o_cmd, CMD_BURST_TRANS);
            crc_8_calc(&crc_8_calculated, CMD_BURST_TRANS);
            set_packet(o_burst_cnt, burst_cnt);
            crc_8_calc(&crc_8_calculated, burst_cnt);
            for (int j = 0; j < burst_cnt; j++) {
                for (int i = 0; i < 6; i++) {
                    set_packet(o_cos_theta + i + j*6, *(((unsigned char*)(cos_theta+j))+i) );
                    crc_8_calc(&crc_8_calculated, *(((unsigned char*)(cos_theta+j))+i) );
                }
                for (int i = 0; i < 6; i++) {
                    set_packet(o_sin_theta + i + j*6, *(((unsigned char*)(sin_theta+j))+i) );
                    crc_8_calc(&crc_8_calculated, *(((unsigned char*)(sin_theta+j))+i) );
                }
            }
            set_packet(o_crc_8, crc_8_calculated);
        }
        delete[] theta;
        delete[] cos_theta;
        delete[] sin_theta;
        return;
    }

}