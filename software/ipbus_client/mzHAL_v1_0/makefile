mzHAL: mzHAL.o IPBus.o
	g++ -o mzHAL mzHAL.o IPBus.o

mzHAL.o: mzHAL.cpp
	g++ -O2 -Wall -Wextra -pedantic -c mzHAL.cpp
	
IPBus.o: IPBus.cpp
	g++ -O2 -Wall -Wextra -pedantic -c IPBus.cpp

.PHONY: clean
clean:
	rm *.o