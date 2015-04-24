/****************************************************************************/
/*  atan2  v6.4.2                                                           */
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
#include <float.h>
#include <values.h>
#include <errno.h>

/****************************************************************************/
/*  ATAN2() - Arctangent2						    */
/*									    */
/*  Based on the algorithm from "Software Manual for the Elementary         */
/*  Functions", Cody and Waite, Prentice Hall 1980, chapter 11.             */
/*									    */
/*  if x >= 0, result = atan(y / x)		  			    */
/*  if x < 0 & y >= 0, result = pi + atan(y / x)			    */
/*  if x < 0 & y < 0, result = atan (y / x) - pi			    */
/*									    */
/****************************************************************************/
double atan2(double y, double x)
{
    double g, p, q, r;
    int    sign;
    int    t = 0;
    int   ys = (y >= 0);
    int   xs = (x >= 0);
    int    n = 0;
    int   yn = 0;
    int   xn = 0;

    static const _DATA_ACCESS double a[4] = {0.0, 0.52359877559829887308, 
			             		1.57079632679489661923,
		                     		1.04719755119659774615};

    /*********************************************************************/
    /* check for error in domain                                         */
    /*********************************************************************/
    if (x == 0)
    {
       if (y == 0) { errno = EDOM; return (0.0); }
       else          return (ys ? HALFPI : -HALFPI);
    }

    /*********************************************************************/
    /* Determine whether overflow is possible; if so, return (+/-) pi/2  */
    /*********************************************************************/
    frexp(y, &yn);
    frexp(x, &xn);

    if ((yn - xn) > (DBL_MAX_EXP - 2))  /* Use (DBL_MAX_EXP-2) for safety */
    {
       return (ys ? HALFPI : -HALFPI);
    }

    /*********************************************************************/
    /* check for negative                                                */
    /*********************************************************************/
    sign = ((x = y / x) < 0.0);

    if ((x = fabs(x)) > 1.0)
    {
       x = 1.0 / x;	
       n = 2;	
       t = 1;	                         /* negate partial result */
    }

    /**********************************************************************/
    /* if (x > (2 - sqrt(3)) x = (x * sqrt(3) -1) / (sqrt(3) + x)         */
    /**********************************************************************/
    if (x > TWO_SQRT3)
    {
       x = (x * SQRTTHREE - 1.0) / (SQRTTHREE + x); 
       ++n;
    }

    /**********************************************************************/
    /* determine polynomial expression                                    */
    /**********************************************************************/
    g = x * x;

#if BITS<=24
    p = (ATP1 * g + ATP0) * g;
    q = g + ATQ0;
#elif BITS>=25 && BITS<=32
    p = (ATP1 * g + ATP0) * g;
    q = (g + ATQ1) * g + ATQ0;
#elif BITS>=33 && BITS<=50
    p = ((ATP2 * g + ATP1) * g + ATP0) * g;
    q = ((g + ATQ2) * g + ATQ1) * g + ATQ0;
#else
    p = (((ATP3 * g + ATP2) * g + ATP1) * g + ATP0) * g;
    q = (((g + ATQ3) * g + ATQ2) * g + ATQ1) * g + ATQ0;
#endif

    /*********************************************************************/
    /* calculate the result multiplied by the correct sign               */
    /*********************************************************************/
    r = ((p / q) * x + x);
    r = (t ? -r : r) + a[n];
    r = (sign ? -r : r); 

    /*********************************************************************/
    /* adjust result to be in correct quadrant                           */
    /*********************************************************************/
    if (!xs && ys)  r = (PI + r);
    if (!xs && !ys) r = (r - PI);

    return (r);
}
