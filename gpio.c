/*
 * main.c
 */

//#include "DSP28x_Project.h"     // DSP28x Headerfile
#include "f2802x_common/F2802x_Device.h"

void main()
{

  
  memcpy(&RamfuncsRunStart, &RamfuncsLoadStart, (size_t)&RamfuncsLoadSize);
  InitSysCtrl();
  InitFlash();
  EALLOW;
  IER = 0x0000;	// Disable CPU interrupts
  IFR = 0x0000;	// Clear all CPU interrupt flags
  InitGpio();
  GpioCtrlRegs.GPAMUX1.bit.GPIO0  = 0;
  GpioCtrlRegs.GPADIR.bit.GPIO0 = 1;
  GpioDataRegs.GPACLEAR.bit.GPIO0 = 1;
  EDIS;  
  while(1)
  {
   GpioDataRegs.GPACLEAR.bit.GPIO0 = 1;
   DELAY_US(5000);
   GpioDataRegs.GPASET.bit.GPIO0 = 1;
   DELAY_US(5000);
  }
}
