/*
 * uart.c
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "f2802x_common/F2802x_Device.h"
void epwmInit(int freq, int duty);
void doPwmMenu(void);
void doAdcMenu(void);
void doGpioMenu(void);
void printMenu(char** menu, int size);
void scia_init(void);
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
char menuGoBack[] = "\r\n0) Go Back\r\n";
char nope[] = "That's not a number. Press any key to continue.";
int read = 0;


char pwmString1[] = "\nPWM Menu (outputs on GPIO 0-3)";
char pwmString2[] = "1) Toggle PWM:           OFF ";
char pwmString3[] = "2) Duty Cycle:           50% ";
char pwmString4[] = "3) Frequency :      10000 Hz ";
char pwm_is_kill[] = "PWM is not enabled. Please try again.";
char* pwmMenu[6] = {pwmString1, menuDivider, pwmString2, pwmString3, pwmString4, menuGoBack};

char adcString1[] = "\nADC Menu";
char adcString2[] = "1) Begin conversion. Press any key to stop it\r\n   and return to the main menu.";
char adcString3[] = "Current value: ";
char* adcMenu[3] = {adcString1, menuDivider, adcString2};

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
  GpioCtrlRegs.AIODIR.all = 0x0000;
  GpioDataRegs.GPASET.all = 0xFFFF;
  GpioCtrlRegs.GPADIR.all = 0xFFFF;
  scia_init();
  DINT;
  InitPieCtrl();
  //PieCtrlRegs.PIEIER1.bit.INTx7 = 1;
  InitPieVectTable();
  //PieVectTable.TINT0 = &cpu_timer0_isr;
  IER |= M_INT1;
  //InitCpuTimers();
  //ConfigCpuTimer(&CpuTimer0, 60,500000);
  //CpuTimer0Regs.TCR.bit.TSS = 0;              //CpuTimer0 Start/ReStart
  EnableInterrupts();

  EDIS;
  char menuString1[] = "\nF28027 Main Menu";
  char menuString2[] = "1) PWM";
  char menuString3[] = "2) ADC";
  char menuString4[] = "3) GPIO";
  char* mainMenu[5] = {menuString1, menuDivider, menuString2, menuString3, menuString4};
  
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
	Uint16 valueADC = 0;
	char adcPrint[20] = {0};
	EALLOW;
	InitAdc();
        //ConfigAdc();
        InitAdcAio();
        AdcOffsetSelfCal();
        AdcChanSelect(4); //J1(6)
	int ACQPS_Value = 6;
	AdcRegs.ADCSOC0CTL.bit.ACQPS  = ACQPS_Value;
	AdcRegs.ADCSOC1CTL.bit.ACQPS  = ACQPS_Value;
	AdcRegs.ADCSOC2CTL.bit.ACQPS  = ACQPS_Value;
	AdcRegs.ADCSOC3CTL.bit.ACQPS  = ACQPS_Value;
	AdcRegs.ADCSOC4CTL.bit.ACQPS  = ACQPS_Value;
	AdcRegs.ADCSOC5CTL.bit.ACQPS  = ACQPS_Value;
	AdcRegs.ADCSOC6CTL.bit.ACQPS  = ACQPS_Value;
	AdcRegs.ADCSOC7CTL.bit.ACQPS  = ACQPS_Value;
	AdcRegs.ADCSOC8CTL.bit.ACQPS  = ACQPS_Value;
	AdcRegs.ADCSOC9CTL.bit.ACQPS  = ACQPS_Value;
	AdcRegs.ADCSOC10CTL.bit.ACQPS = ACQPS_Value;
	AdcRegs.ADCSOC11CTL.bit.ACQPS = ACQPS_Value;
	AdcRegs.ADCSOC12CTL.bit.ACQPS = ACQPS_Value;
	AdcRegs.ADCSOC13CTL.bit.ACQPS = ACQPS_Value;
	AdcRegs.ADCSOC14CTL.bit.ACQPS = ACQPS_Value;
	AdcRegs.ADCSOC15CTL.bit.ACQPS = ACQPS_Value;
	EDIS;
	scia_msg(clearScreen);
        printMenu(adcMenu, 4);
        read = scia_read();
	while (SciaRegs.SCIFFRX.bit.RXFFST == 0) {
		//do stuff
		scia_PrintLF();
		scia_msg(clearScreen);
		//scia_msg(menuDivider);
		//scia_PrintLF();
		// Configure the ADC to sample the temperature sensor
EALLOW;
AdcRegs.ADCCTL1.bit.TEMPCONV = 0; //Connect A5 - temp sensor
AdcRegs.ADCSOC0CTL.bit.CHSEL = 14; //Set SOC0 to sample A5
AdcRegs.ADCSOC1CTL.bit.CHSEL = 14; //Set SOC1 to sample A5
AdcRegs.ADCSOC0CTL.bit.ACQPS = 6; //Set SOC0 ACQPS to 7 ADCCLK
AdcRegs.ADCSOC1CTL.bit.ACQPS = 6; //Set SOC1 ACQPS to 7 ADCCLK
AdcRegs.INTSEL1N2.bit.INT1SEL = 1; //Connect ADCINT1 to EOC1
AdcRegs.INTSEL1N2.bit.INT1E = 1; //Enable ADCINT1
EDIS;
// Sample the temperature sensor
AdcRegs.ADCSOCFRC1.all = 0xFF; //Sample temp sensor
while(AdcRegs.ADCINTFLG.bit.ADCINT1 == 0){} //Wait for ADCINT1
AdcRegs.ADCINTFLGCLR.bit.ADCINT1 = 1; //Clear ADCINT1
valueADC = AdcResult.ADCRESULT1; //Get temp sensor sample result
		snprintf(adcPrint, 20, "%d\r\n", valueADC);
		scia_msg(adcPrint);
		DELAY_US(32000);
		DELAY_US(32000);
		DELAY_US(32000);
                DELAY_US(32000);
		DELAY_US(32000);
                DELAY_US(32000);
                DELAY_US(32000);
                DELAY_US(32000);
	}
	return;
}
int pwmStatus = 0;
void doPwmMenu(void) {
	int dutyCycleMult = 2;
	int epwmFreq = 1500;
	bool breakOutOfLoop = 0;
        while(breakOutOfLoop == 0) {
                scia_msg(clearScreen);
                printMenu(pwmMenu, 6);
                read = scia_read();
                switch (read) {
                        case 0x30: //go back
                                breakOutOfLoop = 1;
                                break;
			case 0x31: //enable/disable pwm
				if (pwmStatus == 0) {
					epwmInit(epwmFreq, dutyCycleMult);
					pwmStatus = 1;
               				//pwmString2[] = "1) Toggle PWM:           OFF";
					pwmString2[25] = ' ';
					pwmString2[26] = 'O';
					pwmString2[27] = 'N';
				}
				else {
					pwmStatus = 0;
					EALLOW;
					GpioCtrlRegs.GPADIR.all = 0xFFFF;
					GpioCtrlRegs.GPAMUX1.all = 0x0000;
  					GpioDataRegs.GPASET.all = 0xFFFF;
					EDIS;
					pwmString2[25] = 'O';
                                        pwmString2[26] = 'F';
                                        pwmString2[27] = 'F';
				}
				break;
			case 0x32:
				if (pwmStatus == 1) {
				// prompt for duty cycle
					char dutyCyclePrompt[] = "Enter the new duty cycle:";
					int i = 0;
					int mult = 10;
					int newDutyCycleMult = 0;
					char digits[] = "00";
					scia_msg(dutyCyclePrompt);
					while (i < 2) {
						read = scia_read();
						if (read < 0x3A || read > 0x2F) {
							newDutyCycleMult = newDutyCycleMult + (mult*(read-48));
							digits[i] = read;
							i++;
							mult = mult - 9;
						} 
						else {
							scia_msg(nope);
							i = 0;
							break;
						}
					}
					if (i != 0) {
						dutyCycleMult = newDutyCycleMult;
						//"2) Duty Cycle:           50% ";
						pwmString3[25] = digits[0];
						pwmString3[26] = digits[1];
						i = ((epwmFreq/100)*dutyCycleMult);
						EPwm1Regs.CMPA.half.CMPA = (epwmFreq-i); // adjust duty for output EPWM1A
       						EPwm2Regs.CMPA.half.CMPA = (epwmFreq-i);	
					}
				}
				else {
					scia_msg(pwm_is_kill);
					read = scia_read();
				}
				break;
			case 0x33:
                                if (pwmStatus == 1) {
                
                                }
                                else {
                                        scia_msg(pwm_is_kill);
					read = scia_read();
                                }
                                break;
		}
	}
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

void scia_init(void)
{
    InitSciaGpio();
    scia_fifo_init();

    SciaRegs.SCICCR.all =0x0007;   // 1 stop bit,  No loopback
                                   // No parity,8 char bits,
                                   // async mode, idle-line protocol
    SciaRegs.SCICTL1.all =0x0003;  // enable TX, RX, internal SCICLK,
                                   // Disable RX ERR, SLEEP, TXWAKE
    SciaRegs.SCICTL2.all =0x0003;
    SciaRegs.SCICTL2.bit.TXINTENA =1;
    SciaRegs.SCICTL2.bit.RXBKINTENA =1;

    SciaRegs.SCIHBAUD    =0x0000;  // 38400 baud @LSPCLK = 15MHz (60 MHz SYSCLK).
    SciaRegs.SCILBAUD    =0x0030;   // 38400 baud @LSPCLK = 15MHz (60 MHz SYSCLK).

    SciaRegs.SCICTL1.all =0x0023;  // Release SCI from Reset
}

/*
 * Transmit a character from the SCI
 */
void scia_xmit(int a)
{
    while (SciaRegs.SCIFFTX.bit.TXFFST != 0) {}
    SciaRegs.SCITXBUF=a;

}

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

void epwmInit(int freq, int duty) {
	//InitGpio();
  	InitEPwmGpio();
//	GpioCtrlRegs.GPADIR.bit.GPIO0 = 1;
//	GpioCtrlRegs.GPADIR.bit.GPIO1 = 1;
//	GpioCtrlRegs.GPADIR.bit.GPIO3 = 1;
	// EPWM Module 1 config
	EPwm1Regs.TBPRD = freq; // Period = 1500 TBCLK counts
	EPwm1Regs.TBPHS.half.TBPHS = 0; // Set Phase register to zero
	EPwm1Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN; // Symmetrical mode
	EPwm1Regs.TBCTL.bit.PHSEN = TB_DISABLE; // Master module
	EPwm1Regs.TBCTL.bit.PRDLD = TB_SHADOW;
	EPwm1Regs.TBCTL.bit.SYNCOSEL = TB_CTR_ZERO; // Sync down-stream module
	EPwm1Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
	EPwm1Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
	EPwm1Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO; // load on CTR=Zero
	EPwm1Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO; // load on CTR=Zero
	EPwm1Regs.AQCTLA.bit.CAU = AQ_SET; // set actions for EPWM1A
	EPwm1Regs.AQCTLA.bit.CAD = AQ_CLEAR;
	EPwm1Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE; // enable Dead-band module
	EPwm1Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC; // Active Hi complementary
	EPwm1Regs.DBFED = 20; // FED = 20 TBCLKs
	EPwm1Regs.DBRED = 20; // RED = 20 TBCLKs
	// EPWM Module 2 config
	EPwm2Regs.TBPRD = freq; // Period = 1500 TBCLK counts
	EPwm2Regs.TBPHS.half.TBPHS = 300; // Phase = 300/1500 * 360 = 120 deg
	EPwm2Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN; // Symmetrical mode
	EPwm2Regs.TBCTL.bit.PHSEN = TB_ENABLE; // Slave module
	EPwm2Regs.TBCTL.bit.PHSDIR = TB_DOWN; // Count DOWN on sync (=120 deg)
	EPwm2Regs.TBCTL.bit.PRDLD = TB_SHADOW;
	EPwm2Regs.TBCTL.bit.SYNCOSEL = TB_SYNC_IN; // sync flow-through
	EPwm2Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
	EPwm2Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
	EPwm2Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO; // load on CTR=Zero
	EPwm2Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO; // load on CTR=Zero
	EPwm2Regs.AQCTLA.bit.CAU = AQ_SET; // set actions for EPWM2A
	EPwm2Regs.AQCTLA.bit.CAD = AQ_CLEAR;
	EPwm2Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE; // enable Dead-band module
	EPwm2Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC; // Active Hi Complementary
	EPwm2Regs.DBFED = 20; // FED = 20 TBCLKs
	EPwm2Regs.DBRED = 20; // RED = 20 TBCLKs

	EPwm1Regs.CMPA.half.CMPA = (freq / duty); // adjust duty for output EPWM1A
	EPwm2Regs.CMPA.half.CMPA = (freq / duty); // adjust duty for output EPWM2A
	return;
}
