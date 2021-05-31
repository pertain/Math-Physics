C RJP-500.f
C Find the electric potential at a point due to a uniformly charged ring
      Open(1, file='RJP-500 Table.txt')
C Input the number of steps around the charged ring
      Print *, 'Enter number of steps, N'
      Read *, N
C Table title (first page)
      Write(1,100)
  100 Format(31x,'TABLE 1',/)
      Write(1,110)
  110 Format(14x,'Results of the Numerical Integration of the')
      Write(1,120)
  120 Format(16x,'Electric Potential for a Ring of Charge',//)
C Column heading for first page
      Write(1,200)
  200 Format(9x,'N',7x,'X',7x,'Y',7x,'S',7x,'DelPhi(V)',
     &4x,'DelSum(V)',/)
      K=0
C Variables
      pi=3.14159
      ThetaMax=2*pi
      DelTheta=(ThetaMax/N)
      Theta=0.0
      Q=20.0E-3
      PhiSum=0.0
      R=10
C Begin loop
      Do 700, i=1,N
      X=R*cos(Theta)
      Y=R*sin(Theta)
      Xdiff=20-X
      Ydiff=20-Y
      Zdiff=10
      S=sqrt((xdiff**2)+(ydiff**2)+(zdiff**2))
      DelPhi=(((8.9875518E9)*(Q/N))/S)
      PhiSum=PhiSum+DelPhi
C Write values to output file
      Write(1,600) i,X,Y,S,DelPhi,PhiSum
      K=K+1
C Define page cutoff
      If(K.eq.46) Then
      Write(1,300)
  300 Format(2x,//)
      K=0
C Table title (subsequent pages)
      Write(1,400)
  400 Format(27x, 'TABLE 1 Continued',//)
C Column heading for subsequent pages
      Write(1,500)
  500 Format(9x,'N',7x,'X',7x,'Y',7x,'S',7x,'DelPhi(V)',
     &4x,'PhiSum(V)',/)
      Else
      Continue
      Endif
C Format Information for data output
  600 Format(5x,i5,4x,3(f6.2,2x),f10.1,4x,f10.1,5x)
      Print *,'N=',i,'X=',X,'Y=',Y,'S=',S,'DelPhi(V)=',DelPhi,
     &'PhiSum(V)=',PhiSum
      Theta=Theta+DelTheta
C End loop
  700 Continue
      Close(1)
      End
