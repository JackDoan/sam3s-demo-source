/****************************************************************************/
/*  _log    v6.4.2                                                          */
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
/*  _LOG() - natural log (w/o error checking)				    */
/*									    */
/*  Based on the algorithm from "Software Manual for the Elementary         */
/*  Functions", Cody and Waite, Prentice Hall 1980, chapter 5.              */
/*									    */
/*  N = exponent x							    */
/*  f = mantissa x, 0.5 <= f < 1					    */
/*  if f < sqrt(0.5), znum = f - 0.5, zden = znum * 0.5 + 0.5		    */
/*  if f > sqrt(0.5), znum = f - 1, zden = f * 0.5 + 0.5		    */
/*  z = znum / zden							    */
/*  w = z * z								    */
/*  R = polynomial expression						    */
/*									    */
/*  result = R + N * ln(2)						    */
/****************************************************************************/
double _log(double x)
{
    double a, b, f, r, w, z, znum;
    int n;

    /************************************************************************/
    /* f = mantissa(x), n = exponent(x)            			    */
    /************************************************************************/
    f = frexp(x, &n);

    /************************************************************************/
    /* for numbers <= sqrt(0.5)                                             */
    /************************************************************************/
    if (f <= SQRTHALF)
    {
        --n;
	znum = f - 0.5;
	z    = znum / (znum * 0.5 + 0.5);
    }

    /************************************************************************/
    /* for numbers > sqrt(0.5)                                              */
    /************************************************************************/
    else
    {
	znum = (f - 0.5) - 0.5;
	z    = znum / (f * 0.5 + 0.5);
    }

    /************************************************************************/
    /* determine polynomial expression                                      */
    /************************************************************************/
    w = z * z;

#if BITS<=24
    a = A0;
    b = w + B0;
#elif BITS>=25 && BITS<=32
    a = A1 * w + A0;
    b = w + B0;
#elif BITS>=33 && BITS<=48
    a = (A2 * w + A1) * w + A0;
    b = (w + B1) * w + B0;
#else
    a = (A2 * w + A1) * w + A0;
    b = ((w + B2) * w + B1) * w + B0;
#endif

    /************************************************************************/
    /* calculate the natural log of (mant x) / 2                            */
    /************************************************************************/
    r = z + z * w * (a / b);

    /************************************************************************/
    /* ln(x) = ln (mant x) + 2 * (exp x) (but more mathematically stable)   */
    /************************************************************************/
    return ((n * C4 + r) + n * C3);
}
