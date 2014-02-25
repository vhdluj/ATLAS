//mzHAL - version: 1.0
//author: Christian Kahra - Institute for Physics, Johannes Gutenberg University Mainz, Germany

#pragma once

#include <string>
#include <iostream>
#include <cstdio>
#include <unistd.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>


class IPBus{
	public:
		IPBus();
		int Communicate(unsigned char* sbuff, int sbytes, unsigned char* rbuff, int rbytes);
		int write(unsigned int addr, unsigned char* sdata, unsigned int words);
		int read(unsigned int addr, unsigned char* rdata, unsigned int words);
		void status();
	private:
		int sock, port;
		std::string ip;
		struct sockaddr_in sckadd;
		fd_set readfd, testfd;
		struct timeval timeout;
		unsigned char buff[1500];
		unsigned char statusbuffer[64];
		union BytesOfInteger{unsigned int i; unsigned char c[4];} BoI; 
};
