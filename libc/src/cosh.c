/****************************************************************************/
/*  cosh   v6.4.2                                                           */
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
/*  COSH() - Hyperbolic Cosine						    */
/*               							    */
/*  Based on the algorithm from "Software Manual for the Elementary         */
/*  Functions", Cody and Waite, Prentice Hall 1980, chapter 6.              */
/*               							    */
/*  result = (exp(x) + 1 / exp(x)) / 2		  			    */
/****************************************************************************/
double cosh(double x)
{
  double g, z, q, p, r, a, b;
  int n;

  /****************************************************************************/
  /* cosh(x) = cosh(-x)                                                       */
  /****************************************************************************/
  x = fabs(x);

  /****************************************************************************/
  /* check to see if overflow would occur                                     */
  /****************************************************************************/
  if (x > MAXH) { errno = ERANGE; return (HUGE_VAL); }

  if (x < 0) n = (int) (x * INVLOGe2 - 0.5);       /* since (int) -1.5 = -1.0 */
  else       n = (int) (x * INVLOGe2 + 0.5);

  /****************************************************************************/
  /* g = x - n * ln(2) (but more mathematically stable)                       */
  /****************************************************************************/
  g  = (x - n * C3) - n * C4;

  /****************************************************************************/
  /* determine polynomial expression                                          */
  /****************************************************************************/
  z  = g * g;

#if BITS <=29
  p = (EXP1 * z + EXP0) * g;
  q = EXQ1 * z + EXQ0;
#elif BITS>=30 && BITS<=42
  p = (EXP1 * z + EXP0) * g;
  q = (EXQ2 * z + EXQ1) * z + EXQ0;
#elif BITS>=43 && BITS<=56
  p = ((EXP2 * z + EXP1) * z + EXP0) * g;
  q = (EXQ2 * z + EXQ1) * z + EXQ0;
#else
  p = ((EXP2 * z + EXP1) * z + EXP0) * g;
  q = ((EXQ3 * z + EXQ2) * z + EXQ1) * z + EXQ0;
#endif

  /****************************************************************************/
  /* calculate exp(g)                                                         */
  /****************************************************************************/
  r  = 0.5 + p / (q - p);

  /****************************************************************************/
  /* exp(x)/2 = exp(g) * 2 ^ (n)                                              */
  /****************************************************************************/
  a = ldexp(r, n);

  /****************************************************************************/
  /* exp(-x)*2 = 1 / (exp(x)/2)                                               */
  /****************************************************************************/
  b  = 1.0 / a;

  /****************************************************************************/
  /* cosh(x) = exp(x)/2 + exp(-x)*2 / 4                                       */
  /****************************************************************************/
  return (a + b * 0.25);
}
