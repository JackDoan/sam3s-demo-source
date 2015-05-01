******************************************************************************
             TMS320C2000 Linker Unix v6.4.4                    
******************************************************************************
>> Linked Fri May  1 04:05:14 2015

OUTPUT FILE NAME:   <a.out>
ENTRY POINT SYMBOL: "code_start"  address: 003f7ff6


MEMORY CONFIGURATION

         name            origin    length      used     unused   attr    fill
----------------------  --------  ---------  --------  --------  ----  --------
PAGE 0:
  PRAML0                00008000   00000800  0000001f  000007e1  RWIX
  OTP                   003d7800   00000400  00000000  00000400  RWIX
  FLASHD                003f0000   00002000  00000000  00002000  RWIX
  FLASHC                003f2000   00002000  00000273  00001d8d  RWIX
  FLASHA                003f6000   00001f80  00001d88  000001f8  RWIX
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
  DRAML0                00008800   00000800  00000298  00000568  RWIX
  PARTID                003d7fff   00000001  00000001  00000000  RWIX
  FLASHB                003f4000   00002000  00000000  00002000  RWIX
  CSM_PWL               003f7ff8   00000008  00000008  00000000  RWIX


SECTION ALLOCATION MAP

 output                                  attributes/
section   page    origin      length       input sections
--------  ----  ----------  ----------   ----------------
.cinit     0    003f2000    00000273     
                  003f2000    00000259     main.obj (.cinit)
                  003f2259    0000000a     rts2800_ml.lib : exit.obj (.cinit)
                  003f2263    00000005                    : _lock.obj (.cinit:__lock)
                  003f2268    00000005                    : _lock.obj (.cinit:__unlock)
                  003f226d    00000004                    : errno.obj (.cinit)
                  003f2271    00000002     --HOLE-- [fill = 0]

ramfuncs   0    003f6292    0000001f     RUN ADDR = 00008000
                  003f6292    0000001b     sysctrl.obj (ramfuncs)
                  003f62ad    00000004     F2802x_asmfuncs.obj (ramfuncs)

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

.ebss      1    00008800    00000298     UNINITIALIZED
                  00008800    0000028f     main.obj (.ebss)
                  00008a8f    00000001     rts2800_ml.lib : errno.obj (.ebss)
                  00008a90    00000004                    : exit.obj (.ebss)
                  00008a94    00000002                    : _lock.obj (.ebss:__lock)
                  00008a96    00000002                    : _lock.obj (.ebss:__unlock)

.econst    0    003f6000    00000292     
                  003f6000    00000101     rts2800_ml.lib : ctype.obj (.econst:.string:__ctypes_)
                  003f6101    00000001     --HOLE-- [fill = 0]
                  003f6102    00000100     pievect.obj (.econst)
                  003f6202    00000026     rts2800_ml.lib : _printfi.obj (.econst:.string)
                  003f6228    0000001c                    : _printfi.obj (.econst)
                  003f6244    0000001a     main.obj (.econst:.string:_$P$T4$5)
                  003f625e    00000012     main.obj (.econst:.string:_$P$T0$1)
                  003f6270    00000009     main.obj (.econst:.string)
                  003f6279    00000008     main.obj (.econst:.string:_$P$T3$4)
                  003f6281    00000007     main.obj (.econst:.string:_$P$T1$2)
                  003f6288    00000007     main.obj (.econst:.string:_$P$T2$3)
                  003f628f    00000003     main.obj (.econst:.string:_$P$T5$6)

.reset     0    003fffc0    00000002     DSECT
                  003fffc0    00000002     rts2800_ml.lib : boot.obj (.reset)

vectors    0    003fffc2    00000000     DSECT

.text      0    003f62b1    00001ad7     
                  003f62b1    00000b6e     rts2800_ml.lib : _printfi.obj (.text)
                  003f6e1f    00000416     main.obj (.text)
                  003f7235    00000207     adc.obj (.text)
                  003f743c    00000130     sysctrl.obj (.text)
                  003f756c    00000107     rts2800_ml.lib : ll_div.obj (.text)
                  003f7673    000000ff     default_isr.obj (.text:retain)
                  003f7772    0000009c     rts2800_ml.lib : fd_add.obj (.text)
                  003f780e    0000008b                    : fd_div.obj (.text)
                  003f7899    00000083                    : fd_mpy.obj (.text)
                  003f791c    00000081     epwm.obj (.text)
                  003f799d    0000005d     rts2800_ml.lib : snprintf.obj (.text)
                  003f79fa    00000044                    : boot.obj (.text)
                  003f7a3e    00000041                    : ldexp.obj (.text)
                  003f7a7f    00000031                    : atoi.obj (.text)
                  003f7ab0    0000002e                    : ltoa.obj (.text)
                  003f7ade    0000002a                    : fd_cmp.obj (.text)
                  003f7b08    0000002a                    : l_div.obj (.text)
                  003f7b32    00000028     piecontrol.obj (.text)
                  003f7b5a    00000028     pievect.obj (.text)
                  003f7b82    00000022     rts2800_ml.lib : i_div.obj (.text)
                  003f7ba4    00000021                    : fd_tofs.obj (.text)
                  003f7bc5    00000021                    : fd_toi.obj (.text)
                  003f7be6    0000001f                    : fd_tol.obj (.text)
                  003f7c05    0000001e                    : ll_cmp.obj (.text)
                  003f7c23    0000001d                    : i_tofd.obj (.text)
                  003f7c40    0000001d                    : memcpy.obj (.text)
                  003f7c5d    0000001c                    : fs_tofd.obj (.text)
                  003f7c79    0000001c                    : l_tofd.obj (.text)
                  003f7c95    0000001a     sci.obj (.text)
                  003f7caf    00000019     rts2800_ml.lib : args_main.obj (.text)
                  003f7cc8    00000019                    : exit.obj (.text)
                  003f7ce1    00000018                    : ll_aox.obj (.text)
                  003f7cf9    00000017                    : fs_cmp.obj (.text)
                  003f7d10    00000014                    : frexp.obj (.text)
                  003f7d24    00000012     F2802x_asmfuncs.obj (.text)
                  003f7d36    0000000e     rts2800_ml.lib : fd_sub.obj (.text)
                  003f7d44    0000000e                    : memccpy.obj (.text)
                  003f7d52    0000000c                    : memset.obj (.text)
                  003f7d5e    0000000b                    : strchr.obj (.text)
                  003f7d69    00000009                    : _lock.obj (.text)
                  003f7d72    00000009                    : fd_neg.obj (.text)
                  003f7d7b    00000008                    : strlen.obj (.text)
                  003f7d83    00000005                    : strcpy.obj (.text)


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
00008801     220 (00008800)     _pwmStatus
00008802     220 (00008800)     _gpioStatus0
00008803     220 (00008800)     _read
00008804     220 (00008800)     _gpioStatus2
00008805     220 (00008800)     _gpioStatus1
00008806     220 (00008800)     _adcMenu
0000880c     220 (00008800)     _adcString1
00008816     220 (00008800)     _gpioMenu
00008820     220 (00008800)     _clearScreen
0000882c     220 (00008800)     _pwmMenu

00008840     221 (00008840)     _gpioString1
0000884c     221 (00008840)     _menuGoBack
0000885b     221 (00008840)     _adcString3

00008880     222 (00008880)     _pwmString2
0000889e     222 (00008880)     _pwmString3

000088c0     223 (000088c0)     _pwmString4
000088de     223 (000088c0)     _pwmString1

00008900     224 (00008900)     _pwm_is_kill

00008940     225 (00008940)     _menuDivider

00008980     226 (00008980)     _gpioString2

000089c0     227 (000089c0)     _nope

00008a00     228 (00008a00)     _gpioString3

00008a40     229 (00008a40)     _adcString2

00008a8f     22a (00008a80)     _errno
00008a90     22a (00008a80)     ___TI_cleanup_ptr
00008a92     22a (00008a80)     ___TI_dtors_ptr
00008a94     22a (00008a80)     __lock
00008a96     22a (00008a80)     __unlock

003d7fff    f5ff (003d7fc0)     _PartIdRegs

003f6000    fd80 (003f6000)     __ctypes_

003f6102    fd84 (003f6100)     _PieVectTableInit

003f7ff8    fdff (003f7fc0)     _CsmPwl


GLOBAL SYMBOLS: SORTED ALPHABETICALLY BY Name 

page  address   name                 
----  -------   ----                 
abs   ffffffff  .text                
0     003f7cc8  C$$EXIT              
0     003f7772  FD$$ADD              
0     003f7ade  FD$$CMP              
0     003f780e  FD$$DIV              
0     003f7899  FD$$MPY              
0     003f7d72  FD$$NEG              
0     003f7d36  FD$$SUB              
0     003f7ba4  FD$$TOFS             
0     003f7bc5  FD$$TOI              
0     003f7be6  FD$$TOL              
0     003f7cf9  FS$$CMP              
0     003f7c5d  FS$$TOFD             
0     003f7b82  I$$DIV               
0     003f7b93  I$$MOD               
0     003f7c23  I$$TOFD              
0     003f7b08  L$$DIV               
0     003f7b17  L$$MOD               
0     003f7c79  L$$TOFD              
0     003f7ce1  LL$$AND              
0     003f7c05  LL$$CMP              
0     003f756c  LL$$DIV              
0     003f75a8  LL$$MOD              
0     003f7ce9  LL$$OR               
0     003f7cf1  LL$$XOR              
0     003f7b25  UL$$DIV              
0     003f7b2c  UL$$MOD              
0     003f7c17  ULL$$CMP             
0     003f75e2  ULL$$DIV             
0     003f7611  ULL$$MOD             
0     003f76d2  _ADCINT1_ISR         
0     003f76d7  _ADCINT2_ISR         
0     003f7740  _ADCINT3_ISR         
0     003f7745  _ADCINT4_ISR         
0     003f774a  _ADCINT5_ISR         
0     003f774f  _ADCINT6_ISR         
0     003f7754  _ADCINT7_ISR         
0     003f7759  _ADCINT8_ISR         
0     003f76e6  _ADCINT9_ISR         
0     003f729d  _AdcChanSelect       
0     003f7312  _AdcConversion       
0     003f7276  _AdcOffsetSelfCal    
1     00007100  _AdcRegs             
1     00000b00  _AdcResult           
1     00006400  _Comp1Regs           
1     00006420  _Comp2Regs           
1     00000c00  _CpuTimer0Regs       
1     00000c08  _CpuTimer1Regs       
1     00000c10  _CpuTimer2Regs       
1     003f7ff8  _CsmPwl              
1     00000ae0  _CsmRegs             
0     003f74ef  _CsmUnlock           
0     003f767d  _DATALOG_ISR         
0     003f7d2f  _DSP28x_DisableInt   
0     003f7d33  _DSP28x_RestoreInt   
0     0000801b  _DSP28x_usDelay      
1     00000880  _DevEmuRegs          
0     003f7460  _DisableDog          
0     003f771d  _ECAP1_INT_ISR       
1     00006a00  _ECap1Regs           
0     003f7763  _EMPTY_ISR           
0     003f7687  _EMUINT_ISR          
0     003f7709  _EPWM1_INT_ISR       
0     003f76f5  _EPWM1_TZINT_ISR     
0     003f770e  _EPWM2_INT_ISR       
0     003f76fa  _EPWM2_TZINT_ISR     
0     003f7713  _EPWM3_INT_ISR       
0     003f76ff  _EPWM3_TZINT_ISR     
0     003f7718  _EPWM4_INT_ISR       
0     003f7704  _EPWM4_TZINT_ISR     
1     00006800  _EPwm1Regs           
1     00006840  _EPwm2Regs           
1     00006880  _EPwm3Regs           
1     000068c0  _EPwm4Regs           
1     00000d01  _EmuBMode            
1     00000d00  _EmuKey              
0     003f7b51  _EnableInterrupts    
0     003f7556  _ExtOscSel           
1     00000a80  _FlashRegs           
1     00000d04  _Flash_CPUScaleFactor
1     00000d02  _Flash_CallbackPtr   
1     00006f80  _GpioCtrlRegs        
1     00006fc0  _GpioDataRegs        
1     00006fe0  _GpioIntRegs         
0     003f772c  _I2CINT1A_ISR        
0     003f7731  _I2CINT2A_ISR        
1     00007900  _I2caRegs            
0     003f7691  _ILLEGAL_ISR         
0     003f7673  _INT13_ISR           
0     003f7678  _INT14_ISR           
0     003f7235  _InitAdc             
0     003f7254  _InitAdcAio          
0     003f791c  _InitEPwm            
0     003f7926  _InitEPwm1Gpio       
0     003f7938  _InitEPwm2Gpio       
0     003f794a  _InitEPwm3Gpio       
0     003f795e  _InitEPwm4Gpio       
0     003f791d  _InitEPwmGpio        
0     003f7972  _InitEPwmSyncGpio    
0     00008000  _InitFlash           
0     003f74bd  _InitPeripheralClocks
0     003f7b32  _InitPieCtrl         
0     003f7b5a  _InitPieVectTable    
0     003f7468  _InitPll             
0     003f7c95  _InitSci             
0     003f7c96  _InitSciGpio         
0     003f7c99  _InitSciaGpio        
0     003f743c  _InitSysCtrl         
0     003f7982  _InitTzGpio          
0     003f7520  _IntOsc1Sel          
0     003f7530  _IntOsc2Sel          
0     003f768c  _NMI_ISR             
1     00007060  _NmiIntruptRegs      
0     003f7768  _PIE_RESERVED        
1     003d7fff  _PartIdRegs          
1     00000ce0  _PieCtrlRegs         
1     00000d00  _PieVectTable        
0     003f6102  _PieVectTableInit    
0     003f7682  _RTOSINT_ISR         
abs   0000001f  _RamfuncsLoadSize    
0     003f6292  _RamfuncsLoadStart   
0     00008000  _RamfuncsRunStart    
0     003f7736  _SCIRXINTA_ISR       
0     003f773b  _SCITXINTA_ISR       
0     003f7722  _SPIRXINTA_ISR       
0     003f7727  _SPITXINTA_ISR       
1     00007050  _SciaRegs            
0     003f7456  _ServiceDog          
1     00007040  _SpiaRegs            
1     00007010  _SysCtrlRegs         
1     00000985  _SysPwrCtrlRegs      
0     003f76eb  _TINT0_ISR           
0     003f76c3  _USER10_ISR          
0     003f76c8  _USER11_ISR          
0     003f76cd  _USER12_ISR          
0     003f7696  _USER1_ISR           
0     003f769b  _USER2_ISR           
0     003f76a0  _USER3_ISR           
0     003f76a5  _USER4_ISR           
0     003f76aa  _USER5_ISR           
0     003f76af  _USER6_ISR           
0     003f76b4  _USER7_ISR           
0     003f76b9  _USER8_ISR           
0     003f76be  _USER9_ISR           
0     003f76f0  _WAKEINT_ISR         
0     003f76dc  _XINT1_ISR           
0     003f76e1  _XINT2_ISR           
0     003f775e  _XINT3_ISR           
1     00007070  _XIntruptRegs        
0     003f7542  _XtalOscSel          
1     00000250  __STACK_END          
abs   00000200  __STACK_SIZE         
1     00008a90  ___TI_cleanup_ptr    
1     00008a92  ___TI_dtors_ptr      
0     003f6d25  ___TI_printfi        
abs   ffffffff  ___binit__           
abs   ffffffff  ___c_args__          
0     003f2000  ___cinit__           
abs   ffffffff  ___etext__           
abs   ffffffff  ___pinit__           
abs   ffffffff  ___text__            
0     003f7caf  __args_main          
0     003f6000  __ctypes_            
1     00008a94  __lock               
0     003f7d71  __nop                
0     003f7d6d  __register_lock      
0     003f7d69  __register_unlock    
1     00000050  __stack              
1     00008a96  __unlock             
0     003f7cc8  _abort               
1     00008806  _adcMenu             
1     0000880c  _adcString1          
1     00008a40  _adcString2          
1     0000885b  _adcString3          
0     003f7a7f  _atoi                
0     003f79fa  _c_int00             
1     00008820  _clearScreen         
0     003f6eab  _doAdcMenu           
0     003f7070  _doGpioMenu          
0     003f6fa1  _doPwmMenu           
0     003f71c9  _epwmInit            
1     00008a8f  _errno               
0     003f7cca  _exit                
0     003f7d10  _frexp               
1     00008816  _gpioMenu            
1     00008802  _gpioStatus0         
1     00008805  _gpioStatus1         
1     00008804  _gpioStatus2         
1     00008800  _gpioStatus3         
1     00008840  _gpioString1         
1     00008980  _gpioString2         
1     00008a00  _gpioString3         
0     003f7a3e  _ldexp               
0     003f7ab0  _ltoa                
0     003f6e1f  _main                
0     003f7d44  _memccpy             
0     003f7c40  _memcpy              
0     003f7d52  _memset              
1     00008940  _menuDivider         
1     0000884c  _menuGoBack          
1     000089c0  _nope                
0     003f7139  _printMenu           
1     0000882c  _pwmMenu             
1     00008801  _pwmStatus           
1     000088de  _pwmString1          
1     00008880  _pwmString2          
1     0000889e  _pwmString3          
1     000088c0  _pwmString4          
1     00008900  _pwm_is_kill         
1     00008803  _read                
0     003f776d  _rsvd_ISR            
0     003f71a1  _scia_Byte2Hex       
0     003f71c4  _scia_PrintLF        
0     003f7151  _scia_fifo_init      
0     003f7159  _scia_init           
0     003f7179  _scia_msg            
0     003f718c  _scia_read           
0     003f716d  _scia_xmit           
0     003f7d2c  _setDBGIER           
0     003f799d  _snprintf            
0     003f7d5e  _strchr              
0     003f7d83  _strcpy              
0     003f7d7b  _strlen              
abs   ffffffff  binit                
0     003f2000  cinit                
0     003f7ff6  code_start           
abs   ffffffff  etext                
abs   ffffffff  pinit                


GLOBAL SYMBOLS: SORTED BY Symbol Address 

page  address   name                 
----  -------   ----                 
0     00008000  _InitFlash           
0     00008000  _RamfuncsRunStart    
0     0000801b  _DSP28x_usDelay      
0     003f2000  ___cinit__           
0     003f2000  cinit                
0     003f6000  __ctypes_            
0     003f6102  _PieVectTableInit    
0     003f6292  _RamfuncsLoadStart   
0     003f6d25  ___TI_printfi        
0     003f6e1f  _main                
0     003f6eab  _doAdcMenu           
0     003f6fa1  _doPwmMenu           
0     003f7070  _doGpioMenu          
0     003f7139  _printMenu           
0     003f7151  _scia_fifo_init      
0     003f7159  _scia_init           
0     003f716d  _scia_xmit           
0     003f7179  _scia_msg            
0     003f718c  _scia_read           
0     003f71a1  _scia_Byte2Hex       
0     003f71c4  _scia_PrintLF        
0     003f71c9  _epwmInit            
0     003f7235  _InitAdc             
0     003f7254  _InitAdcAio          
0     003f7276  _AdcOffsetSelfCal    
0     003f729d  _AdcChanSelect       
0     003f7312  _AdcConversion       
0     003f743c  _InitSysCtrl         
0     003f7456  _ServiceDog          
0     003f7460  _DisableDog          
0     003f7468  _InitPll             
0     003f74bd  _InitPeripheralClocks
0     003f74ef  _CsmUnlock           
0     003f7520  _IntOsc1Sel          
0     003f7530  _IntOsc2Sel          
0     003f7542  _XtalOscSel          
0     003f7556  _ExtOscSel           
0     003f756c  LL$$DIV              
0     003f75a8  LL$$MOD              
0     003f75e2  ULL$$DIV             
0     003f7611  ULL$$MOD             
0     003f7673  _INT13_ISR           
0     003f7678  _INT14_ISR           
0     003f767d  _DATALOG_ISR         
0     003f7682  _RTOSINT_ISR         
0     003f7687  _EMUINT_ISR          
0     003f768c  _NMI_ISR             
0     003f7691  _ILLEGAL_ISR         
0     003f7696  _USER1_ISR           
0     003f769b  _USER2_ISR           
0     003f76a0  _USER3_ISR           
0     003f76a5  _USER4_ISR           
0     003f76aa  _USER5_ISR           
0     003f76af  _USER6_ISR           
0     003f76b4  _USER7_ISR           
0     003f76b9  _USER8_ISR           
0     003f76be  _USER9_ISR           
0     003f76c3  _USER10_ISR          
0     003f76c8  _USER11_ISR          
0     003f76cd  _USER12_ISR          
0     003f76d2  _ADCINT1_ISR         
0     003f76d7  _ADCINT2_ISR         
0     003f76dc  _XINT1_ISR           
0     003f76e1  _XINT2_ISR           
0     003f76e6  _ADCINT9_ISR         
0     003f76eb  _TINT0_ISR           
0     003f76f0  _WAKEINT_ISR         
0     003f76f5  _EPWM1_TZINT_ISR     
0     003f76fa  _EPWM2_TZINT_ISR     
0     003f76ff  _EPWM3_TZINT_ISR     
0     003f7704  _EPWM4_TZINT_ISR     
0     003f7709  _EPWM1_INT_ISR       
0     003f770e  _EPWM2_INT_ISR       
0     003f7713  _EPWM3_INT_ISR       
0     003f7718  _EPWM4_INT_ISR       
0     003f771d  _ECAP1_INT_ISR       
0     003f7722  _SPIRXINTA_ISR       
0     003f7727  _SPITXINTA_ISR       
0     003f772c  _I2CINT1A_ISR        
0     003f7731  _I2CINT2A_ISR        
0     003f7736  _SCIRXINTA_ISR       
0     003f773b  _SCITXINTA_ISR       
0     003f7740  _ADCINT3_ISR         
0     003f7745  _ADCINT4_ISR         
0     003f774a  _ADCINT5_ISR         
0     003f774f  _ADCINT6_ISR         
0     003f7754  _ADCINT7_ISR         
0     003f7759  _ADCINT8_ISR         
0     003f775e  _XINT3_ISR           
0     003f7763  _EMPTY_ISR           
0     003f7768  _PIE_RESERVED        
0     003f776d  _rsvd_ISR            
0     003f7772  FD$$ADD              
0     003f780e  FD$$DIV              
0     003f7899  FD$$MPY              
0     003f791c  _InitEPwm            
0     003f791d  _InitEPwmGpio        
0     003f7926  _InitEPwm1Gpio       
0     003f7938  _InitEPwm2Gpio       
0     003f794a  _InitEPwm3Gpio       
0     003f795e  _InitEPwm4Gpio       
0     003f7972  _InitEPwmSyncGpio    
0     003f7982  _InitTzGpio          
0     003f799d  _snprintf            
0     003f79fa  _c_int00             
0     003f7a3e  _ldexp               
0     003f7a7f  _atoi                
0     003f7ab0  _ltoa                
0     003f7ade  FD$$CMP              
0     003f7b08  L$$DIV               
0     003f7b17  L$$MOD               
0     003f7b25  UL$$DIV              
0     003f7b2c  UL$$MOD              
0     003f7b32  _InitPieCtrl         
0     003f7b51  _EnableInterrupts    
0     003f7b5a  _InitPieVectTable    
0     003f7b82  I$$DIV               
0     003f7b93  I$$MOD               
0     003f7ba4  FD$$TOFS             
0     003f7bc5  FD$$TOI              
0     003f7be6  FD$$TOL              
0     003f7c05  LL$$CMP              
0     003f7c17  ULL$$CMP             
0     003f7c23  I$$TOFD              
0     003f7c40  _memcpy              
0     003f7c5d  FS$$TOFD             
0     003f7c79  L$$TOFD              
0     003f7c95  _InitSci             
0     003f7c96  _InitSciGpio         
0     003f7c99  _InitSciaGpio        
0     003f7caf  __args_main          
0     003f7cc8  C$$EXIT              
0     003f7cc8  _abort               
0     003f7cca  _exit                
0     003f7ce1  LL$$AND              
0     003f7ce9  LL$$OR               
0     003f7cf1  LL$$XOR              
0     003f7cf9  FS$$CMP              
0     003f7d10  _frexp               
0     003f7d2c  _setDBGIER           
0     003f7d2f  _DSP28x_DisableInt   
0     003f7d33  _DSP28x_RestoreInt   
0     003f7d36  FD$$SUB              
0     003f7d44  _memccpy             
0     003f7d52  _memset              
0     003f7d5e  _strchr              
0     003f7d69  __register_unlock    
0     003f7d6d  __register_lock      
0     003f7d71  __nop                
0     003f7d72  FD$$NEG              
0     003f7d7b  _strlen              
0     003f7d83  _strcpy              
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
1     00008801  _pwmStatus           
1     00008802  _gpioStatus0         
1     00008803  _read                
1     00008804  _gpioStatus2         
1     00008805  _gpioStatus1         
1     00008806  _adcMenu             
1     0000880c  _adcString1          
1     00008816  _gpioMenu            
1     00008820  _clearScreen         
1     0000882c  _pwmMenu             
1     00008840  _gpioString1         
1     0000884c  _menuGoBack          
1     0000885b  _adcString3          
1     00008880  _pwmString2          
1     0000889e  _pwmString3          
1     000088c0  _pwmString4          
1     000088de  _pwmString1          
1     00008900  _pwm_is_kill         
1     00008940  _menuDivider         
1     00008980  _gpioString2         
1     000089c0  _nope                
1     00008a00  _gpioString3         
1     00008a40  _adcString2          
1     00008a8f  _errno               
1     00008a90  ___TI_cleanup_ptr    
1     00008a92  ___TI_dtors_ptr      
1     00008a94  __lock               
1     00008a96  __unlock             
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

[228 symbols]
