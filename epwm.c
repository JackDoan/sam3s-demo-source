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
  InitGpio();
  InitEPwmGpio();
  GpioCtrlRegs.GPADIR.bit.GPIO0 = 1;
  GpioCtrlRegs.GPADIR.bit.GPIO1 = 1;
  GpioCtrlRegs.GPADIR.bit.GPIO3 = 1;
  //=====================================================================
// Config
// Initialization Time
//========================
// EPWM Module 1 config
EPwm1Regs.TBPRD = 1500; // Period = 1500 TBCLK counts
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
EPwm2Regs.TBPRD = 1500; // Period = 1500 TBCLK counts
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
// EPWM Module 3 config
EPwm3Regs.TBPRD = 1500; // Period = 1500 TBCLK counts
EPwm3Regs.TBPHS.half.TBPHS = 300; // Phase = 300/1500 * 360 = 120 deg
EPwm3Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN; // Symmetrical mode
EPwm3Regs.TBCTL.bit.PHSEN = TB_ENABLE; // Slave module
EPwm2Regs.TBCTL.bit.PHSDIR = TB_UP; // Count UP on sync (=240 deg)
EPwm3Regs.TBCTL.bit.PRDLD = TB_SHADOW;
EPwm3Regs.TBCTL.bit.SYNCOSEL = TB_SYNC_IN; // sync flow-through
EPwm3Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;
EPwm3Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;
EPwm3Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO; // load on CTR=Zero
EPwm3Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO; // load on CTR=Zero
EPwm3Regs.AQCTLA.bit.CAU = AQ_SET; // set actions for EPWM3Ai
EPwm3Regs.AQCTLA.bit.CAD = AQ_CLEAR;
EPwm3Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE; // enable Dead-band module
EPwm3Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC; // Active Hi complementary
EPwm3Regs.DBFED = 20; // FED = 20 TBCLKs
EPwm3Regs.DBRED = 20; // RED = 20 TBCLKs
// Run Time (Note: Example execution of one run-time instant)
//===========================================================
EPwm1Regs.CMPA.half.CMPA = (1500 / 2); // adjust duty for output EPWM1A
EPwm2Regs.CMPA.half.CMPA = (1500 / 2); // adjust duty for output EPWM2A
EPwm3Regs.CMPA.half.CMPA = (1500 / 2); // adjust duty for output EPWM3A
  
  //GpioCtrlRegs.GPAPUD.bit.GPIO3 = 0; // Enable pullup on GPIO3
  //GpioDataRegs.GPACLEAR.bit.GPIO3 = 1; // Load output latch
  //GpioCtrlRegs.GPAMUX1.bit.GPIO3 = 0; // G3/EPWM2B/SPISOMID
  EDIS;
  int i;
  int q;
  i = 10;
  q = 1;
  while(1)
  {
  i = i + q;
  if ((i >= 1400) || (i < 10)) {
	i =10;
	q = -q;
  }
  EPwm1Regs.CMPA.half.CMPA = i;
  EPwm2Regs.CMPA.half.CMPA = i;
  EPwm3Regs.CMPA.half.CMPA = i;
  DELAY_US(5000);
  }
}
