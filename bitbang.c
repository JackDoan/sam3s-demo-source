/*
 * main.c
 */

#include "f2802x_common/F2802x_Device.h"

void main()
{
  int periodTime = 0;
  int otherTime = 0;
  int dutyCycleMultiplier = 2;  
  memcpy(&RamfuncsRunStart, &RamfuncsLoadStart, (size_t)&RamfuncsLoadSize);
  InitSysCtrl();
  InitFlash();
  EALLOW;
  IER = 0x0000;	// Disable CPU interrupts
  IFR = 0x0000;	// Clear all CPU interrupt flags
  GpioCtrlRegs.GPAMUX1.all = 0x0000;
  GpioCtrlRegs.GPAMUX2.all = 0x0000;
  GpioCtrlRegs.GPBMUX1.all = 0x0000;
  GpioCtrlRegs.AIOMUX1.all = 0x0000;
  GpioDataRegs.GPACLEAR.all = 0xFFFF;
  GpioCtrlRegs.GPADIR.all = 0xFFFF;
  EDIS;
  periodTime = 10000 / dutyCycleMultiplier;
  otherTime = 10000 - periodTime;
  while(1)
  {
   EALLOW;
   //trying to do 10khz = 1 cycle every 1/10000 seconds = 1 per 1/10 ms = 10 mS / cycle
   GpioDataRegs.GPASET.all = 0x0001;
   DELAY_US(periodTime);
   GpioDataRegs.GPACLEAR.all = 0x0001;
   DELAY_US(otherTime);
   EDIS;
  }
}
