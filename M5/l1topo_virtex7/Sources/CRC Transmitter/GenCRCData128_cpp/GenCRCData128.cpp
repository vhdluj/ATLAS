//============================================================================
// Name        : GenCRCData128.cpp
// Author      : Sebastian Artz
// Version     :
// Copyright   : 
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <bitset>
#include <stdlib.h>
#include <math.h>
#include "CRC12Calc.h"
using namespace std;

const bitset<8> K28_5 = bitset<8>(188);

//template<size_t n, size_t m> void copyBits(bitset<n> &target, bitset<m> &source, size_t posTarget, size_t posSource, size_t length)
//{
//	if ((posTarget + length <= n) && (posSource + length <= m))
//	{
//		for (int i=0;i<length;i++)
//		{
//			target[posTarget + i] = source[posSource + i];
//		}
//	} else
//	{
//		std::cout<<"warning, wrong position in writeBits(): "<<(posSource + length)<<", "<<(posTarget + length)<<std::endl;
//	}
//}

//static bitset<12> lookupCRC(bitset<8> key)
//{
//	bitset<12> data;
//
//	static bitset<12>lookuptable[256];
//
//	ifstream reader;
//	reader.open("crc_lut.txt", std::ofstream::in);
//
//	int counter = 0;
//	while(reader.good())
//	{
//		std::string line;
//		getline(reader, line);
//		if (line.size() > 0)
//		{
//			string lutValue = line.substr(0, 12);
//			lookuptable[counter] = bitset<12>(lutValue);
////			std::cout<<lookuptable[counter]<<std::endl;
//			counter++;
//		}
//	}
//
//	reader.close();
//
//
//	return lookuptable[(int)key.to_ulong()];
//}

bitset<128> getRandomData()
{
	bitset<128> tmpData(0);

	bool rnd;

	for (int i=0;i<128;i++)
	{
		rnd = (rand() > RAND_MAX/2);
		tmpData.set(i, rnd);
	}

	return tmpData;
}

//bitset<12> getCRC12_part(bitset<32> DATA_in, int subtick_counter, bool &crc_valid, bitset<12> &p5)
//{
//	bitset<8> b0, b1, d0, d1;
//	bitset<12> r0, r1, r2, r3, r4, r5, r6, r4_reg, r5_reg,p0,p1,p2,p3,p4,p3_reg,p4_reg;
//	bitset<3> subtick_counter_reg;
//
//	if (subtick_counter == 3)
//	{
//		r0 = 0;
//	} else
//	{
//		r0 = p5;
//	}
//
//	if (subtick_counter == 0)
//	{
//		crc_valid = true;
//	} else
//	{
//		crc_valid = false;
//	}
//
//
//	copyBits(b1, DATA_in, 0, 24, 8);
//	copyBits(b0, DATA_in, 0, 16, 8);
//	copyBits(d1, DATA_in, 0, 8, 8);
//	copyBits(d0, DATA_in, 0, 0, 8);
//
//	copyBits(r1, r0, 8, 0, 4);
//	copyBits(r1, b1, 0, 0, 8);
//
//	bitset<8> tmpr0;
//	copyBits(tmpr0, r0, 0, 4, 8);
//	r2 = lookupCRC(tmpr0);
//
//	r3 = r1 ^ r2;
//
//	copyBits(r4, r3, 8, 0, 4);
//	copyBits(r4, b0, 0, 0, 8);
//
//	bitset<8> tmpr3;
//	copyBits(tmpr3, r3, 0, 4, 8);
//	r5 = lookupCRC(tmpr3);
//
//	r6 = r5 ^ r4;
//
//	bitset<8> tmpr6;
//	copyBits(tmpr6, r6, 0, 4, 8);
//	p0 = lookupCRC(tmpr6);
//
//	copyBits(p1, r6, 8, 0, 4);
//	copyBits(p1, d1, 0, 0, 8);
//
//	p2 = p0 ^ p1;
//
//	bitset<8> tmpp2;
//	copyBits(tmpp2, p2, 0, 4, 8);
//	p3 = lookupCRC(tmpp2);
//
//	copyBits(p4, p2, 8, 0, 4);
//	copyBits(p4, d0, 0, 0, 8);
//
//	p5 = p3 ^ p4;
//
//	return p5;
//}

//bitset<12> getCRC12(bitset<128> &dataSet128)
//{
//	bitset<12> crc;
//
//	bitset<32> dataset32;
//	bool crc_valid = false;
//	bitset<12> p5;
//
//	for (int i=3;i>=0;i--)
//	{
//		copyBits(dataset32, dataSet128, 0, i*32, 32);
////		std::cout<<dataset32<<std::endl;
//		crc = getCRC12_part(dataset32, i, crc_valid, p5);
////		std::cout<<crc<<std::endl;
//	}
//
//
//
//	return crc;
//}

void generateCUEFile(string fileName)
{
	ofstream writer;
	CRC12Calc crcGen;
	int dataLines = 256;
	writer.open(fileName.c_str(), std::ofstream::out);

	writer << "memory_initialization_radix=2;" << std::endl;
	writer << "memory_initialization_vector=" << std::endl;

	for (int i=0;i<dataLines;i++)
	{
		bitset<128> tmpData(0);// = getRandomData();

		bitset<16> counterBitset(i % 16);

		// fill data with counter values
		for (int j=0; j<8;j++)
		{
			for (int k=0;k<16;k++)
			{
				tmpData[j*16+k] = counterBitset[k];
			}
		}

		// set last 12 bits to zero (crc region)
		for (int j=0; j<12;j++)
		{
			tmpData[j] = 0;
		}

		// insert zeroes for K28.5 word
		if (i == 0)
		{
			for (int j=0;j<8;j++)
			{
				tmpData[64+j] = K28_5[j];
			}
		}

		crcGen.addCRC12(tmpData);
		writer << tmpData <<","<< std::endl;
	}

	writer.close();
}

void testCRC(int maxIterationsCRCCheck)
{
	int crcErrCtr = 0;
	bitset<128> testBitSet;
	bitset<12> crcTest;
	CRC12Calc crcGen;

	for (int i=0;i<maxIterationsCRCCheck;i++)
	{
		if (i % 10000 == 0) std::cout<<std::endl<<std::flush;
		if (i % 100 == 0) std::cout<<"."<<std::flush;

		testBitSet = getRandomData();
//		testBitSet = bitset<128>(0);
//		bitset<16> counterBitset(i % 16);
//
//		// fill data with counter values
//		for (int j=0; j<8;j++)
//		{
//			for (int k=0;k<16;k++)
//			{
//				testBitSet[j*16+k] = counterBitset[k];
//			}
//		}

		for (int j=0; j<12;j++)
		{
			testBitSet[j] = 0;
		}

		crcGen.addCRC12(testBitSet);

		crcTest = crcGen.getCRC12(testBitSet);
		if (crcTest.to_ulong() != 0)
		{
			crcErrCtr++;
		}
	}
	std::cout<<std::endl;

	std::cout << "number of crc errors: " << crcErrCtr <<" ("<<maxIterationsCRCCheck<<" Iterations, = "
			<< (100.*crcErrCtr/maxIterationsCRCCheck)<<"% error)"<< std::endl;
}

int main()
{
	string fileName = "crc_data.coe";

	generateCUEFile(fileName);

	// chekc if crc calculation works
	testCRC(10000);



//	CRC12Calc crcGen;
//
//	bitset<128> testBitSet(3*4096);// = getRandomData();
//	bitset<8> test(0);
//
//	for (int i=0; i<12;i++)
//	{
//		testBitSet[i] = 0;
//	}
//	std::cout << testBitSet << std::endl;
//	bitset<12> crc1 = crcGen.getCRC12(testBitSet);
//	std::cout << "crc1: " << crc1 << std::endl;
//
//	// write crc in 12 least significant bits
//	for (int i=0;i<12;i++)
//	{
//		testBitSet[i] = crc1[i];
//	}
//
//	bitset<12> crc2 = crcGen.getCRC12(testBitSet);
//	crcGen.getCRC12(testBitSet);
//
//	std::cout << "crc2: " << crc2 << std::endl;


	std::cout << "file "+fileName+" generated!";
	return 0;
}
