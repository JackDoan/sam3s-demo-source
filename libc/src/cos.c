/****************************************************************************/
/*  cos    v6.4.2                                                           */
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
#include <values.h>

/****************************************************************************/
/*  COS() - Cosine							    */
/*									    */
/*  Based on the algorithm from "Software Manual for the Elementary         */
/*  Functions", Cody and Waite, Prentice Hall 1980, chapter 8.              */
/*									    */
/*  N = round(x / PI + 1/2) - 0.5					    */
/*  f = x - N * PI							    */
/*  g = f * f								    */
/*  R = polynomial expression						    */
/*									    */
/*  result = f + f * R							    */
/*  if N is even, result = - result					    */
/*									    */
/*  This will return the wrong result for x >= MAXINT * PI		    */
/****************************************************************************/
double cos(double x)
{
    int sign;           /* the sign of the result */
    double xn, f, g, rg, result;
    int n;

    /**************************************************************************/
    /* cos(x) = cos(-x)                                                       */
    /**************************************************************************/
    x = fabs(x);

    /**************************************************************************/
    /* Treat zero as a special case.                                          */
    /**************************************************************************/
    if (x == 0.0) return 1.0;

    /**************************************************************************/
    /* n = round(x/PI + 1/2) (can be rounded this way, since positive number) */
    /**************************************************************************/
    n  = (int) (((x + HALFPI) * INVSPI) + 0.5);
    xn = (double) n - 0.5;

    /**************************************************************************/
    /* if n is odd, negate the sign                                           */
    /**************************************************************************/
    sign = n % 2;

    /**************************************************************************/
    /* f = x - xn * PI (but more mathematically stable)                       */
    /**************************************************************************/
    f = (x - xn * C1) - xn * C2;

    /**************************************************************************/
    /* determine polynomial expression                                        */
    /**************************************************************************/
    g = f * f;

#if BITS<=24
    rg = (((R4 * g + R3) * g + R2) * g + R1) * g;
#elif BITS>=25 && BITS<=32
    rg = ((((R5 * g + R4) * g + R3) * g + R2) * g + R1) * g;
#elif BITS>=33 && BITS<=50
    rg = ((((((R7*g+R6)*g+R5)*g+R4)*g+R3)*g+R2)*g+R1)*g;
#else
    rg = (((((((R8*g+R7)*g+R6)*g+R5)*g+R4)*g+R3)*g+R2)*g+R1)*g;
#endif

    result = f + f * rg; 
    return sign ? -result : result; 
}