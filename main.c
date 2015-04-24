/*
 * main.c
 */

//#include "DSP28x_Project.h"     // DSP28x Headerfile
#include "common/F2802x_Device.h"
#include "common/include/clk.h"
#include "common/include/gpio.h"
#include "common/include/pll.h"
#include "common/include/wdog.h"



void main()
{
 memcpy(&RamfuncsRunStart, &RamfuncsLoadStart, (size_t)&RamfuncsLoadSize);
 WDOG_Handle myWDog;
 myWDog = WDOG_init((void *)WDOG_BASE_ADDR, sizeof(WDOG_Obj));
 WDOG_disable(myWDog);

 CLK_Handle myClk;
 PLL_Handle myPll;
 myClk = CLK_init((void *)CLK_BASE_ADDR, sizeof(CLK_Obj));
 myPll = PLL_init((void *)PLL_BASE_ADDR, sizeof(PLL_Obj));

  CLK_setOscSrc(myClk, CLK_OscSrc_Internal);

  PLL_setup(myPll, PLL_Multiplier_12, PLL_DivideSelect_ClkIn_by_2);

  GPIO_Handle myGpio;
  myGpio = GPIO_init((void *)GPIO_BASE_ADDR, sizeof(GPIO_Obj));

  GPIO_setMode(myGpio, GPIO_Number_0, GPIO_0_Mode_EPWM1A);
  GPIO_setDirection(myGpio, GPIO_Number_0, GPIO_Direction_Output);
  GPIO_setMode(myGpio, GPIO_Number_1, GPIO_1_Mode_EPWM1B);
  GPIO_setDirection(myGpio, GPIO_Number_1, GPIO_Direction_Output);
  GPIO_setMode(myGpio, GPIO_Number_2, GPIO_2_Mode_EPWM2A);
  GPIO_setDirection(myGpio, GPIO_Number_2, GPIO_Direction_Output);
  GPIO_setMode(myGpio, GPIO_Number_3, GPIO_3_Mode_EPWM2B);
  GPIO_setDirection(myGpio, GPIO_Number_3, GPIO_Direction_Output);
  GPIO_setMode(myGpio, GPIO_Number_4, GPIO_4_Mode_EPWM3A);
  GPIO_setDirection(myGpio, GPIO_Number_4, GPIO_Direction_Output);
  GPIO_setMode(myGpio, GPIO_Number_5, GPIO_5_Mode_EPWM3B);
  GPIO_setDirection(myGpio, GPIO_Number_5, GPIO_Direction_Output);
//=====================================================================
// Config
// Initialization Time
//========================
// EPWM Module 1 config
EPwm1Regs.TBPRD = 450; // Period = 900 TBCLK counts
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
EPwm2Regs.TBPRD = 450; // Period = 900 TBCLK counts
EPwm2Regs.TBPHS.half.TBPHS = 300; // Phase = 300/900 * 360 = 120 deg
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
EPwm3Regs.TBPRD = 450; // Period = 900 TBCLK counts
EPwm3Regs.TBPHS.half.TBPHS = 300; // Phase = 300/900 * 360 = 120 deg
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
EPwm1Regs.CMPA.half.CMPA = 285; // adjust duty for output EPWM1A
EPwm2Regs.CMPA.half.CMPA = 285; // adjust duty for output EPWM2A
EPwm3Regs.CMPA.half.CMPA = 285; // adjust duty for output EPWM3A


  while(1)
  {
  //  GPIO_setLow(myGpio, GPIO_Number_0);
  //  DELAY_US(1000000);
  //  GPIO_setHigh(myGpio, GPIO_Number_0);
  //  DELAY_US(1000000);
  }

}
