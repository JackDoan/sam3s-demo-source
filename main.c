/*
 * uart.c
 */
#include <stdio.h>
#include "f2802x_common/F2802x_Device.h"

void doPwmMenu(void);
void doAdcMenu(void);
void doGpioMenu(void);
void printMenu(char** menu, int size);
void scia_echoback_init(void);
void scia_fifo_init(void);
void scia_xmit(int a);
void scia_msg(char *msg);
void FloatToString(char * buf, double val);
static unsigned char btoh( unsigned char num );
void scia_Byte2Hex( Uint16 byte );
void scia_Byte2Decimal( Uint16 byte );
void scia_PrintLF( void );
Uint16 scia_read(void);
char clearScreen[] = "\033[2J\033[0;0H";
char menuDivider[] = "-----------------------------------------";
char menuGoBack[] = "0) Go Back\r\n";
char nope[] = "That's not a number. Press any key to continue.";
int read = 0;

char gpioString1[] = "\n GPIO Menu";
char gpioString2[] = "Press the indicated keys to toggle the LEDs:\r\n";
char gpioString3[] = "1) LED0: OFF\r\n2) LED1: OFF\r\n3) LED2: OFF\r\n4) LED3: OFF";
char* gpioMenu[5] = {gpioString1, menuDivider, gpioString2, gpioString3, menuGoBack};

bool gpioStatus0 = 0;
bool gpioStatus1 = 0;
bool gpioStatus2 = 0;
bool gpioStatus3 = 0;


//char gpioString3[] = "1) LED0: OFF\r\n2) LED1: OFF\r\n3) LED2: OFF\r\n4) LED3: OFF";

void main()
{
  memcpy(&RamfuncsRunStart, &RamfuncsLoadStart, (size_t)&RamfuncsLoadSize);
  InitSysCtrl();
  InitFlash();
  EALLOW;
  IER = 0x0000; // Disable CPU interrupts
  IFR = 0x0000; // Clear all CPU interrupt flags
  GpioCtrlRegs.GPAMUX1.all = 0x0000;
  GpioCtrlRegs.GPAMUX2.all = 0x0000;
  GpioCtrlRegs.GPBMUX1.all = 0x0000;
  GpioCtrlRegs.AIOMUX1.all = 0x0000;
  GpioDataRegs.GPASET.all = 0xFFFF;
  GpioCtrlRegs.GPADIR.all = 0xFFFF;
  //scia_fifo_init();
  scia_echoback_init();
  EDIS;
  char menuString1[] = "\nF28027 Main Menu";
  char menuString2[] = "1) PWM";
  char menuString3[] = "2) ADC";
  char menuString4[] = "3) GPIO\r\n";
  char menuGoBack[] = "0) Go Back\r\n"; 
  char* mainMenu[5] = {menuString1, menuDivider, menuString2, menuString3, menuString4};
  
  char pwmString1[] = "\nPWM Setup Menu (outputs on GPIO 0-3)";
  char pwmString2[] = "1) Enable PWM";
  char pwmString3[] = "2) Duty Cycle";
  char pwmString4[] = "3) Frequency\r\n";
  char* pwmMenu[6] = {pwmString1, menuDivider, pwmString2, pwmString3, pwmString4, menuGoBack};
  
  while(1) {
	scia_msg(clearScreen);
        printMenu(mainMenu, 5);
	read = scia_read();
	switch (read) {
		case 0x31:
			doPwmMenu();
			break;
		case 0x32:
			doAdcMenu();
			break;
		case 0x33:
			doGpioMenu();
			break;
		default:
			scia_msg(nope);
			read = scia_read();
			break;
	}
  }

}

void doAdcMenu(void) {
	asm(" NOP");
}

void doPwmMenu(void) {
	asm(" NOP");
}

void doGpioMenu(void) {
  bool breakOutOfLoop = 0;
  while(breakOutOfLoop == 0) {
	scia_msg(clearScreen);
	printMenu(gpioMenu, 5);
	read = scia_read();
	switch (read) {
		case 0x30:
			breakOutOfLoop = 1;
			break;
		case 0x31:
			GpioDataRegs.GPATOGGLE.all = 0x0001;
			if (gpioStatus0 == 0) {
				gpioString3[10] = 'N';
				gpioString3[11] = ' ';
			}
			else {
				gpioString3[10] = 'F';
                                gpioString3[11] = 'F';
			}
			gpioStatus0 = !gpioStatus0;
			break;
		case 0x32:
                        GpioDataRegs.GPATOGGLE.all = 0x0002;
                        if (gpioStatus1 == 0) {
                                gpioString3[24] = 'N';
                                gpioString3[25] = ' ';
                        }
                        else {
                                gpioString3[24] = 'F';
                                gpioString3[25] = 'F';
                        }
                        gpioStatus1 = !gpioStatus1;
			break;
		case 0x33:
                        GpioDataRegs.GPATOGGLE.all = 0x0004;
                        if (gpioStatus2 == 0) {
                                gpioString3[38] = 'N';
                                gpioString3[39] = ' ';
                        }
                        else {
                                gpioString3[38] = 'F';
                                gpioString3[39] = 'F';
                        }
                        gpioStatus2 = !gpioStatus2;
			break;
		case 0x34:
                        GpioDataRegs.GPATOGGLE.all = 0x0008;
                        if (gpioStatus3 == 0) {
                                gpioString3[52] = 'N';
                                gpioString3[53] = ' ';
                        }
                        else {
                                gpioString3[52] = 'F';
                                gpioString3[53] = 'F';
                        }
                        gpioStatus3 = !gpioStatus3;
			break;
		default:
			scia_msg(nope);
			break;
	}
  }
  return;
}

void printMenu(char** menu, int size) {
	int i = 0;
	while (i <= size) {
		scia_msg(menu[i]);
		scia_PrintLF();
		i++;
	}

}


/*
 * Initalize the SCI FIFO
 */
void scia_fifo_init(void)
{
    SciaRegs.SCIFFTX.all=0xE040;
    SciaRegs.SCIFFRX.all=0x2044;
    //SciaRegs.SCIFFRX.all=0x0000;
    SciaRegs.SCIFFCT.all=0x0;

}

/*
 * Test 1,SCIA  DLB, 8-bit word, baud rate 0x000F, default, 1 STOP bit, no parity
 */
void scia_echoback_init(void)
{
        // For this example, only init the pins for the SCI-A port.
        // This function is found in the DSP2802x_Sci.c file.
        InitSciaGpio();

        /* Init scia fifo. */
        scia_fifo_init();

    // Note: Clocks were turned on to the SCIA peripheral
    // in the InitSysCtrl() function

    SciaRegs.SCICCR.all =0x0007;   // 1 stop bit,  No loopback
                                   // No parity,8 char bits,
                                   // async mode, idle-line protocol
    SciaRegs.SCICTL1.all =0x0003;  // enable TX, RX, internal SCICLK,
                                   // Disable RX ERR, SLEEP, TXWAKE
    SciaRegs.SCICTL2.all =0x0003;
    SciaRegs.SCICTL2.bit.TXINTENA =1;
    SciaRegs.SCICTL2.bit.RXBKINTENA =1;

    // SCI BRR = LSPCLK/(SCI BAUDx8) - 1
    SciaRegs.SCIHBAUD    =0x0000;  // 38400 baud @LSPCLK = 15MHz (60 MHz SYSCLK).
    SciaRegs.SCILBAUD    =0x0030;   // 38400 baud @LSPCLK = 15MHz (60 MHz SYSCLK).

    SciaRegs.SCICTL1.all =0x0023;  // Relinquish SCI from Reset
}

/*
 * Transmit a character from the SCI
 */
void scia_xmit(int a)
{
    while (SciaRegs.SCIFFTX.bit.TXFFST != 0) {}
    SciaRegs.SCITXBUF=a;

}

/*
 * Print a string for debug or any purpose.
 */
void scia_msg(char * msg)
{
    int i;
    i = 0;
    while(msg[i] != '\0')
    {
        scia_xmit(msg[i]);
        i++;
    }
}

/*
 * Get a char
 */
Uint16 scia_read(void)
{	
	while(SciaRegs.SCIFFRX.bit.RXFFST ==0) { }
        //while(SciaRegs.SCIFFRX.bit.RXFFST !=1) { } // wait for XRDY =1 for empty state
        return (SciaRegs.SCIRXBUF.all);
}

static unsigned char btoh( unsigned char num )
{
   num = num & 0x0F;
   return ( num<10 )? num+'0' : num-10+'A';
}

/*
 * print uint16 to hex style
 */
void scia_Byte2Hex( Uint16 byte )
{
        unsigned char c;
        int i;
        Uint16 digit;

        scia_xmit( '0' );
        scia_xmit( 'x' );
        for (i = 3; i >= 0; i--)
        {
            digit = (byte >> (i * 4)) & 0xf;
            c = btoh( digit );
            scia_xmit( c );
        }
        scia_xmit( ' ' );
}
/*
 * print "/r/n"
 */
void scia_PrintLF( void )
{
        scia_msg("\r\n");
}
/***************************************************************************//**
 * @brief Converts a float value to a character array with 3 digits of accuracy.
 *
 * @param *buf - returns the converterd value
 * @param val - value to be converted
 *
 * @return None.
*******************************************************************************/
void FloatToString(char * buf, double val)
{
    long  intPart  = 0;
    short fracPart = 0;
    char  charPos  = 0;
    char  localBuf[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    char  i = sizeof(localBuf) - 1;

    intPart = (long)val;
    fracPart = (short)((val - intPart) * 1000 + 0.5);
    while(i > (sizeof(localBuf) - 4))
    {
        localBuf[i] = (fracPart % 10) + 0x30;
        fracPart /= 10;
        i--;
    }
    localBuf[i] = '.';
    if(intPart == 0)
    {
        i --;
        localBuf[i] = '0';
    }
    while(intPart)
    {
        i --;
        localBuf[i] =(intPart % 10)  + 0x30;
        intPart /= 10;
    }
    for(charPos = i; charPos < sizeof(localBuf); charPos ++)
    {
        *buf = localBuf[charPos];
        buf ++;
    }
    *buf = 0;
}
//eof
