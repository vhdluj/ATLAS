//mzHAL - version: 1.0
//author: Christian Kahra - Institute for Physics, Johannes Gutenberg University Mainz, Germany

#include "IPBus.h"

IPBus::IPBus(){
	int err_code;

	port=0xc351;
	ip="137.138.81.20";
//ip="192.168.0.131";

	sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);	
	
	sckadd.sin_family=AF_INET;
	sckadd.sin_port=htons(port);
	sckadd.sin_addr.s_addr=INADDR_ANY;

	         //BIND
	err_code = bind(sock,(struct sockaddr*)&sckadd, sizeof(sckadd));
	  if(err_code!=0){printf("IPBus constructor: Error in bind: %i\n",err_code); perror(NULL);}
	  else{
	    sckadd.sin_addr.s_addr=inet_addr(ip.c_str());
		     //CONNECT
	    err_code = connect(sock,(struct sockaddr*)&sckadd,sizeof(sckadd));
	      if(err_code!=0){printf("IPBus constructor: Error in connect: %i\n",err_code); perror(NULL);}

	    FD_ZERO(&readfd);
	    FD_SET(sock,&readfd);
	}
	
	for(int i=0; i<1500; ++i){buff[i]=0;}
	
}

//Communicate
/////////////////////////////////////////////////////////////////////////////////////////////

int IPBus::Communicate(unsigned char* sbuff, int sbytes, unsigned char* rbuff, int rbytes){
  int retval;

  retval = send(sock, sbuff, sbytes,0);

  testfd = readfd;
  timeout.tv_sec =1; timeout.tv_usec =0;

  retval = select(FD_SETSIZE, &testfd, (fd_set*)0, (fd_set*)0, &timeout);
    if(retval<0){
      printf("IPBus::Communicate: Error in select. return value=%i\n",retval); 
      return retval;
    }
    else if(retval==0){
      printf("IPBus::Communicate: Timeout in select\n"); 
      return 0;
    }

  retval = recv(sock, rbuff, rbytes, 0);
    if(retval != rbytes){
      printf("IPBus::Communicate: Unexpected bytes count received. Expected: %i bytes, Received: %i bytes\n",rbytes, retval);
	  printf("Showing the received bytes:\n");
      int row=0;
	  int col=0;
      while(4*row<retval){
		while(col<4 && 4*row+col<retval){
			printf("%02x ",rbuff[4*row+col]);
			++col;
		}
		printf("\n");
		++row;
	  }
      retval=-1;
    }

  return retval;
}



//write
/////////////////////////////////////////////////////////////////////////////////////////////

int IPBus::write(unsigned int addr, unsigned char* wdata , unsigned int words){
  int retval;

  if(words>0xFF){printf("IPBus::write: IPBus allows only 255 transactions in a burst. write has been called with words=%u\n", words); return -1;}
  
  buff[0]=0x20; buff[1]=0x00; buff[2]=0x00; buff[3]=0xf0; //IPBusHeader
  BoI.i=words;
  buff[4]=0x20; buff[5]=0x00; buff[6]=BoI.c[0]; buff[7]=0x1f; //writeHeader
  BoI.i=addr;
  buff[8]=BoI.c[3]; buff[9]=BoI.c[2]; buff[10]=BoI.c[1]; buff[11]=BoI.c[0]; //BaseAddress

  for(unsigned int b=0; b<4*words; ++b){buff[12+b]=wdata[b];}
  
  retval = Communicate(buff, 12+4*words, buff, 8);
  
  if(retval==8 and buff[7]!=0x10){
	printf("IPBus::write: Response on write-request has bad info-code. write was probably NOT successful. info-code=%u\n", (unsigned int) (buff[7] & 0xf));
	retval = -1;
  }

  return retval;
}

//read
/////////////////////////////////////////////////////////////////////////////////////////////

int IPBus::read(unsigned int addr, unsigned char* rdata, unsigned int words){
  int retval;
  
  if(words>0xFF){return -1;}
  buff[0]=0x20; buff[1]=0x00; buff[2]=0x00; buff[3]=0xf0; //IPBusHeader
  BoI.i=words;
  buff[4]=0x20; buff[5]=BoI.c[1]; buff[6]=BoI.c[0]; buff[7]=0x0f; //readHeader
  BoI.i=addr;
  buff[8]=BoI.c[3]; buff[9]=BoI.c[2]; buff[10]=BoI.c[1]; buff[11]=BoI.c[0]; //BaseAddress
    
  retval = Communicate(buff, 12, rdata, 8+4*words);
  
  if(retval==8+4*(int)words and rdata[7]!=0x00){
	printf("IPBus::read: Response on read-request has bad info-code. read was probably NOT successful. info-code=%u\n", (unsigned int) (buff[7] & 0xf));
	printf("%x\n",rdata[7]);
	retval = -1;
  }
  
  return retval;
}

//status
/////////////////////////////////////////////////////////////////////////////////////////////

void IPBus::status(){
	int returnvalue;
	
	buff[0]=0x20; buff[1]=0x00; buff[2]=0x00; buff[3]=0xf1;	//IPBusHeader(Status)
	for(int b=4; b<64; ++b){buff[b]=0;}
	
	printf("Request status packet...\n");
	returnvalue = Communicate(buff, 64, statusbuffer, 64);
	if(returnvalue!=64){printf("IPBus::status: Error in Communicate. return value=%i\n", returnvalue); return;}
	
	printf("Showing the 64 bytes of the received status packet:\n");
	for(int words=0; words<16; ++words){
		for(int b=0; b<4; ++b) { printf( "%02x ", statusbuffer[4*words+b] ); }
		printf("\n");
	}
	printf("\nDecoding of the status packet:\n");
	printf("\nIPBus Version: %u\n", (unsigned int) ((statusbuffer[0] & 0xf0)>>4));
	printf("Reserved (should be 0): %u\n", (unsigned int) (statusbuffer[0] & 0x0f));
	printf("Packet ID (should be 0): %u\n", (unsigned int) ( (statusbuffer[1]<<8) + statusbuffer[2]) );
	printf("Byte-order qualifier (should be 0xf): %#x\n", (unsigned int) ((statusbuffer[3] & 0xf0)>>4));
	for(int b=0; b<4; ++b){BoI.c[b] = statusbuffer[4+3-b];}
	printf("Maximum transmission unit (MTU) the firmware can handle: %u bytes\n", BoI.i);
	for(int b=0; b<4; ++b){BoI.c[b] = statusbuffer[8+3-b];}
	printf("Number of Response Buffers in the firmware: %u\n", BoI.i);
	printf("Next expected IPBus packet header: "); for(int b=0; b<4; ++b) { printf( "%02x ", statusbuffer[12+b] ); } printf("\n");
	printf("\nIncoming Traffic History: the last 16 Ethernet packets received by the firmware, beginning with the oldest:\n");
	for(int h=0; h<16; ++h){
		printf("Ethernet packet %i:", h);
		if(statusbuffer[16+h]&0x80){printf("\tFailed CRC flag\n");}
		if(statusbuffer[16+h]&0x40){printf("\tDropped on receipt (i.e. no incoming buffer space available\n");}
		if((statusbuffer[16+h]&0x0f) == 0){printf("\tHard reset - all previous history cleared\n");}
		if((statusbuffer[16+h]&0x0f) == 1){printf("\tIPBus reset\n");}	
		if((statusbuffer[16+h]&0x0f) == 2){printf("\tIPBus control request packet\n");}
		if((statusbuffer[16+h]&0x0f) == 3){printf("\tIPBus status request packet\n");}
		if((statusbuffer[16+h]&0x0f) == 4){printf("\tIPBus resend request packet\n");}
		if((statusbuffer[16+h]&0x0f) == 5){printf("\tUnrecognized UDP packet to IPBus port (i.e. invalid header\n");}
		if((statusbuffer[16+h]&0x0f) == 6){printf("\tValid ping\n");}
		if((statusbuffer[16+h]&0x0f) == 7){printf("\tValid ARP\n");}
		if((statusbuffer[16+h]&0x0f) == 15){printf("\tOther non-broadcast Ethernet packet\n");}
	}
	printf("\nControl packet history: the last 4 received IPBus control packet headers, beginning with the oldest:\n");
	for(int p=0; p<4; ++p){
		printf("received control packet header %i: ", p);
		for(int b=0; b<4; ++b) { printf( "%02x ", statusbuffer[32+4*p+b] ); }
		printf("\n");
	}
	printf("\nControl packet history: the last 4 outgoing IPBus control packet headers, beginning with the oldest:\n");
	for(int p=0; p<4; ++p){
		printf("outgoing control packet header %i: ", p);
		for(int b=0; b<4; ++b) { printf( "%02x ", statusbuffer[48+4*p+b] ); }
		printf("\n");
	}
	printf("\n");
	return;
}
