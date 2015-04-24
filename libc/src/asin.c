/****************************************************************************/
/*  asin   v6.4.2                                                           */
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

/****************************************************************************/
/*  ASIN() - Arcsine							    */
/*									    */
/*  Based on the algorithm from "Software Manual for the Elementary         */
/*  Functions", Cody and Waite, Prentice Hall 1980, chapter 10.             */
/*									    */
/*  Y = abs(x)								    */
/*  if Y > 0.5, g = (1 - Y) / 2, Y = - 2 * sqrt(g), i = 1		    */
/*  if Y < 0.5, g = Y * Y, i = 0					    */
/*  R = polynomial expression			 			    */
/*									    */
/*  result = Y + Y * R							    */
/*									    */
/*  if x < 0, result = -ci - result - ci 				    */
/*  if x > 0, result = ci + result + ci		  			    */
/****************************************************************************/
double asin(double x)
{
    double p, q, g, y;
    static const _DATA_ACCESS double c[2] = {0.0, 0.78539816339744830962};
    int i = 0;

    if ((y = fabs(x)) > 0.5)
    {
       /*******************************************************************/
       /* check if input is out of the domain of the function             */
       /*******************************************************************/
       if (y > 1.0) { errno = EDOM; return (0.0); }

       i = 1;	
       g = (1.0 - y) * 0.5;	
       y = -2.0 * sqrt(g);
    }
    else g = y * y;		

  /************************************************************************/
  /* determine polynomial expression                                      */
  /************************************************************************/
#if BITS<=24
    p = (ASP2 * g + ASP1) * g;
    q = (g + ASQ1) * g + ASQ0;
#elif BITS>=25 && BITS<=36
    p = ((ASP3 * g + ASP2) * g + ASP1) * g;
    q = ((g + ASQ2) * g + ASQ1) * g + ASQ0;
#elif BITS>=37 && BITS<=48
    p = (((ASP4 * g + ASP3) * g + ASP2) * g + ASP1) * g;
    q = (((g + ASQ3) * g + ASQ2) * g + ASQ1) * g + ASQ0;
#else
    p = ((((ASP5 * g + ASP4) * g + ASP3) * g + ASP2) * g + ASP1) * g;
    q = ((((g + ASQ4) * g + ASQ3) * g + ASQ2) * g + ASQ1) * g + ASQ0;
#endif

    return (x < 0) ? (-((c[i] + y + y * p / q) + c[i]))
		   : ((c[i] + y + y * p / q) + c[i]);
}
