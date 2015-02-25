C   RJP-20 Program
C   Numerically integrate the speed probability function
C   from v=10m/s to v=100m/s
      Open (1, File='RJP-20 Output.txt')
      Print *, 'Enter number of steps, N, initial, Vi, and final, Vf'
      Read *, N,Vi,Vf
      Write(1,100)
  100 Format(11x,'N',8x,'V',8x,'P',8x,'Area',/)
C   Define variables
      dV=(Vf-Vi)/N
      V=dV/2+Vi
      Temp=300
      C1=4.820E-5
      C2=1.90E-3
      Area=0.0
C   Run the program loop
      Do 300, i=1,N
      P=(C1/(Sqrt(Temp**3)))*(V**2)*(Exp(-(C2*V**2)/Temp))
      dA=P*dV
      Area=Area+dA
C   Show values on the screen
      Print *, i, '  V=',V,'  P=',P,'  Area=',Area
C   Populate txt file with values
      Write(1,200) i,V,P,Area
  200 Format(5x,i7,4x,f10.4,2x,f10.8,2x,f8.6)
      V=V+dV
  300 Continue
      Close(1)
      End
