/*
 * CRC12Calc.h
 *
 *  Created on: 16.05.2014
 *      Author: seartz
 */
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <bitset>
#include <stdlib.h>
#include <math.h>
using namespace std;

#ifndef CRC12CALC_H_
#define CRC12CALC_H_

class CRC12Calc {
public:
	CRC12Calc();
	virtual ~CRC12Calc();

	private:
	bitset<12>* lookuptable;
	bitset<12> getCRC12_part(bitset<32> DATA_in, int subtick_counter, bool &crc_valid, bitset<12> &p5);
	bitset<12> lookupCRC(bitset<8> key);
	template<size_t n, size_t m> void copyBits(bitset<n> &target, bitset<m> &source, size_t posTarget, size_t posSource, size_t length);

	public:
	bitset<12> getCRC12(bitset<128> &dataSet128);
	void addCRC12(bitset<128> &dataSet128);
};

#endif /* CRC12CALC_H_ */
