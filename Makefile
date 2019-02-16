all: libcan.a

clean:
	rm *.hex *.elf *.o *.d *.s *.a

libcan.a: *.o
	avr-ar rcs libcan.a *.o
	
*.o: *.c
	avr-gcc -DF_CPU=8000000UL -DCAN_BAUDRATE=500 -funsigned-char -Os -Werror -Wall -mmcu=at90can128 -c -std=gnu99 *.c -I /usr/local/CrossPack-AVR-20131216/avr/include
