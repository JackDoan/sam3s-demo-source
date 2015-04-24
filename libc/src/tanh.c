/****************************************************************************/
/*  tanh   v6.4.2                                                           */
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
/*  TANH() - Hyperbolic Tangent						    */
/*									    */
/*  Based on the algorithm from "Software Manual for the Elementary         */
/*  Functions", Cody and Waite, Prentice Hall 1980, chapter 13.             */
/*  This also uses the Cody and Waite algorithm for exp in chapter 6.	    */
/*									    */
/*  f = abs(x)								    */
/*  if f < ln(3) / 2,							    */
/*	g = f * f							    */
/*	R = polynomial expansion					    */
/*	result = f + f * R						    */
/*									    */
/*  if d > XBIG, result = sign(x)                                           */
/*  if f > ln(3) / 2 & f <= XBIG, result = 1 - 2 / (exp(2f) + 1)	    */
/*  if f < ln(3) / 2, R = polynomial expansion; result = f + f * R          */
/*  if x < 0, result = - result 					    */
/****************************************************************************/
double tanh(double x)
{
    double f = x, g, p, q, r, result;
    int sign = x < 0;

    f = fabs(x);

    if      (f > XBIG)     return (sign ? -1.0 : 1.0);
    else if (f > LOGe3by2) 
	 {
	    result = 1.0 - 2.0 / (exp(2.0 * f) + 1.0);
	    return sign ? -result : result; 
	 }

    /**********************************************************************/
    /* determine polynomial expression                                    */
    /**********************************************************************/
    g = f * f;

#if BITS<=24
    p = (THP1 * g + THP0) * g;
    q = g + THQ0;
#elif BITS>=25 && BITS<=36
    p = (THP1 * g + THP0) * g;
    q = (g + THQ1) * g + THQ0;
#elif BITS>=37 && BITS<=48
    p = ((THP2 * g + THP1) * g + THP0) * g;
    q = (g + THQ1) * g + THQ0;
#else
    p = ((THP2 * g + THP1) * g + THP0) * g;
    q = ((g + THQ2) * g + THQ1) * g + THQ0;
#endif

    r = p / q;

    /*****************************************************************/
    /* tanh(x) = sign * result                                       */
    /*****************************************************************/
    result = f + f * r; 
    return sign ? -result : result; 
}
