/*****************************************************************************/
/*  ANKMSG.C v6.4.2                                                          */
/*                                                                           */
/* Copyright (c) 1995-2015 Texas Instruments Incorporated                    */
/* http://www.ti.com/                                                        */
/*                                                                           */
/*  Redistribution and  use in source  and binary forms, with  or without    */
/*  modification,  are permitted provided  that the  following conditions    */
/*  are met:                                                                 */
/*                                                                           */
/*     Redistributions  of source  code must  retain the  above copyright    */
/*     notice, this list of conditions and the following disclaimer.         */
/*                                                                           */
/*     Redistributions in binary form  must reproduce the above copyright    */
/*     notice, this  list of conditions  and the following  disclaimer in    */
/*     the  documentation  and/or   other  materials  provided  with  the    */
/*     distribution.                                                         */
/*                                                                           */
/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
/*     of its  contributors may  be used to  endorse or  promote products    */
/*     derived  from   this  software  without   specific  prior  written    */
/*     permission.                                                           */
/*                                                                           */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
/*                                                                           */
/*****************************************************************************/

/*****************************************************************************/
/* Bottom level data transfer routines for host communication with the       */
/* target.                                                                   */
/*                                                                           */
/* Functions:                                                                */
/*  __TI_writemsg()  -  Sends the passed data and parameters on to the host. */
/*  __TI_readmsg()   -  Reads the data and parameters passed from the host.  */
/*****************************************************************************/
#include <stdio.h>
#include "ankcio.h"


#define STR(x) #x
#define DEFCIO(size) __asm("__CIOBUF_: .usect  .cio," STR(size) ",4"); \
		     extern volatile unsigned char _CIOBUF_[size]

DEFCIO(CIOBUFSIZ);


/***************************************************************************/
/*                                                                         */
/* __TI_writemsg() - Sends the passed data and parameters on to the host.  */
/*                                                                         */
/***************************************************************************/
void __TI_writemsg(unsigned char           command,
                   register unsigned char *parm,
                   register const char    *data,
                   unsigned int            length)
{
    register volatile unsigned char *p = (volatile unsigned char *) _CIOBUF_;
    register unsigned int i;

    /***********************************************************************/
    /* THE LENGTH IS WRITTEN AS A TARGET INT                               */
    /***********************************************************************/ 
    *(unsigned int *)p = length; 
    p += sizeof(unsigned int);

    /***********************************************************************/ 
    /* THE COMMAND IS WRITTEN AS A TARGET BYTE                             */
    /***********************************************************************/ 
    *p++ = command;

    /***********************************************************************/ 
    /* PACK THE PARAMETERS AND DATA SO THE HOST READS IT AS BYTE STREAM    */
    /***********************************************************************/ 
    for (i = 0; i < 8; i++)      PACKCHAR(*parm++, p, i);
    for (i = 0; i < length; i++) PACKCHAR(*data++, p, i+8);

    /***********************************************************************/ 
    /* THE EMULATOR BREAKPOINTS IN DECODE PHASE, SO HAVE TO ADD IN SOME    */
    /* NOPS TO MAKE SURE LAST REAL INSTRUCTION COMPLETES BEFORE BREAKPOINT */
    /***********************************************************************/ 
    __asm("	nop");
    __asm("	nop");
    __asm("	nop");

    /***********************************************************************/
    /* THE BREAKPOINT THAT SIGNALS THE HOST TO DO DATA TRANSFER            */
    /***********************************************************************/
    __asm("	.global	C$$IO$$");
    __asm("C$$IO$$:nop");
}



/***************************************************************************/
/*                                                                         */
/* __TI_readmsg() - Reads the data and parameters passed from the host.    */
/*                                                                         */
/***************************************************************************/
void __TI_readmsg(register unsigned char *parm,
                  register char          *data)
{
    register volatile unsigned char *p = (volatile unsigned char *) _CIOBUF_;

    register unsigned int i;
    unsigned int length;

    /***********************************************************************/
    /* THE LENGTH IS READ AS A TARGET INT                                  */
    /***********************************************************************/
    length = *(unsigned int *)p;
    p += sizeof(unsigned int);
    
    /***********************************************************************/
    /* UNPACK THE PARAMETERS AND DATA                                      */
    /***********************************************************************/
    for (i = 0; i < 8; i++) *parm++ = UNPACKCHAR(p, i);
    if (data != NULL) 
       for (i = 0; i < length; i++) *data++ = UNPACKCHAR(p, i+8);
}
