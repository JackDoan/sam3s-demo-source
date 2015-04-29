******************************************************************************
             TMS320C2000 Linker Unix v6.4.4                    
******************************************************************************
>> Linked Wed Apr 29 15:40:15 2015

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
  FLASHA                003f6000   00001f80  00000762  0000181e  RWIX
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
  DRAML0                00008800   00000800  00000008  000007f8  RWIX
  PARTID                003d7fff   00000001  00000001  00000000  RWIX
  FLASHB                003f4000   00002000  00000000  00002000  RWIX
  CSM_PWL               003f7ff8   00000008  00000008  00000000  RWIX


SECTION ALLOCATION MAP

 output                                  attributes/
section   page    origin      length       input sections
--------  ----  ----------  ----------   ----------------
ramfuncs   0    003f613b    0000001f     RUN ADDR = 00008000
                  003f613b    0000001b     sysctrl.obj (ramfuncs)
                  003f6156    00000004     F2802x_asmfuncs.obj (ramfuncs)

.cinit     0    003f674c    00000016     
                  003f674c    0000000a     rts2800_ml.lib : exit.obj (.cinit)
                  003f6756    00000005                    : _lock.obj (.cinit:__lock)
                  003f675b    00000005                    : _lock.obj (.cinit:__unlock)
                  003f6760    00000002     --HOLE-- [fill = 0]

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

.ebss      1    00008800    00000008     UNINITIALIZED
                  00008800    00000004     rts2800_ml.lib : exit.obj (.ebss)
                  00008804    00000002                    : _lock.obj (.ebss:__lock)
                  00008806    00000002                    : _lock.obj (.ebss:__unlock)

.econst    0    003f6000    0000013b     
                  003f6000    00000100     pievect.obj (.econst)
                  003f6100    00000021     main.obj (.econst:.string:_$P$T1$2)
                  003f6121    00000017     main.obj (.econst:.string:_$P$T0$1)
                  003f6138    00000003     main.obj (.econst:.string)

.reset     0    003fffc0    00000002     DSECT
                  003fffc0    00000002     rts2800_ml.lib : boot.obj (.reset)

vectors    0    003fffc2    00000000     DSECT

.text      0    003f615a    000005f2     
                  003f615a    00000175     main.obj (.text)
                  003f62cf    00000130     sysctrl.obj (.text)
                  003f63ff    000000ff     default_isr.obj (.text:retain)
                  003f64fe    00000078     rts2800_ml.lib : fs_add.obj (.text)
                  003f6576    0000005a                    : fs_mpy.obj (.text)
                  003f65d0    00000044                    : boot.obj (.text)
                  003f6614    0000002a                    : l_div.obj (.text)
                  003f663e    00000029                    : fs_tol.obj (.text)
                  003f6667    00000025                    : fs_toi.obj (.text)
                  003f668c    00000022                    : i_div.obj (.text)
                  003f66ae    0000001d                    : memcpy.obj (.text)
                  003f66cb    0000001a                    : l_tofs.obj (.text)
                  003f66e5    0000001a     sci.obj (.text)
                  003f66ff    00000019     rts2800_ml.lib : args_main.obj (.text)
                  003f6718    00000019                    : exit.obj (.text)
                  003f6731    00000012     F2802x_asmfuncs.obj (.text)
                  003f6743    00000009     rts2800_ml.lib : _lock.obj (.text)


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

00008800     220 (00008800)     ___TI_cleanup_ptr
00008802     220 (00008800)     ___TI_dtors_ptr
00008804     220 (00008800)     __lock
00008806     220 (00008800)     __unlock

003d7fff    f5ff (003d7fc0)     _PartIdRegs

003f6000    fd80 (003f6000)     _PieVectTableInit

003f7ff8    fdff (003f7fc0)     _CsmPwl


GLOBAL SYMBOLS: SORTED ALPHABETICALLY BY Name 

page  address   name                 
----  -------   ----                 
abs   ffffffff  .text                
0     003f6718  C$$EXIT              
0     003f6503  FS$$ADD              
0     003f6576  FS$$MPY              
0     003f64fe  FS$$SUB              
0     003f6667  FS$$TOI              
0     003f663e  FS$$TOL              
0     003f668c  I$$DIV               
0     003f669d  I$$MOD               
0     003f6614  L$$DIV               
0     003f6623  L$$MOD               
0     003f66cb  L$$TOFS              
0     003f6631  UL$$DIV              
0     003f6638  UL$$MOD              
0     003f645e  _ADCINT1_ISR         
0     003f6463  _ADCINT2_ISR         
0     003f64cc  _ADCINT3_ISR         
0     003f64d1  _ADCINT4_ISR         
0     003f64d6  _ADCINT5_ISR         
0     003f64db  _ADCINT6_ISR         
0     003f64e0  _ADCINT7_ISR         
0     003f64e5  _ADCINT8_ISR         
0     003f6472  _ADCINT9_ISR         
1     00007100  _AdcRegs             
1     00000b00  _AdcResult           
1     00006400  _Comp1Regs           
1     00006420  _Comp2Regs           
1     00000c00  _CpuTimer0Regs       
1     00000c08  _CpuTimer1Regs       
1     00000c10  _CpuTimer2Regs       
1     003f7ff8  _CsmPwl              
1     00000ae0  _CsmRegs             
0     003f6382  _CsmUnlock           
0     003f6409  _DATALOG_ISR         
0     003f673c  _DSP28x_DisableInt   
0     003f6740  _DSP28x_RestoreInt   
0     0000801b  _DSP28x_usDelay      
1     00000880  _DevEmuRegs          
0     003f62f3  _DisableDog          
0     003f64a9  _ECAP1_INT_ISR       
1     00006a00  _ECap1Regs           
0     003f64ef  _EMPTY_ISR           
0     003f6413  _EMUINT_ISR          
0     003f6495  _EPWM1_INT_ISR       
0     003f6481  _EPWM1_TZINT_ISR     
0     003f649a  _EPWM2_INT_ISR       
0     003f6486  _EPWM2_TZINT_ISR     
0     003f649f  _EPWM3_INT_ISR       
0     003f648b  _EPWM3_TZINT_ISR     
0     003f64a4  _EPWM4_INT_ISR       
0     003f6490  _EPWM4_TZINT_ISR     
1     00006800  _EPwm1Regs           
1     00006840  _EPwm2Regs           
1     00006880  _EPwm3Regs           
1     000068c0  _EPwm4Regs           
1     00000d01  _EmuBMode            
1     00000d00  _EmuKey              
0     003f63e9  _ExtOscSel           
1     00000a80  _FlashRegs           
1     00000d04  _Flash_CPUScaleFactor
1     00000d02  _Flash_CallbackPtr   
0     003f623e  _FloatToString       
1     00006f80  _GpioCtrlRegs        
1     00006fc0  _GpioDataRegs        
1     00006fe0  _GpioIntRegs         
0     003f64b8  _I2CINT1A_ISR        
0     003f64bd  _I2CINT2A_ISR        
1     00007900  _I2caRegs            
0     003f641d  _ILLEGAL_ISR         
0     003f63ff  _INT13_ISR           
0     003f6404  _INT14_ISR           
0     00008000  _InitFlash           
0     003f6350  _InitPeripheralClocks
0     003f62fb  _InitPll             
0     003f66e5  _InitSci             
0     003f66e6  _InitSciGpio         
0     003f66e9  _InitSciaGpio        
0     003f62cf  _InitSysCtrl         
0     003f63b3  _IntOsc1Sel          
0     003f63c3  _IntOsc2Sel          
0     003f6418  _NMI_ISR             
1     00007060  _NmiIntruptRegs      
0     003f64f4  _PIE_RESERVED        
1     003d7fff  _PartIdRegs          
1     00000ce0  _PieCtrlRegs         
1     00000d00  _PieVectTable        
0     003f6000  _PieVectTableInit    
0     003f640e  _RTOSINT_ISR         
abs   0000001f  _RamfuncsLoadSize    
0     003f613b  _RamfuncsLoadStart   
0     00008000  _RamfuncsRunStart    
0     003f64c2  _SCIRXINTA_ISR       
0     003f64c7  _SCITXINTA_ISR       
0     003f64ae  _SPIRXINTA_ISR       
0     003f64b3  _SPITXINTA_ISR       
1     00007050  _SciaRegs            
0     003f62e9  _ServiceDog          
1     00007040  _SpiaRegs            
1     00007010  _SysCtrlRegs         
1     00000985  _SysPwrCtrlRegs      
0     003f6477  _TINT0_ISR           
0     003f644f  _USER10_ISR          
0     003f6454  _USER11_ISR          
0     003f6459  _USER12_ISR          
0     003f6422  _USER1_ISR           
0     003f6427  _USER2_ISR           
0     003f642c  _USER3_ISR           
0     003f6431  _USER4_ISR           
0     003f6436  _USER5_ISR           
0     003f643b  _USER6_ISR           
0     003f6440  _USER7_ISR           
0     003f6445  _USER8_ISR           
0     003f644a  _USER9_ISR           
0     003f647c  _WAKEINT_ISR         
0     003f6468  _XINT1_ISR           
0     003f646d  _XINT2_ISR           
0     003f64ea  _XINT3_ISR           
1     00007070  _XIntruptRegs        
0     003f63d5  _XtalOscSel          
1     00000250  __STACK_END          
abs   00000200  __STACK_SIZE         
1     00008800  ___TI_cleanup_ptr    
1     00008802  ___TI_dtors_ptr      
abs   ffffffff  ___binit__           
abs   ffffffff  ___c_args__          
0     003f674c  ___cinit__           
abs   ffffffff  ___etext__           
abs   ffffffff  ___pinit__           
abs   ffffffff  ___text__            
0     003f66ff  __args_main          
1     00008804  __lock               
0     003f674b  __nop                
0     003f6747  __register_lock      
0     003f6743  __register_unlock    
1     00000050  __stack              
1     00008806  __unlock             
0     003f6718  _abort               
0     003f65d0  _c_int00             
0     003f671a  _exit                
0     003f615a  _main                
0     003f66ae  _memcpy              
0     003f64f9  _rsvd_ISR            
0     003f6216  _scia_Byte2Hex       
0     003f6239  _scia_PrintLF        
0     003f61ce  _scia_echoback_init  
0     003f61c6  _scia_fifo_init      
0     003f61ee  _scia_msg            
0     003f6201  _scia_read           
0     003f61e2  _scia_xmit           
0     003f6739  _setDBGIER           
abs   ffffffff  binit                
0     003f674c  cinit                
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
0     003f613b  _RamfuncsLoadStart   
0     003f615a  _main                
0     003f61c6  _scia_fifo_init      
0     003f61ce  _scia_echoback_init  
0     003f61e2  _scia_xmit           
0     003f61ee  _scia_msg            
0     003f6201  _scia_read           
0     003f6216  _scia_Byte2Hex       
0     003f6239  _scia_PrintLF        
0     003f623e  _FloatToString       
0     003f62cf  _InitSysCtrl         
0     003f62e9  _ServiceDog          
0     003f62f3  _DisableDog          
0     003f62fb  _InitPll             
0     003f6350  _InitPeripheralClocks
0     003f6382  _CsmUnlock           
0     003f63b3  _IntOsc1Sel          
0     003f63c3  _IntOsc2Sel          
0     003f63d5  _XtalOscSel          
0     003f63e9  _ExtOscSel           
0     003f63ff  _INT13_ISR           
0     003f6404  _INT14_ISR           
0     003f6409  _DATALOG_ISR         
0     003f640e  _RTOSINT_ISR         
0     003f6413  _EMUINT_ISR          
0     003f6418  _NMI_ISR             
0     003f641d  _ILLEGAL_ISR         
0     003f6422  _USER1_ISR           
0     003f6427  _USER2_ISR           
0     003f642c  _USER3_ISR           
0     003f6431  _USER4_ISR           
0     003f6436  _USER5_ISR           
0     003f643b  _USER6_ISR           
0     003f6440  _USER7_ISR           
0     003f6445  _USER8_ISR           
0     003f644a  _USER9_ISR           
0     003f644f  _USER10_ISR          
0     003f6454  _USER11_ISR          
0     003f6459  _USER12_ISR          
0     003f645e  _ADCINT1_ISR         
0     003f6463  _ADCINT2_ISR         
0     003f6468  _XINT1_ISR           
0     003f646d  _XINT2_ISR           
0     003f6472  _ADCINT9_ISR         
0     003f6477  _TINT0_ISR           
0     003f647c  _WAKEINT_ISR         
0     003f6481  _EPWM1_TZINT_ISR     
0     003f6486  _EPWM2_TZINT_ISR     
0     003f648b  _EPWM3_TZINT_ISR     
0     003f6490  _EPWM4_TZINT_ISR     
0     003f6495  _EPWM1_INT_ISR       
0     003f649a  _EPWM2_INT_ISR       
0     003f649f  _EPWM3_INT_ISR       
0     003f64a4  _EPWM4_INT_ISR       
0     003f64a9  _ECAP1_INT_ISR       
0     003f64ae  _SPIRXINTA_ISR       
0     003f64b3  _SPITXINTA_ISR       
0     003f64b8  _I2CINT1A_ISR        
0     003f64bd  _I2CINT2A_ISR        
0     003f64c2  _SCIRXINTA_ISR       
0     003f64c7  _SCITXINTA_ISR       
0     003f64cc  _ADCINT3_ISR         
0     003f64d1  _ADCINT4_ISR         
0     003f64d6  _ADCINT5_ISR         
0     003f64db  _ADCINT6_ISR         
0     003f64e0  _ADCINT7_ISR         
0     003f64e5  _ADCINT8_ISR         
0     003f64ea  _XINT3_ISR           
0     003f64ef  _EMPTY_ISR           
0     003f64f4  _PIE_RESERVED        
0     003f64f9  _rsvd_ISR            
0     003f64fe  FS$$SUB              
0     003f6503  FS$$ADD              
0     003f6576  FS$$MPY              
0     003f65d0  _c_int00             
0     003f6614  L$$DIV               
0     003f6623  L$$MOD               
0     003f6631  UL$$DIV              
0     003f6638  UL$$MOD              
0     003f663e  FS$$TOL              
0     003f6667  FS$$TOI              
0     003f668c  I$$DIV               
0     003f669d  I$$MOD               
0     003f66ae  _memcpy              
0     003f66cb  L$$TOFS              
0     003f66e5  _InitSci             
0     003f66e6  _InitSciGpio         
0     003f66e9  _InitSciaGpio        
0     003f66ff  __args_main          
0     003f6718  C$$EXIT              
0     003f6718  _abort               
0     003f671a  _exit                
0     003f6739  _setDBGIER           
0     003f673c  _DSP28x_DisableInt   
0     003f6740  _DSP28x_RestoreInt   
0     003f6743  __register_unlock    
0     003f6747  __register_lock      
0     003f674b  __nop                
0     003f674c  ___cinit__           
0     003f674c  cinit                
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
1     00008800  ___TI_cleanup_ptr    
1     00008802  ___TI_dtors_ptr      
1     00008804  __lock               
1     00008806  __unlock             
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

[155 symbols]