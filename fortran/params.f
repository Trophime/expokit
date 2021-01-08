*----------------------------------------------------------------------|
      subroutine defpar()      
      
      integer mxstep, mxreject, ideg
      double precision delta, gamma
      common /iparam/ mxstep, mxreject, ideg
      common /dparam/ delta, gamma

*     mxstep  : maximum allowable number of integration steps.
*               The value 0 means an infinite number of steps.
* 
*     mxreject: maximum allowable number of rejections at each step. 
*               The value 0 means an infinite number of rejections.
*
*     ideg    : the Pade approximation of type (ideg,ideg) is used as 
*               an approximation to exp(H). The value 0 switches to the
*               uniform rational Chebyshev approximation of type (14,14)
*
*     delta   : local truncation error `safety factor'
*
*     gamma   : stepsize `shrinking factor'
*
*----------------------------------------------------------------------|
*     Roger B. Sidje (rbs@maths.uq.edu.au)
*     EXPOKIT: Software Package for Computing Matrix Exponentials.
*     ACM - Transactions On Mathematical Software, 24(1):130-156, 1998
*----------------------------------------------------------------------|
*
      mxstep   = 500
      mxreject = 0
      ideg     = 6
      delta    = 1.2d0
      gamma    = 0.9d0
*
      end
*----------------------------------------------------------------------|
      subroutine setpar(nstep, nreject, ndeg, dlta, gama)

      integer nstep, nreject, ndeg
      double precision dlta, gama
      
      integer mxstep, mxreject, ideg
      double precision delta, gamma
      common /iparam/ mxstep, mxreject, ideg
      common /dparam/ delta, gamma
      
*     mxstep  : maximum allowable number of integration steps.
*               The value 0 means an infinite number of steps.
* 
*     mxreject: maximum allowable number of rejections at each step. 
*               The value 0 means an infinite number of rejections.
*
*     ideg    : the Pade approximation of type (ideg,ideg) is used as 
*               an approximation to exp(H). The value 0 switches to the
*               uniform rational Chebyshev approximation of type (14,14)
*
*     delta   : local truncation error `safety factor'
*
*     gamma   : stepsize `shrinking factor'
*
*----------------------------------------------------------------------|
*     Roger B. Sidje (rbs@maths.uq.edu.au)
*     EXPOKIT: Software Package for Computing Matrix Exponentials.
*     ACM - Transactions On Mathematical Software, 24(1):130-156, 1998
*----------------------------------------------------------------------|
*
      mxstep   = nstep
      mxreject = nreject
      ideg     = ndeg 
      delta    = dlta
      gamma    = gama
*
      end
