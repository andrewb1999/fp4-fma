//=========================================================================
// fp4_test.cpp
//=========================================================================

#include <math.h>
#include "fp4.hpp"

#include <iostream>
#include <fstream>

//--------------------------------------
// main function of TB
//--------------------------------------
int main(int argc, char **argv) {
  // Add actual test cases here
  fp4_type a = ap_uint<4>(1);
  fp4_type b = ap_uint<4>(1);
  fp4_type c = ap_uint<4>(1);
  fp4_type out = fma(a, b, c);
  
  if (out != 3) {
    std::cerr << out.to_int() << "\n";
    std::cerr << "FAILURE!\n";
  }
}
