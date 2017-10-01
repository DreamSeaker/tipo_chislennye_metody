program Calc_ANAL;

{$APPTYPE CONSOLE}

uses
  Math,
  sysutils,
  classes,
  Dialogs,
  MyType,
  MyProc;

var
   I,N : Ir;
   A, K, Y0, A0, A1, A2, A3,A4, Dtau : Db;
   T, X, Y : Vec;
   F1,F2 : TextFile;

Begin
  AssignFile(F1,'Input_ODU1.txt');
  AssignFile(F2,'Output_ODU1.txt');
  Reset(F1);
  ReWrite(F2);
  Readln(F1,A,K,Y0,Dtau,N);
  Writeln('A=',A:7:4,'  K=',K:7:4,'  Y0=',Y0:7:4,'  Dtau=',Dtau:7:4,'  N=',N:3);
  Writeln(F2,'A=',A:7:4,'  K=',K:7:4,'  Y0=',Y0:7:4,'  Dtau=',Dtau:7:4,'  N=',N:3);
  Readln(F1,A0,A1,A2,A3,A4);
  Writeln(' A0=',A0:7:4,' A1=',A1:7:4,' A2=',A2:7:4,' A3=',A3:7:4,' A4=',A4:7:4);
  Writeln(F2,' A0=',A0:7:4,' A1=',A1:7:4,' A2=',A2:7:4,' A3=',A3:7:4,' A4=',A4:7:4);
  Readln;
   {An_Polin_4(N,Y0,A,K,Dtau,A0,A1,A2,A3,A4,T,X,Y);}
    An_Bienie(N,Y0,A,K,Dtau,A0,A1,A2,A3,A4,T,X,Y);
   { An_SinExp(N,Y0,A,K,Dtau,A0,A1,A2,A3,T,X,Y);
   An_SinSd(N,Y0,A,K,Dtau,A0,A1,A2,A3,T,X,Y); }
    Writeln(' I    T     X      Y');
    Writeln(F2,' I    T     X      Y');
    for I:=0 to N do
      begin
      Writeln(I:2,' ',T[I]:6:2,' ',X[I]:7:4,' ',Y[I]:7:4);
      Writeln(F2,I:2,' ',T[I]:6:2,' ',X[I]:7:4,' ',Y[I]:7:4);
      end;
    Readln;

Close(F1);
Close(F2);
  { TODO -oUser -cConsole Main : Insert code here }
end.
