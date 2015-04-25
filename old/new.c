/*
 * main.c
 */

//#include "DSP28x_Project.h"     // DSP28x Headerfile
#include "common/F2802x_Device.h"
#include "epwm.h"
#include "gpio.h"
#include "sysctrl.h"


void main()
{
  memcpy(&RamfuncsRunStart, &RamfuncsLoadStart, (size_t)&RamfuncsLoadSize);
  InitFlash();
  InitSysCtrl();
  EALLOW;
  InitGpio();
  GpioCtrlRegs.GPADIR.bit.GPIO0 = 1;
  GpioCtrlRegs.GPADIR.bit.GPIO1 = 1;
  GpioCtrlRegs.GPADIR.bit.GPIO3 = 1;
  InitEPwmGpio();
  InitEPwm(450, 2);
  
  GpioCtrlRegs.GPAPUD.bit.GPIO3 = 1; // Enable pullup on GPIO3
  GpioDataRegs.GPACLEAR.bit.GPIO3 = 1; // Load output latch
  GpioCtrlRegs.GPAMUX1.bit.GPIO3 = 0; // G3/EPWM2B/SPISOMID
  while(1)
  {
  GpioDataRegs.GPASET.bit.GPIO3 = 1;
  DELAY_US(1000000);
  GpioDataRegs.GPACLEAR.bit.GPIO3 = 1;
  DELAY_US(1000000);
  }
  EDIS;
}
