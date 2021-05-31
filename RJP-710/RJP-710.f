C RJP-710.f
C Find values for each harmonic in a Fourier series
      Open(1, file='RJP-710 Data.txt')
C Input the initial/final X values and number of steps
      Print *, 'Enter number of steps, N, and boundaries Xi, Xf'
      Read *, N,Xi,Xf
C Column headings
      Write(1,100)
  100 Format(9x,'Harmonic',7x,'X',7x,'Y',7x,'k',/)
C Variables
      pi=3.14159265359
      dX=(Xf-Xi)/N
      X=(dX/2)+Xi
C Begin Harmonic loop
      Do 400, i=1,N
      k=(2*i)-1
C Begin X,Y loop
         Do 200, j=1,N
         Y=((1/2)+(2*sin(k*X)/(k*pi)))
         Write(1,300) i,X,Y,k
         Print *,'Harmonic=',i,'X=',X,'Y=',Y
         X=X+dX
C End of X, Y loop
  200    Continue
      X=(dX/2)+Xi
C Format Information for data output
  300 Format(5x,i5,4x,2(f15.11,2x),i5)
C End of Harmonic loop
  400 Continue
      Close(1)
      End
