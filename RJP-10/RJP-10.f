C RJP-10.f
C Compute the x and y coordinates of the points on a circle.
      Open(1, file='RJP-10 Output.txt')
      Open(2, file='RJP-10 Table.txt')
C Ask the user for input
      Print *, 'Enter number of steps, N, and radius, R'
      Read *, N,R
C Write column heading to RJP-10 Table.txt
      Write(2,100)
C Column heading format information for RJP-10 Table.txt (pg 1)
  100 Format(///, 22x, 'x Values', 22x, 'y Values',/)
      K=0
C Define variables
      pi=3.14159
      ThetaMax=2*pi
      DelTheta=(ThetaMax/N)
      Theta=0.0
C Iterate from 1 to N
      Do 700, i=1,N
      x=R*cos(Theta)
      y=R*sin(Theta)
C Write values for x and y to RJP-10 Table.txt
      Write(2,500) x,y
      Write(1,600) x,y
      K=K+1
C If lines of data exceed 56 then start line 57 on a new page
      If(K.eq.56) Then
      Write(2,200)
  200 Format(2x,////)
      K=0
      Write(2,300)
  300 Format(2x, 'Table Continued',/)
      Write(2,400)
C Column heading format information for RJP-10 Table.txt (pg 2)
  400 Format(22x, 'x Values', 22x, 'y Values',/)
      Else
      Continue
      Endif
C Format Information for data output
  500 Format(20x,2(f10.5,20x))
  600 Format(20x,2(f10.5,20x))
      Print *, i,'  x=',x,'  y=',y
      Theta=Theta+DelTheta
C End of Do loop
  700 Continue
C Close RJP-10 Output.txt and RJP-10 Table.txt files
      Close(1)
      Close(2)
C End of Program
      End
