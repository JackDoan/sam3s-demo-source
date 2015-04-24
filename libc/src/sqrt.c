/****************************************************************************/
/*  sqrt   v6.4.2                                                           */
/*                                                                          */
/* Copyright (c) 1995-2015 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/
#include <math.h>
#include <errno.h>
#include "values.h"

/***************************************************************************/
/* SQRT() - Square Root                                                    */
/*   Computes square root of x using a Newton-Raphson approximation for    */
/*   sqrt(1/x).  Initial value x0 = .75 * 2 ^ -(e/2), where x = a * 2 ^ e. */
/*   This is the algorithm from page 11-30 of the TMS320C3x User's Guide.  */
/***************************************************************************/
#define ITERATIONS 6
 
double sqrt(double x)
{
    double x0;          /* estimate */
    int i;
 
    /************************************************************************/
    /* Check to see if the input is not in the function's domain.           */
    /************************************************************************/
    if (x <= 0.0)
    {
      if (x < 0.0) errno = EDOM;
      return (0.0);
    }
 
#if defined(__TMS320C28XX_FPU32__)
    /************************************************************************/
    /* initial estimate = __eisqrtf32(x)                                    */
    /************************************************************************/
    x0  = __eisqrtf32(x);
#else
    /************************************************************************/
    /* initial estimate = .75 * 2 ^ -(exp/2)                                */
    /************************************************************************/
    {
        int exp = ( (*((unsigned long *) &x) >> 23) & 0xFF) - 0x7F;
        x0  = ldexp(0.75, -exp / 2);
    }
#endif
 
    /************************************************************************/
    /* Refine estimate                                                      */
    /************************************************************************/
    for (i = 0; i < ITERATIONS ; i++)
      x0 *= (1.5 - x * 0.5 * x0 * x0);

    /************************************************************************/
    /* sqrt(x) = x * sqrt(1/x)                                              */
    /************************************************************************/
    return (x0 * x);
}
