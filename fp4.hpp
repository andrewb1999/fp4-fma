//=========================================================================
// fp4.hpp
//=========================================================================
// @brief: A header file that defines the key data types and parameters.

#ifndef __FP4_H__
#define __FP4_H__

// Include the Vivado HLS ap_int headers
#include "ap_int.h"

typedef ap_uint<4> fp4_type;

fp4_type fma(fp4_type a, fp4_type b, fp4_type c);

#endif
