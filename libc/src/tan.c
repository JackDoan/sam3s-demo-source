/****************************************************************************/
/*  tan    v6.4.2                                                           */
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
/*  TAN() - Tangent							    */
/*									    */
/*  Based on the algorithm from "Software Manual for the Elementary         */
/*  Functions", Cody and Waite, Prentice Hall 1980, chapter 9.              */
/*									    */
/*  N = round(x * 2 / PI) 						    */
/*  f = mantissa x							    */
/*  g = f * f								    */
/*  xnum = f * p1 * g + 1						    */
/*  xden = (q2 * g + q1) * g + 1					    */
/*									    */
/*  if N is even, result = xnum / xden					    */
/*  if N is odd, result = xden / - xnum 				    */
/*									    */
/*  This will return the wrong result for x >= MAXINT * PI		    */
/****************************************************************************/
double tan(double x)
{
    double xn, f, g, xnum, xden;
    int n;

    /*************************************************************************/
    /* n = round(x * 2/PI)                                                   */
    /*************************************************************************/
    if (x < 0.0) n = (int) (x * TWOINVPI - 0.5);  /* since (int) -1.5 = -1.0 */
    else         n = (int) (x * TWOINVPI + 0.5);

    xn = (double) n;

    /*************************************************************************/
    /* f = x - xn * PI / 2 (but more mathematically stable)                  */
    /*************************************************************************/
    f = (x - xn * C5) - xn * C6;

    /*************************************************************************/
    /* determine polynomial expression                                       */
    /*************************************************************************/
    g = f * f;

#if BITS<=24
    xnum = TAP1 * g * f + f;
    xden = (TAQ2 * g + TAQ1) * g + 0.5 + 0.5;
#elif BITS>=25 && BITS<=32
    xnum = (TAP2 * g + TAP1) * g * f + f;
    xden = (TAQ2 * g + TAQ1) * g + 0.5 + 0.5;
#elif BITS>=33 && BITS<=52
    xnum = ((TAP3 * g + TAP2) * g + TAP1) * g * f + f;
    xden = ((TAQ3 * g + TAQ2) * g + TAQ1) * g + 0.5 + 0.5;
#else
    xnum = ((TAP3 * g + TAP2) * g + TAP1) * g * f + f;
    xden = (((TAQ4 * g + TAQ3) * g + TAQ2) * g + TAQ1) * g + 0.5 + 0.5;
#endif

    /*************************************************************************/
    /* if n is odd                                                           */
    /*************************************************************************/
    if (n % 2 == 0) return (xnum / xden);
    else            return (xden / -xnum);	
}
