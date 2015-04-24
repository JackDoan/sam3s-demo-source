/****************************************************************************/
/*  pow    v6.4.2                                                           */
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
#include <errno.h>

double _log(double x);                 /* Like log() with no error checking */

/****************************************************************************/
/*  POW() - Power							    */
/*									    */
/*  z = mantissa x							    */
/*  log2(z) = c1 * z ^ 9 + c2 * z ^ 7 + c3 * z ^ 5 + c4 * z ^ 3 + c5 * z    */
/*  log2(x) = exponent x + log2(z)					    */
/*  a = y * log2(x)							    */
/*  b = mantissa a							    */
/*  2 ^ b =  (((((d1 * b + d2) * b + d3) * b + d4) * b + d5) * b + d6)	    */
/*									    */
/*  result = 2 ^ exponent a * 2 ^ b					    */
/*	   = 2 ^ (y * log2(x))						    */
/****************************************************************************/
double pow(double x, double y)
{
    int z;

    if (x && y && y != 1.0)
    {
        int sign = 0;
	if (x < 0.0)
	{
	    z = (int) y;

	    /*****************************************************************/
	    /* if y is not an integer, a domain error occurs                 */
	    /*****************************************************************/
	    if (y - z) { errno = EDOM; return 0.0; }

	    /*****************************************************************/
	    /* if x < 0, compute the power of |x|                            */
	    /*****************************************************************/
	    x = -x;

	    /*****************************************************************/
	    /* for odd exponents, negate the answer                          */
	    /*****************************************************************/
	    sign = z % 2; 
	}

	x = exp(_log(x) * y);

	return (sign) ? -x : x;
    }

    if (y == 1.0) return (x);

    /**************************************************************************/
    /* if x = 0 and y < 0, return a domain error                              */
    /**************************************************************************/
    if (x == 0.0 && y <= 0.0) { errno = EDOM; return (0.0); }

    return (y == 0.0) ? 1.0 : 0.0;
}
