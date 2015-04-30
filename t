******************************************************************************
             TMS320C2000 Linker Unix v6.4.4                    
******************************************************************************
>> Linked Wed Apr 29 21:25:42 2015

OUTPUT FILE NAME:   <a.out>
ENTRY POINT SYMBOL: "code_start"  address: 003f7ff6


MEMORY CONFIGURATION

         name            origin    length      used     unused   attr    fill
----------------------  --------  ---------  --------  --------  ----  --------
PAGE 0:
  PRAML0                00008000   00000800  0000001f  000007e1  RWIX
  OTP                   003d7800   00000400  00000000  00000400  RWIX
  FLASHD                003f0000   00002000  00000000  00002000  RWIX
  FLASHC                003f2000   00002000  00000000  00002000  RWIX
  FLASHA                003f6000   00001f80  000009fc  00001584  RWIX
  CSM_RSVD              003f7f80   00000076  00000076  00000000  RWIX
  BEGIN                 003f7ff6   00000002  00000002  00000000  RWIX
  CSM_PWL_P0            003f7ff8   00000008  00000008  00000000  RWIX
  IQTABLES              003fe000   00000b50  00000000  00000b50  RWIX
  IQTABLES2             003feb50   0000008c  00000000  0000008c  RWIX
  IQTABLES3             003febdc   000000aa  00000000  000000aa  RWIX
  ROM                   003ff27c   00000d44  00000000  00000d44  RWIX
  RESET                 003fffc0   00000002  00000000  00000002  RWIX
  VECTORS               003fffc2   0000003e  00000000  0000003e  RWIX

PAGE 1:
  BOOT_RSVD             00000000   00000050  00000000  00000050  RWIX
  RAMM0                 00000050   000003b0  00000200  000001b0  RWIX
  RAMM1                 00000400   00000400  00000000  00000400  RWIX
  DEV_EMU               00000880   00000105  00000004  00000101  RWIX
  SYS_PWR_CTL           00000985   00000003  00000003  00000000  RWIX
  FLASH_REGS            00000a80   00000060  00000008  00000058  RWIX
  CSM                   00000ae0   00000010  00000010  00000000  RWIX
  ADC_RESULT            00000b00   00000020  00000020  00000000  RWIX
  CPU_TIMER0            00000c00   00000008  00000008  00000000  RWIX
  CPU_TIMER1            00000c08   00000008  00000008  00000000  RWIX
  CPU_TIMER2            00000c10   00000008  00000008  00000000  RWIX
  PIE_CTRL              00000ce0   00000020  0000001a  00000006  RWIX
  PIE_VECT              00000d00   00000100  00000100  00000000  RWIX
  COMP1                 00006400   00000020  00000011  0000000f  RWIX
  COMP2                 00006420   00000020  00000011  0000000f  RWIX
  EPWM1                 00006800   00000040  00000040  00000000  RWIX
  EPWM2                 00006840   00000040  00000040  00000000  RWIX
  EPWM3                 00006880   00000040  00000040  00000000  RWIX
  EPWM4                 000068c0   00000040  00000040  00000000  RWIX
  ECAP1                 00006a00   00000020  00000020  00000000  RWIX
  GPIOCTRL              00006f80   00000040  00000040  00000000  RWIX
  GPIODAT               00006fc0   00000020  00000020  00000000  RWIX
  GPIOINT               00006fe0   00000020  0000000a  00000016  RWIX
  SYSTEM                00007010   00000020  0000001f  00000001  RWIX
  SPIA                  00007040   00000010  00000010  00000000  RWIX
  SCIA                  00007050   00000010  00000010  00000000  RWIX
  NMIINTRUPT            00007060   00000010  00000010  00000000  RWIX
  XINTRUPT              00007070   00000010  00000010  00000000  RWIX
  ADC                   00007100   00000080  00000051  0000002f  RWIX
  I2CA                  00007900   00000040  00000022  0000001e  RWIX
  DRAML0                00008800   00000800  00000240  000005c0  RWIX
  PARTID                003d7fff   00000001  00000001  00000000  RWIX
  FLASHB                003f4000   00002000  00000000  00002000  RWIX
  CSM_PWL               003f7ff8   00000008  00000008  00000000  RWIX


SECTION ALLOCATION MAP

 output                                  attributes/
section   page    origin      length       input sections
--------  ----  ----------  ----------   ----------------
ramfuncs   0    003f6145    0000001f     RUN ADDR = 00008000
                  003f6145    0000001b     sysctrl.obj (ramfuncs)
                  003f6160    00000004     F2802x_asmfuncs.obj (ramfuncs)

.cinit     0    003f6808    000001f4     
                  003f6808    000001de     main.obj (.cinit)
                  003f69e6    0000000a     rts2800_ml.lib : exit.obj (.cinit)
                  003f69f0    00000005                    : _lock.obj (.cinit:__lock)
                  003f69f5    00000005                    : _lock.obj (.cinit:__unlock)
                  003f69fa    00000002     --HOLE-- [fill = 0]

csm_rsvd   0    003f7f80    00000076     
                  003f7f80    00000076     F2802x_asmfuncs.obj (csm_rsvd)

DevEmuRegsFile 
*          1    00000880    00000004     UNINITIALIZED
                  00000880    00000004     globals.obj (DevEmuRegsFile)

SysPwrCtrlRegsFile 
*          1    00000985    00000003     UNINITIALIZED
                  00000985    00000003     globals.obj (SysPwrCtrlRegsFile)

FlashRegsFile 
*          1    00000a80    00000008     UNINITIALIZED
                  00000a80    00000008     globals.obj (FlashRegsFile)

CsmRegsFile 
*          1    00000ae0    00000010     UNINITIALIZED
                  00000ae0    00000010     globals.obj (CsmRegsFile)

AdcResultFile 
*          1    00000b00    00000020     UNINITIALIZED
                  00000b00    00000020     globals.obj (AdcResultFile)

CpuTimer0RegsFile 
*          1    00000c00    00000008     UNINITIALIZED
                  00000c00    00000008     globals.obj (CpuTimer0RegsFile)

CpuTimer1RegsFile 
*          1    00000c08    00000008     UNINITIALIZED
                  00000c08    00000008     globals.obj (CpuTimer1RegsFile)

CpuTimer2RegsFile 
*          1    00000c10    00000008     UNINITIALIZED
                  00000c10    00000008     globals.obj (CpuTimer2RegsFile)

PieCtrlRegsFile 
*          1    00000ce0    0000001a     UNINITIALIZED
                  00000ce0    0000001a     globals.obj (PieCtrlRegsFile)

PieVectTableFile 
*          1    00000d00    00000100     UNINITIALIZED
                  00000d00    00000100     globals.obj (PieVectTableFile)

EmuKeyVar 
*          1    00000d00    00000001     UNINITIALIZED
                  00000d00    00000001     globals.obj (EmuKeyVar)

EmuBModeVar 
*          1    00000d01    00000001     UNINITIALIZED
                  00000d01    00000001     globals.obj (EmuBModeVar)

FlashCallbackVar 
*          1    00000d02    00000002     UNINITIALIZED
                  00000d02    00000002     globals.obj (FlashCallbackVar)

FlashScalingVar 
*          1    00000d04    00000002     UNINITIALIZED
                  00000d04    00000002     globals.obj (FlashScalingVar)

Comp1RegsFile 
*          1    00006400    00000011     UNINITIALIZED
                  00006400    00000011     globals.obj (Comp1RegsFile)

Comp2RegsFile 
*          1    00006420    00000011     UNINITIALIZED
                  00006420    00000011     globals.obj (Comp2RegsFile)

EPwm1RegsFile 
*          1    00006800    00000040     UNINITIALIZED
                  00006800    00000040     globals.obj (EPwm1RegsFile)

EPwm2RegsFile 
*          1    00006840    00000040     UNINITIALIZED
                  00006840    00000040     globals.obj (EPwm2RegsFile)

EPwm3RegsFile 
*          1    00006880    00000040     UNINITIALIZED
                  00006880    00000040     globals.obj (EPwm3RegsFile)

EPwm4RegsFile 
*          1    000068c0    00000040     UNINITIALIZED
                  000068c0    00000040     globals.obj (EPwm4RegsFile)

ECap1RegsFile 
*          1    00006a00    00000020     UNINITIALIZED
                  00006a00    00000020     globals.obj (ECap1RegsFile)

GpioCtrlRegsFile 
*          1    00006f80    00000040     UNINITIALIZED
                  00006f80    00000040     globals.obj (GpioCtrlRegsFile)

GpioDataRegsFile 
*          1    00006fc0    00000020     UNINITIALIZED
                  00006fc0    00000020     globals.obj (GpioDataRegsFile)

GpioIntRegsFile 
*          1    00006fe0    0000000a     UNINITIALIZED
                  00006fe0    0000000a     globals.obj (GpioIntRegsFile)

SysCtrlRegsFile 
*          1    00007010    0000001f     UNINITIALIZED
                  00007010    0000001f     globals.obj (SysCtrlRegsFile)

SpiaRegsFile 
*          1    00007040    00000010     UNINITIALIZED
                  00007040    00000010     globals.obj (SpiaRegsFile)

SciaRegsFile 
*          1    00007050    00000010     UNINITIALIZED
                  00007050    00000010     globals.obj (SciaRegsFile)

NmiIntruptRegsFile 
*          1    00007060    00000010     UNINITIALIZED
                  00007060    00000010     globals.obj (NmiIntruptRegsFile)

XIntruptRegsFile 
*          1    00007070    00000010     UNINITIALIZED
                  00007070    00000010     globals.obj (XIntruptRegsFile)

AdcRegsFile 
*          1    00007100    00000051     UNINITIALIZED
                  00007100    00000051     globals.obj (AdcRegsFile)

I2caRegsFile 
*          1    00007900    00000022     UNINITIALIZED
                  00007900    00000022     globals.obj (I2caRegsFile)

PartIdRegsFile 
*          1    003d7fff    00000001     UNINITIALIZED
                  003d7fff    00000001     globals.obj (PartIdRegsFile)

CsmPwlFile 
*          1    003f7ff8    00000008     UNINITIALIZED
                  003f7ff8    00000008     globals.obj (CsmPwlFile)

.pinit     0    003f6000    00000000     UNINITIALIZED

codestart 
*          0    003f7ff6    00000002     
                  003f7ff6    00000002     F2802x_asmfuncs.obj (codestart)

csmpasswds 
*          0    003f7ff8    00000008     
                  003f7ff8    00000008     F2802x_asmfuncs.obj (csmpasswds)

.stack     1    00000050    00000200     UNINITIALIZED
                  00000050    00000200     --HOLE--

.ebss      1    00008800    00000240     UNINITIALIZED
                  00008800    00000237     main.obj (.ebss)
                  00008a37    00000001     --HOLE--
                  00008a38    00000004     rts2800_ml.lib : exit.obj (.ebss)
                  00008a3c    00000002                    : _lock.obj (.ebss:__lock)
                  00008a3e    00000002                    : _lock.obj (.ebss:__unlock)

.econst    0    003f6000    00000145     
                  003f6000    00000100     pievect.obj (.econst)
                  003f6100    0000001a     main.obj (.econst:.string:_$P$T4$5)
                  003f611a    00000012     main.obj (.econst:.string:_$P$T0$1)
                  003f612c    00000008     main.obj (.econst:.string:_$P$T3$4)
                  003f6134    00000007     main.obj (.econst:.string:_$P$T1$2)
                  003f613b    00000007     main.obj (.econst:.string:_$P$T2$3)
                  003f6142    00000003     main.obj (.econst:.string)

.reset     0    003fffc0    00000002     DSECT
                  003fffc0    00000002     rts2800_ml.lib : boot.obj (.reset)

vectors    0    003fffc2    00000000     DSECT

.text      0    003f6164    000006a4     
                  003f6164    0000030a     main.obj (.text)
                  003f646e    00000130     sysctrl.obj (.text)
                  003f659e    000000ff     default_isr.obj (.text:retain)
                  003f669d    00000081     epwm.obj (.text)
                  003f671e    00000044     rts2800_ml.lib : boot.obj (.text)
                  003f6762    00000022                    : i_div.obj (.text)
                  003f6784    0000001d                    : memcpy.obj (.text)
                  003f67a1    0000001a     sci.obj (.text)
                  003f67bb    00000019     rts2800_ml.lib : args_main.obj (.text)
                  003f67d4    00000019                    : exit.obj (.text)
                  003f67ed    00000012     F2802x_asmfuncs.obj (.text)
                  003f67ff    00000009     rts2800_ml.lib : _lock.obj (.text)


GLOBAL DATA SYMBOLS: SORTED BY DATA PAGE

address     data page           name
--------    ----------------    ----
00000050       1 (00000040)     __stack

00000880      22 (00000880)     _DevEmuRegs

00000985      26 (00000980)     _SysPwrCtrlRegs

00000a80      2a (00000a80)     _FlashRegs

00000ae0      2b (00000ac0)     _CsmRegs

00000b00      2c (00000b00)     _AdcResult

00000c00      30 (00000c00)     _CpuTimer0Regs
00000c08      30 (00000c00)     _CpuTimer1Regs
00000c10      30 (00000c00)     _CpuTimer2Regs

00000ce0      33 (00000cc0)     _PieCtrlRegs

00000d00      34 (00000d00)     _EmuKey
00000d00      34 (00000d00)     _PieVectTable
00000d01      34 (00000d00)     _EmuBMode
00000d02      34 (00000d00)     _Flash_CallbackPtr
00000d04      34 (00000d00)     _Flash_CPUScaleFactor

00006400     190 (00006400)     _Comp1Regs
00006420     190 (00006400)     _Comp2Regs

00006800     1a0 (00006800)     _EPwm1Regs

00006840     1a1 (00006840)     _EPwm2Regs

00006880     1a2 (00006880)     _EPwm3Regs

000068c0     1a3 (000068c0)     _EPwm4Regs

00006a00     1a8 (00006a00)     _ECap1Regs

00006f80     1be (00006f80)     _GpioCtrlRegs

00006fc0     1bf (00006fc0)     _GpioDataRegs
00006fe0     1bf (00006fc0)     _GpioIntRegs

00007010     1c0 (00007000)     _SysCtrlRegs

00007040     1c1 (00007040)     _SpiaRegs
00007050     1c1 (00007040)     _SciaRegs
00007060     1c1 (00007040)     _NmiIntruptRegs
00007070     1c1 (00007040)     _XIntruptRegs

00007100     1c4 (00007100)     _AdcRegs

00007900     1e4 (00007900)     _I2caRegs

00008800     220 (00008800)     _gpioStatus3
00008801     220 (00008800)     _read
00008802     220 (00008800)     _gpioStatus2
00008803     220 (00008800)     _gpioStatus1
00008804     220 (00008800)     _pwmStatus
00008805     220 (00008800)     _gpioStatus0
00008806     220 (00008800)     _gpioMenu
00008810     220 (00008800)     _clearScreen
0000881b     220 (00008800)     _gpioString1
00008828     220 (00008800)     _pwmMenu

00008840     221 (00008840)     _menuGoBack
0000884f     221 (00008840)     _pwmString3

00008880     222 (00008880)     _pwmString4
0000889e     222 (00008880)     _pwmString2

000088c0     223 (000088c0)     _pwmString1

00008900     224 (00008900)     _pwm_is_kill

00008940     225 (00008940)     _menuDivider

00008980     226 (00008980)     _gpioString2

000089c0     227 (000089c0)     _nope

00008a00     228 (00008a00)     _gpioString3
00008a38     228 (00008a00)     ___TI_cleanup_ptr
00008a3a     228 (00008a00)     ___TI_dtors_ptr
00008a3c     228 (00008a00)     __lock
00008a3e     228 (00008a00)     __unlock

003d7fff    f5ff (003d7fc0)     _PartIdRegs

003f6000    fd80 (003f6000)     _PieVectTableInit

003f7ff8    fdff (003f7fc0)     _CsmPwl


GLOBAL SYMBOLS: SORTED ALPHABETICALLY BY Name 

page  address   name                 
----  -------   ----                 
abs   ffffffff  .text                
0     003f67d4  C$$EXIT              
0     003f6762  I$$DIV               
0     003f6773  I$$MOD               
0     003f65fd  _ADCINT1_ISR         
0     003f6602  _ADCINT2_ISR         
0     003f666b  _ADCINT3_ISR         
0     003f6670  _ADCINT4_ISR         
0     003f6675  _ADCINT5_ISR         
0     003f667a  _ADCINT6_ISR         
0     003f667f  _ADCINT7_ISR         
0     003f6684  _ADCINT8_ISR         
0     003f6611  _ADCINT9_ISR         
1     00007100  _AdcRegs             
1     00000b00  _AdcResult           
1     00006400  _Comp1Regs           
1     00006420  _Comp2Regs           
1     00000c00  _CpuTimer0Regs       
1     00000c08  _CpuTimer1Regs       
1     00000c10  _CpuTimer2Regs       
1     003f7ff8  _CsmPwl              
1     00000ae0  _CsmRegs             
0     003f6521  _CsmUnlock           
0     003f65a8  _DATALOG_ISR         
0     003f67f8  _DSP28x_DisableInt   
0     003f67fc  _DSP28x_RestoreInt   
0     0000801b  _DSP28x_usDelay      
1     00000880  _DevEmuRegs          
0     003f6492  _DisableDog          
0     003f6648  _ECAP1_INT_ISR       
1     00006a00  _ECap1Regs           
0     003f668e  _EMPTY_ISR           
0     003f65b2  _EMUINT_ISR          
0     003f6634  _EPWM1_INT_ISR       
0     003f6620  _EPWM1_TZINT_ISR     
0     003f6639  _EPWM2_INT_ISR       
0     003f6625  _EPWM2_TZINT_ISR     
0     003f663e  _EPWM3_INT_ISR       
0     003f662a  _EPWM3_TZINT_ISR     
0     003f6643  _EPWM4_INT_ISR       
0     003f662f  _EPWM4_TZINT_ISR     
1     00006800  _EPwm1Regs           
1     00006840  _EPwm2Regs           
1     00006880  _EPwm3Regs           
1     000068c0  _EPwm4Regs           
1     00000d01  _EmuBMode            
1     00000d00  _EmuKey              
0     003f6588  _ExtOscSel           
1     00000a80  _FlashRegs           
1     00000d04  _Flash_CPUScaleFactor
1     00000d02  _Flash_CallbackPtr   
1     00006f80  _GpioCtrlRegs        
1     00006fc0  _GpioDataRegs        
1     00006fe0  _GpioIntRegs         
0     003f6657  _I2CINT1A_ISR        
0     003f665c  _I2CINT2A_ISR        
1     00007900  _I2caRegs            
0     003f65bc  _ILLEGAL_ISR         
0     003f659e  _INT13_ISR           
0     003f65a3  _INT14_ISR           
0     003f669d  _InitEPwm            
0     003f66a7  _InitEPwm1Gpio       
0     003f66b9  _InitEPwm2Gpio       
0     003f66cb  _InitEPwm3Gpio       
0     003f66df  _InitEPwm4Gpio       
0     003f669e  _InitEPwmGpio        
0     003f66f3  _InitEPwmSyncGpio    
0     00008000  _InitFlash           
0     003f64ef  _InitPeripheralClocks
0     003f649a  _InitPll             
0     003f67a1  _InitSci             
0     003f67a2  _InitSciGpio         
0     003f67a5  _InitSciaGpio        
0     003f646e  _InitSysCtrl         
0     003f6703  _InitTzGpio          
0     003f6552  _IntOsc1Sel          
0     003f6562  _IntOsc2Sel          
0     003f65b7  _NMI_ISR             
1     00007060  _NmiIntruptRegs      
0     003f6693  _PIE_RESERVED        
1     003d7fff  _PartIdRegs          
1     00000ce0  _PieCtrlRegs         
1     00000d00  _PieVectTable        
0     003f6000  _PieVectTableInit    
0     003f65ad  _RTOSINT_ISR         
abs   0000001f  _RamfuncsLoadSize    
0     003f6145  _RamfuncsLoadStart   
0     00008000  _RamfuncsRunStart    
0     003f6661  _SCIRXINTA_ISR       
0     003f6666  _SCITXINTA_ISR       
0     003f664d  _SPIRXINTA_ISR       
0     003f6652  _SPITXINTA_ISR       
1     00007050  _SciaRegs            
0     003f6488  _ServiceDog          
1     00007040  _SpiaRegs            
1     00007010  _SysCtrlRegs         
1     00000985  _SysPwrCtrlRegs      
0     003f6616  _TINT0_ISR           
0     003f65ee  _USER10_ISR          
0     003f65f3  _USER11_ISR          
0     003f65f8  _USER12_ISR          
0     003f65c1  _USER1_ISR           
0     003f65c6  _USER2_ISR           
0     003f65cb  _USER3_ISR           
0     003f65d0  _USER4_ISR           
0     003f65d5  _USER5_ISR           
0     003f65da  _USER6_ISR           
0     003f65df  _USER7_ISR           
0     003f65e4  _USER8_ISR           
0     003f65e9  _USER9_ISR           
0     003f661b  _WAKEINT_ISR         
0     003f6607  _XINT1_ISR           
0     003f660c  _XINT2_ISR           
0     003f6689  _XINT3_ISR           
1     00007070  _XIntruptRegs        
0     003f6574  _XtalOscSel          
1     00000250  __STACK_END          
abs   00000200  __STACK_SIZE         
1     00008a38  ___TI_cleanup_ptr    
1     00008a3a  ___TI_dtors_ptr      
abs   ffffffff  ___binit__           
abs   ffffffff  ___c_args__          
0     003f6808  ___cinit__           
abs   ffffffff  ___etext__           
abs   ffffffff  ___pinit__           
abs   ffffffff  ___text__            
0     003f67bb  __args_main          
1     00008a3c  __lock               
0     003f6807  __nop                
0     003f6803  __register_lock      
0     003f67ff  __register_unlock    
1     00000050  __stack              
1     00008a3e  __unlock             
0     003f67d4  _abort               
0     003f671e  _c_int00             
1     00008810  _clearScreen         
0     003f61e5  _doAdcMenu           
0     003f62b3  _doGpioMenu          
0     003f61fc  _doPwmMenu           
0     003f640c  _epwmInit            
0     003f67d6  _exit                
1     00008806  _gpioMenu            
1     00008805  _gpioStatus0         
1     00008803  _gpioStatus1         
1     00008802  _gpioStatus2         
1     00008800  _gpioStatus3         
1     0000881b  _gpioString1         
1     00008980  _gpioString2         
1     00008a00  _gpioString3         
0     003f6164  _main                
0     003f6784  _memcpy              
1     00008940  _menuDivider         
1     00008840  _menuGoBack          
1     000089c0  _nope                
0     003f637c  _printMenu           
1     00008828  _pwmMenu             
1     00008804  _pwmStatus           
1     000088c0  _pwmString1          
1     0000889e  _pwmString2          
1     0000884f  _pwmString3          
1     00008880  _pwmString4          
1     00008900  _pwm_is_kill         
1     00008801  _read                
0     003f6698  _rsvd_ISR            
0     003f63e4  _scia_Byte2Hex       
0     003f6407  _scia_PrintLF        
0     003f6394  _scia_fifo_init      
0     003f639c  _scia_init           
0     003f63bc  _scia_msg            
0     003f63cf  _scia_read           
0     003f63b0  _scia_xmit           
0     003f67f5  _setDBGIER           
abs   ffffffff  binit                
0     003f6808  cinit                
0     003f7ff6  code_start           
abs   ffffffff  etext                
abs   ffffffff  pinit                


GLOBAL SYMBOLS: SORTED BY Symbol Address 

page  address   name                 
----  -------   ----                 
0     00008000  _InitFlash           
0     00008000  _RamfuncsRunStart    
0     0000801b  _DSP28x_usDelay      
0     003f6000  _PieVectTableInit    
0     003f6145  _RamfuncsLoadStart   
0     003f6164  _main                
0     003f61e5  _doAdcMenu           
0     003f61fc  _doPwmMenu           
0     003f62b3  _doGpioMenu          
0     003f637c  _printMenu           
0     003f6394  _scia_fifo_init      
0     003f639c  _scia_init           
0     003f63b0  _scia_xmit           
0     003f63bc  _scia_msg            
0     003f63cf  _scia_read           
0     003f63e4  _scia_Byte2Hex       
0     003f6407  _scia_PrintLF        
0     003f640c  _epwmInit            
0     003f646e  _InitSysCtrl         
0     003f6488  _ServiceDog          
0     003f6492  _DisableDog          
0     003f649a  _InitPll             
0     003f64ef  _InitPeripheralClocks
0     003f6521  _CsmUnlock           
0     003f6552  _IntOsc1Sel          
0     003f6562  _IntOsc2Sel          
0     003f6574  _XtalOscSel          
0     003f6588  _ExtOscSel           
0     003f659e  _INT13_ISR           
0     003f65a3  _INT14_ISR           
0     003f65a8  _DATALOG_ISR         
0     003f65ad  _RTOSINT_ISR         
0     003f65b2  _EMUINT_ISR          
0     003f65b7  _NMI_ISR             
0     003f65bc  _ILLEGAL_ISR         
0     003f65c1  _USER1_ISR           
0     003f65c6  _USER2_ISR           
0     003f65cb  _USER3_ISR           
0     003f65d0  _USER4_ISR           
0     003f65d5  _USER5_ISR           
0     003f65da  _USER6_ISR           
0     003f65df  _USER7_ISR           
0     003f65e4  _USER8_ISR           
0     003f65e9  _USER9_ISR           
0     003f65ee  _USER10_ISR          
0     003f65f3  _USER11_ISR          
0     003f65f8  _USER12_ISR          
0     003f65fd  _ADCINT1_ISR         
0     003f6602  _ADCINT2_ISR         
0     003f6607  _XINT1_ISR           
0     003f660c  _XINT2_ISR           
0     003f6611  _ADCINT9_ISR         
0     003f6616  _TINT0_ISR           
0     003f661b  _WAKEINT_ISR         
0     003f6620  _EPWM1_TZINT_ISR     
0     003f6625  _EPWM2_TZINT_ISR     
0     003f662a  _EPWM3_TZINT_ISR     
0     003f662f  _EPWM4_TZINT_ISR     
0     003f6634  _EPWM1_INT_ISR       
0     003f6639  _EPWM2_INT_ISR       
0     003f663e  _EPWM3_INT_ISR       
0     003f6643  _EPWM4_INT_ISR       
0     003f6648  _ECAP1_INT_ISR       
0     003f664d  _SPIRXINTA_ISR       
0     003f6652  _SPITXINTA_ISR       
0     003f6657  _I2CINT1A_ISR        
0     003f665c  _I2CINT2A_ISR        
0     003f6661  _SCIRXINTA_ISR       
0     003f6666  _SCITXINTA_ISR       
0     003f666b  _ADCINT3_ISR         
0     003f6670  _ADCINT4_ISR         
0     003f6675  _ADCINT5_ISR         
0     003f667a  _ADCINT6_ISR         
0     003f667f  _ADCINT7_ISR         
0     003f6684  _ADCINT8_ISR         
0     003f6689  _XINT3_ISR           
0     003f668e  _EMPTY_ISR           
0     003f6693  _PIE_RESERVED        
0     003f6698  _rsvd_ISR            
0     003f669d  _InitEPwm            
0     003f669e  _InitEPwmGpio        
0     003f66a7  _InitEPwm1Gpio       
0     003f66b9  _InitEPwm2Gpio       
0     003f66cb  _InitEPwm3Gpio       
0     003f66df  _InitEPwm4Gpio       
0     003f66f3  _InitEPwmSyncGpio    
0     003f6703  _InitTzGpio          
0     003f671e  _c_int00             
0     003f6762  I$$DIV               
0     003f6773  I$$MOD               
0     003f6784  _memcpy              
0     003f67a1  _InitSci             
0     003f67a2  _InitSciGpio         
0     003f67a5  _InitSciaGpio        
0     003f67bb  __args_main          
0     003f67d4  C$$EXIT              
0     003f67d4  _abort               
0     003f67d6  _exit                
0     003f67f5  _setDBGIER           
0     003f67f8  _DSP28x_DisableInt   
0     003f67fc  _DSP28x_RestoreInt   
0     003f67ff  __register_unlock    
0     003f6803  __register_lock      
0     003f6807  __nop                
0     003f6808  ___cinit__           
0     003f6808  cinit                
0     003f7ff6  code_start           
1     00000050  __stack              
1     00000250  __STACK_END          
1     00000880  _DevEmuRegs          
1     00000985  _SysPwrCtrlRegs      
1     00000a80  _FlashRegs           
1     00000ae0  _CsmRegs             
1     00000b00  _AdcResult           
1     00000c00  _CpuTimer0Regs       
1     00000c08  _CpuTimer1Regs       
1     00000c10  _CpuTimer2Regs       
1     00000ce0  _PieCtrlRegs         
1     00000d00  _EmuKey              
1     00000d00  _PieVectTable        
1     00000d01  _EmuBMode            
1     00000d02  _Flash_CallbackPtr   
1     00000d04  _Flash_CPUScaleFactor
1     00006400  _Comp1Regs           
1     00006420  _Comp2Regs           
1     00006800  _EPwm1Regs           
1     00006840  _EPwm2Regs           
1     00006880  _EPwm3Regs           
1     000068c0  _EPwm4Regs           
1     00006a00  _ECap1Regs           
1     00006f80  _GpioCtrlRegs        
1     00006fc0  _GpioDataRegs        
1     00006fe0  _GpioIntRegs         
1     00007010  _SysCtrlRegs         
1     00007040  _SpiaRegs            
1     00007050  _SciaRegs            
1     00007060  _NmiIntruptRegs      
1     00007070  _XIntruptRegs        
1     00007100  _AdcRegs             
1     00007900  _I2caRegs            
1     00008800  _gpioStatus3         
1     00008801  _read                
1     00008802  _gpioStatus2         
1     00008803  _gpioStatus1         
1     00008804  _pwmStatus           
1     00008805  _gpioStatus0         
1     00008806  _gpioMenu            
1     00008810  _clearScreen         
1     0000881b  _gpioString1         
1     00008828  _pwmMenu             
1     00008840  _menuGoBack          
1     0000884f  _pwmString3          
1     00008880  _pwmString4          
1     0000889e  _pwmString2          
1     000088c0  _pwmString1          
1     00008900  _pwm_is_kill         
1     00008940  _menuDivider         
1     00008980  _gpioString2         
1     000089c0  _nope                
1     00008a00  _gpioString3         
1     00008a38  ___TI_cleanup_ptr    
1     00008a3a  ___TI_dtors_ptr      
1     00008a3c  __lock               
1     00008a3e  __unlock             
1     003d7fff  _PartIdRegs          
1     003f7ff8  _CsmPwl              
abs   0000001f  _RamfuncsLoadSize    
abs   00000200  __STACK_SIZE         
abs   ffffffff  .text                
abs   ffffffff  ___binit__           
abs   ffffffff  ___c_args__          
abs   ffffffff  ___etext__           
abs   ffffffff  ___pinit__           
abs   ffffffff  ___text__            
abs   ffffffff  binit                
abs   ffffffff  etext                
abs   ffffffff  pinit                

[177 symbols]
