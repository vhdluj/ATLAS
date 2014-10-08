/*
 * CRC12Calc.cpp
 *
 *  Created on: 16.05.2014
 *      Author: seartz
 *      Description: Calculation of the 12 bit CRC value on a 128 bit word
 */

#include "CRC12Calc.h"

/**
 * reads lookup table from file "crc_lut.txt" which is needed for the CRC calculation
 */
CRC12Calc::CRC12Calc()
{
	lookuptable = new bitset<12>[256];

	ifstream reader;
	reader.open("crc_lut.txt", std::ofstream::in);

	int counter = 0;
	while(reader.good())
	{
		std::string line;
		getline(reader, line);
		if (line.size() > 0)
		{
			string lutValue = line.substr(0, 12);
			lookuptable[counter] = bitset<12>(lutValue);
//			std::cout<<lookuptable[counter]<<std::endl;
			counter++;
		}
	}

	reader.close();
}

CRC12Calc::~CRC12Calc()
{
	delete[] lookuptable;
}

/**
 * internally needed support function to copy bits from on bitset into anothe
 */
template<size_t n, size_t m> void CRC12Calc::copyBits(bitset<n> &target, bitset<m> &source, size_t posTarget, size_t posSource, size_t length)
{
	if ((posTarget + length <= n) && (posSource + length <= m))
	{
		for (int i=0;i<length;i++)
		{
			target[posTarget + i] = source[posSource + i];
		}
	} else
	{
		std::cout<<"warning, wrong position in writeBits(): "<<(posSource + length)<<", "<<(posTarget + length)<<std::endl;
	}
}

/**
 * access to the lookup table
 */
bitset<12> CRC12Calc::lookupCRC(bitset<8> key)
{
	return lookuptable[(int)key.to_ulong()];
}

/**
 * calculates a part of the CRC; used by getCRC12()
 */
bitset<12> CRC12Calc::getCRC12_part(bitset<32> DATA_in, int subtick_counter, bool &crc_valid, bitset<12> &p5)
{
	bitset<8> b0, b1, d0, d1;
	bitset<12> r0, r1, r2, r3, r4, r5, r6, r4_reg, r5_reg,p0,p1,p2,p3,p4,p3_reg,p4_reg;
	bitset<3> subtick_counter_reg;

	if (subtick_counter == 3)
	{
		r0 = 0;
	} else
	{
		r0 = p5;
	}

	if (subtick_counter == 0)
	{
		crc_valid = true;
	} else
	{
		crc_valid = false;
	}


	copyBits(b1, DATA_in, 0, 24, 8);
	copyBits(b0, DATA_in, 0, 16, 8);
	copyBits(d1, DATA_in, 0, 8, 8);
	copyBits(d0, DATA_in, 0, 0, 8);

	copyBits(r1, r0, 8, 0, 4);
	copyBits(r1, b1, 0, 0, 8);

	bitset<8> tmpr0;
	copyBits(tmpr0, r0, 0, 4, 8);
	r2 = lookupCRC(tmpr0);

	r3 = r1 ^ r2;

	copyBits(r4, r3, 8, 0, 4);
	copyBits(r4, b0, 0, 0, 8);

	bitset<8> tmpr3;
	copyBits(tmpr3, r3, 0, 4, 8);
	r5 = lookupCRC(tmpr3);

	r6 = r5 ^ r4;

	bitset<8> tmpr6;
	copyBits(tmpr6, r6, 0, 4, 8);
	p0 = lookupCRC(tmpr6);

	copyBits(p1, r6, 8, 0, 4);
	copyBits(p1, d1, 0, 0, 8);

	p2 = p0 ^ p1;

	bitset<8> tmpp2;
	copyBits(tmpp2, p2, 0, 4, 8);
	p3 = lookupCRC(tmpp2);

	copyBits(p4, p2, 8, 0, 4);
	copyBits(p4, d0, 0, 0, 8);

	p5 = p3 ^ p4;

	return p5;
}

/**
 * calculates the 12 bit CRC on a 128 bit word
 */
bitset<12> CRC12Calc::getCRC12(bitset<128> &dataSet128)
{
	bitset<12> crc;

	bitset<32> dataset32;
	bool crc_valid = false;
	bitset<12> p5;

	for (int i=3;i>=0;i--)
	{
		copyBits(dataset32, dataSet128, 0, i*32, 32);
		crc = getCRC12_part(dataset32, i, crc_valid, p5);
	}



	return crc;
}

/**
 * calculates the 12 bit CRC on a 128 bit word and sets the 12 LSB to the CRC value
 */
void CRC12Calc::addCRC12(bitset<128> &dataSet128)
{
	bitset<12> crc = getCRC12(dataSet128);

	// write crc in 12 least significant bits
	for (int i=0;i<12;i++)
	{
		dataSet128[i] = crc[i];
	}

	return;
}
