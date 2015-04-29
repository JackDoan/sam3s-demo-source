******************************************************************************
             TMS320C2000 Linker Unix v6.4.4                    
******************************************************************************
>> Linked Wed Apr 29 17:59:26 2015

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
  FLASHA                003f6000   00001f80  00000a10  00001570  RWIX
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
  DRAML0                00008800   00000800  00000140  000006c0  RWIX
  PARTID                003d7fff   00000001  00000001  00000000  RWIX
  FLASHB                003f4000   00002000  00000000  00002000  RWIX
  CSM_PWL               003f7ff8   00000008  00000008  00000000  RWIX


SECTION ALLOCATION MAP

 output                                  attributes/
section   page    origin      length       input sections
--------  ----  ----------  ----------   ----------------
ramfuncs   0    003f618b    0000001f     RUN ADDR = 00008000
                  003f618b    0000001b     sysctrl.obj (ramfuncs)
                  003f61a6    00000004     F2802x_asmfuncs.obj (ramfuncs)

.cinit     0    003f68e0    00000130     
                  003f68e0    0000011a     main.obj (.cinit)
                  003f69fa    0000000a     rts2800_ml.lib : exit.obj (.cinit)
                  003f6a04    00000005                    : _lock.obj (.cinit:__lock)
                  003f6a09    00000005                    : _lock.obj (.cinit:__unlock)
                  003f6a0e    00000002     --HOLE-- [fill = 0]

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

.ebss      1    00008800    00000140     UNINITIALIZED
                  00008800    00000137     main.obj (.ebss)
                  00008937    00000001     --HOLE--
                  00008938    00000004     rts2800_ml.lib : exit.obj (.ebss)
                  0000893c    00000002                    : _lock.obj (.ebss:__lock)
                  0000893e    00000002                    : _lock.obj (.ebss:__unlock)

.econst    0    003f6000    0000018b     
                  003f6000    00000100     pievect.obj (.econst)
                  003f6100    00000026     main.obj (.econst:.string:_$P$T5$6)
                  003f6126    00000012     main.obj (.econst:.string:_$P$T0$1)
                  003f6138    0000000f     main.obj (.econst:.string:_$P$T8$9)
                  003f6147    0000000e     main.obj (.econst:.string:_$P$T6$7)
                  003f6155    0000000e     main.obj (.econst:.string:_$P$T7$8)
                  003f6163    0000000d     main.obj (.econst:.string:_$P$T4$5)
                  003f6170    0000000a     main.obj (.econst:.string:_$P$T3$4)
                  003f617a    00000007     main.obj (.econst:.string:_$P$T1$2)
                  003f6181    00000007     main.obj (.econst:.string:_$P$T2$3)
                  003f6188    00000003     main.obj (.econst:.string)

.reset     0    003fffc0    00000002     DSECT
                  003fffc0    00000002     rts2800_ml.lib : boot.obj (.reset)

vectors    0    003fffc2    00000000     DSECT

.text      0    003f61aa    00000736     
                  003f61aa    000002b9     main.obj (.text)
                  003f6463    00000130     sysctrl.obj (.text)
                  003f6593    000000ff     default_isr.obj (.text:retain)
                  003f6692    00000078     rts2800_ml.lib : fs_add.obj (.text)
                  003f670a    0000005a                    : fs_mpy.obj (.text)
                  003f6764    00000044                    : boot.obj (.text)
                  003f67a8    0000002a                    : l_div.obj (.text)
                  003f67d2    00000029                    : fs_tol.obj (.text)
                  003f67fb    00000025                    : fs_toi.obj (.text)
                  003f6820    00000022                    : i_div.obj (.text)
                  003f6842    0000001d                    : memcpy.obj (.text)
                  003f685f    0000001a                    : l_tofs.obj (.text)
                  003f6879    0000001a     sci.obj (.text)
                  003f6893    00000019     rts2800_ml.lib : args_main.obj (.text)
                  003f68ac    00000019                    : exit.obj (.text)
                  003f68c5    00000012     F2802x_asmfuncs.obj (.text)
                  003f68d7    00000009     rts2800_ml.lib : _lock.obj (.text)


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

00008800     220 (00008800)     _read
00008801     220 (00008800)     _gpioStatus0
00008802     220 (00008800)     _gpioStatus1
00008803     220 (00008800)     _gpioStatus2
00008804     220 (00008800)     _gpioStatus3
00008806     220 (00008800)     _gpioMenu
00008810     220 (00008800)     _clearScreen
0000881b     220 (00008800)     _gpioString1
00008827     220 (00008800)     _menuGoBack

00008840     221 (00008840)     _menuDivider

00008880     222 (00008880)     _gpioString2

000088c0     223 (000088c0)     _nope

00008900     224 (00008900)     _gpioString3
00008938     224 (00008900)     ___TI_cleanup_ptr
0000893a     224 (00008900)     ___TI_dtors_ptr
0000893c     224 (00008900)     __lock
0000893e     224 (00008900)     __unlock

003d7fff    f5ff (003d7fc0)     _PartIdRegs

003f6000    fd80 (003f6000)     _PieVectTableInit

003f7ff8    fdff (003f7fc0)     _CsmPwl


GLOBAL SYMBOLS: SORTED ALPHABETICALLY BY Name 

page  address   name                 
----  -------   ----                 
abs   ffffffff  .text                
0     003f68ac  C$$EXIT              
0     003f6697  FS$$ADD              
0     003f670a  FS$$MPY              
0     003f6692  FS$$SUB              
0     003f67fb  FS$$TOI              
0     003f67d2  FS$$TOL              
0     003f6820  I$$DIV               
0     003f6831  I$$MOD               
0     003f67a8  L$$DIV               
0     003f67b7  L$$MOD               
0     003f685f  L$$TOFS              
0     003f67c5  UL$$DIV              
0     003f67cc  UL$$MOD              
0     003f65f2  _ADCINT1_ISR         
0     003f65f7  _ADCINT2_ISR         
0     003f6660  _ADCINT3_ISR         
0     003f6665  _ADCINT4_ISR         
0     003f666a  _ADCINT5_ISR         
0     003f666f  _ADCINT6_ISR         
0     003f6674  _ADCINT7_ISR         
0     003f6679  _ADCINT8_ISR         
0     003f6606  _ADCINT9_ISR         
1     00007100  _AdcRegs             
1     00000b00  _AdcResult           
1     00006400  _Comp1Regs           
1     00006420  _Comp2Regs           
1     00000c00  _CpuTimer0Regs       
1     00000c08  _CpuTimer1Regs       
1     00000c10  _CpuTimer2Regs       
1     003f7ff8  _CsmPwl              
1     00000ae0  _CsmRegs             
0     003f6516  _CsmUnlock           
0     003f659d  _DATALOG_ISR         
0     003f68d0  _DSP28x_DisableInt   
0     003f68d4  _DSP28x_RestoreInt   
0     0000801b  _DSP28x_usDelay      
1     00000880  _DevEmuRegs          
0     003f6487  _DisableDog          
0     003f663d  _ECAP1_INT_ISR       
1     00006a00  _ECap1Regs           
0     003f6683  _EMPTY_ISR           
0     003f65a7  _EMUINT_ISR          
0     003f6629  _EPWM1_INT_ISR       
0     003f6615  _EPWM1_TZINT_ISR     
0     003f662e  _EPWM2_INT_ISR       
0     003f661a  _EPWM2_TZINT_ISR     
0     003f6633  _EPWM3_INT_ISR       
0     003f661f  _EPWM3_TZINT_ISR     
0     003f6638  _EPWM4_INT_ISR       
0     003f6624  _EPWM4_TZINT_ISR     
1     00006800  _EPwm1Regs           
1     00006840  _EPwm2Regs           
1     00006880  _EPwm3Regs           
1     000068c0  _EPwm4Regs           
1     00000d01  _EmuBMode            
1     00000d00  _EmuKey              
0     003f657d  _ExtOscSel           
1     00000a80  _FlashRegs           
1     00000d04  _Flash_CPUScaleFactor
1     00000d02  _Flash_CallbackPtr   
0     003f63d2  _FloatToString       
1     00006f80  _GpioCtrlRegs        
1     00006fc0  _GpioDataRegs        
1     00006fe0  _GpioIntRegs         
0     003f664c  _I2CINT1A_ISR        
0     003f6651  _I2CINT2A_ISR        
1     00007900  _I2caRegs            
0     003f65b1  _ILLEGAL_ISR         
0     003f6593  _INT13_ISR           
0     003f6598  _INT14_ISR           
0     00008000  _InitFlash           
0     003f64e4  _InitPeripheralClocks
0     003f648f  _InitPll             
0     003f6879  _InitSci             
0     003f687a  _InitSciGpio         
0     003f687d  _InitSciaGpio        
0     003f6463  _InitSysCtrl         
0     003f6547  _IntOsc1Sel          
0     003f6557  _IntOsc2Sel          
0     003f65ac  _NMI_ISR             
1     00007060  _NmiIntruptRegs      
0     003f6688  _PIE_RESERVED        
1     003d7fff  _PartIdRegs          
1     00000ce0  _PieCtrlRegs         
1     00000d00  _PieVectTable        
0     003f6000  _PieVectTableInit    
0     003f65a2  _RTOSINT_ISR         
abs   0000001f  _RamfuncsLoadSize    
0     003f618b  _RamfuncsLoadStart   
0     00008000  _RamfuncsRunStart    
0     003f6656  _SCIRXINTA_ISR       
0     003f665b  _SCITXINTA_ISR       
0     003f6642  _SPIRXINTA_ISR       
0     003f6647  _SPITXINTA_ISR       
1     00007050  _SciaRegs            
0     003f647d  _ServiceDog          
1     00007040  _SpiaRegs            
1     00007010  _SysCtrlRegs         
1     00000985  _SysPwrCtrlRegs      
0     003f660b  _TINT0_ISR           
0     003f65e3  _USER10_ISR          
0     003f65e8  _USER11_ISR          
0     003f65ed  _USER12_ISR          
0     003f65b6  _USER1_ISR           
0     003f65bb  _USER2_ISR           
0     003f65c0  _USER3_ISR           
0     003f65c5  _USER4_ISR           
0     003f65ca  _USER5_ISR           
0     003f65cf  _USER6_ISR           
0     003f65d4  _USER7_ISR           
0     003f65d9  _USER8_ISR           
0     003f65de  _USER9_ISR           
0     003f6610  _WAKEINT_ISR         
0     003f65fc  _XINT1_ISR           
0     003f6601  _XINT2_ISR           
0     003f667e  _XINT3_ISR           
1     00007070  _XIntruptRegs        
0     003f6569  _XtalOscSel          
1     00000250  __STACK_END          
abs   00000200  __STACK_SIZE         
1     00008938  ___TI_cleanup_ptr    
1     0000893a  ___TI_dtors_ptr      
abs   ffffffff  ___binit__           
abs   ffffffff  ___c_args__          
0     003f68e0  ___cinit__           
abs   ffffffff  ___etext__           
abs   ffffffff  ___pinit__           
abs   ffffffff  ___text__            
0     003f6893  __args_main          
1     0000893c  __lock               
0     003f68df  __nop                
0     003f68db  __register_lock      
0     003f68d7  __register_unlock    
1     00000050  __stack              
1     0000893e  __unlock             
0     003f68ac  _abort               
0     003f6764  _c_int00             
1     00008810  _clearScreen         
0     003f6273  _doAdcMenu           
0     003f6279  _doGpioMenu          
0     003f6276  _doPwmMenu           
0     003f68ae  _exit                
1     00008806  _gpioMenu            
1     00008801  _gpioStatus0         
1     00008802  _gpioStatus1         
1     00008803  _gpioStatus2         
1     00008804  _gpioStatus3         
1     0000881b  _gpioString1         
1     00008880  _gpioString2         
1     00008900  _gpioString3         
0     003f61aa  _main                
0     003f6842  _memcpy              
1     00008840  _menuDivider         
1     00008827  _menuGoBack          
1     000088c0  _nope                
0     003f6342  _printMenu           
1     00008800  _read                
0     003f668d  _rsvd_ISR            
0     003f63aa  _scia_Byte2Hex       
0     003f63cd  _scia_PrintLF        
0     003f6362  _scia_echoback_init  
0     003f635a  _scia_fifo_init      
0     003f6382  _scia_msg            
0     003f6395  _scia_read           
0     003f6376  _scia_xmit           
0     003f68cd  _setDBGIER           
abs   ffffffff  binit                
0     003f68e0  cinit                
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
0     003f618b  _RamfuncsLoadStart   
0     003f61aa  _main                
0     003f6273  _doAdcMenu           
0     003f6276  _doPwmMenu           
0     003f6279  _doGpioMenu          
0     003f6342  _printMenu           
0     003f635a  _scia_fifo_init      
0     003f6362  _scia_echoback_init  
0     003f6376  _scia_xmit           
0     003f6382  _scia_msg            
0     003f6395  _scia_read           
0     003f63aa  _scia_Byte2Hex       
0     003f63cd  _scia_PrintLF        
0     003f63d2  _FloatToString       
0     003f6463  _InitSysCtrl         
0     003f647d  _ServiceDog          
0     003f6487  _DisableDog          
0     003f648f  _InitPll             
0     003f64e4  _InitPeripheralClocks
0     003f6516  _CsmUnlock           
0     003f6547  _IntOsc1Sel          
0     003f6557  _IntOsc2Sel          
0     003f6569  _XtalOscSel          
0     003f657d  _ExtOscSel           
0     003f6593  _INT13_ISR           
0     003f6598  _INT14_ISR           
0     003f659d  _DATALOG_ISR         
0     003f65a2  _RTOSINT_ISR         
0     003f65a7  _EMUINT_ISR          
0     003f65ac  _NMI_ISR             
0     003f65b1  _ILLEGAL_ISR         
0     003f65b6  _USER1_ISR           
0     003f65bb  _USER2_ISR           
0     003f65c0  _USER3_ISR           
0     003f65c5  _USER4_ISR           
0     003f65ca  _USER5_ISR           
0     003f65cf  _USER6_ISR           
0     003f65d4  _USER7_ISR           
0     003f65d9  _USER8_ISR           
0     003f65de  _USER9_ISR           
0     003f65e3  _USER10_ISR          
0     003f65e8  _USER11_ISR          
0     003f65ed  _USER12_ISR          
0     003f65f2  _ADCINT1_ISR         
0     003f65f7  _ADCINT2_ISR         
0     003f65fc  _XINT1_ISR           
0     003f6601  _XINT2_ISR           
0     003f6606  _ADCINT9_ISR         
0     003f660b  _TINT0_ISR           
0     003f6610  _WAKEINT_ISR         
0     003f6615  _EPWM1_TZINT_ISR     
0     003f661a  _EPWM2_TZINT_ISR     
0     003f661f  _EPWM3_TZINT_ISR     
0     003f6624  _EPWM4_TZINT_ISR     
0     003f6629  _EPWM1_INT_ISR       
0     003f662e  _EPWM2_INT_ISR       
0     003f6633  _EPWM3_INT_ISR       
0     003f6638  _EPWM4_INT_ISR       
0     003f663d  _ECAP1_INT_ISR       
0     003f6642  _SPIRXINTA_ISR       
0     003f6647  _SPITXINTA_ISR       
0     003f664c  _I2CINT1A_ISR        
0     003f6651  _I2CINT2A_ISR        
0     003f6656  _SCIRXINTA_ISR       
0     003f665b  _SCITXINTA_ISR       
0     003f6660  _ADCINT3_ISR         
0     003f6665  _ADCINT4_ISR         
0     003f666a  _ADCINT5_ISR         
0     003f666f  _ADCINT6_ISR         
0     003f6674  _ADCINT7_ISR         
0     003f6679  _ADCINT8_ISR         
0     003f667e  _XINT3_ISR           
0     003f6683  _EMPTY_ISR           
0     003f6688  _PIE_RESERVED        
0     003f668d  _rsvd_ISR            
0     003f6692  FS$$SUB              
0     003f6697  FS$$ADD              
0     003f670a  FS$$MPY              
0     003f6764  _c_int00             
0     003f67a8  L$$DIV               
0     003f67b7  L$$MOD               
0     003f67c5  UL$$DIV              
0     003f67cc  UL$$MOD              
0     003f67d2  FS$$TOL              
0     003f67fb  FS$$TOI              
0     003f6820  I$$DIV               
0     003f6831  I$$MOD               
0     003f6842  _memcpy              
0     003f685f  L$$TOFS              
0     003f6879  _InitSci             
0     003f687a  _InitSciGpio         
0     003f687d  _InitSciaGpio        
0     003f6893  __args_main          
0     003f68ac  C$$EXIT              
0     003f68ac  _abort               
0     003f68ae  _exit                
0     003f68cd  _setDBGIER           
0     003f68d0  _DSP28x_DisableInt   
0     003f68d4  _DSP28x_RestoreInt   
0     003f68d7  __register_unlock    
0     003f68db  __register_lock      
0     003f68df  __nop                
0     003f68e0  ___cinit__           
0     003f68e0  cinit                
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
1     00008800  _read                
1     00008801  _gpioStatus0         
1     00008802  _gpioStatus1         
1     00008803  _gpioStatus2         
1     00008804  _gpioStatus3         
1     00008806  _gpioMenu            
1     00008810  _clearScreen         
1     0000881b  _gpioString1         
1     00008827  _menuGoBack          
1     00008840  _menuDivider         
1     00008880  _gpioString2         
1     000088c0  _nope                
1     00008900  _gpioString3         
1     00008938  ___TI_cleanup_ptr    
1     0000893a  ___TI_dtors_ptr      
1     0000893c  __lock               
1     0000893e  __unlock             
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

[172 symbols]
