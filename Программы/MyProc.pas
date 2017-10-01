unit MyProc;
interface
uses
  MyType,
  SysUtils,
  Classes,
  Math;

procedure An_Polin_4(N:Ir; Y0,A,K,Dtau,A0,A1,A2,A3,A4:Db; Var T,X,Y:Vec);
procedure An_Bienie(N:Ir; Y0,A,K,Dt,A0,A1,A2,A3,A4:Db; Var T,X,Y:Vec);
procedure An_SinExp(N:Ir; Y0,A,K,Dtau,A0,A1,A2,A3:Db; Var T,X,Y:Vec);
procedure An_SinSd(N:Ir; Y0,A,K,Dtau,A0,A1,A2,A3:Db; Var T,X,Y:Vec);

implementation

procedure An_Polin_4(N:Ir; Y0,A,K,Dtau,A0,A1,A2,A3,A4:Db; Var T,X,Y:Vec);
var
  I : Ir;
  Dt,C0,C1,C2,C3,C4 : Db;
begin
 Dt:=Dtau/N;
 C4:=K*A4; C3:=K*A3-4*A*C4; C2:=K*A2-3*A*C3; C1:=K*A1-2*A*C2; C0:=K*A0-A*C1;
 for I:=0 to N do
    begin
    T[I]:=Dt*I;
    X[I]:=A0+A1*T[I]+A2*sqr(T[I])+A3*sqr(T[I])*T[I]+A4*sqr(T[I])*sqr(T[I]);
    Y[I]:=(Y0-C0)*exp(-T[I]/A)+C0+C1*T[I]+C2*sqr(T[I])+C3*sqr(T[I])*T[I]+
    C4*sqr(T[I])*sqr(T[I]);
    end;
End;

procedure An_Bienie(N:Ir; Y0,A,K,Dt,A0,A1,A2,A3,A4:Db; Var T,X,Y:Vec);
var
  I : Ir;
  C1,C2,C3,C4,C5 : Db;
begin
 C1:=K*A0; C2:=K*A1/(1+sqr(A*A2)); C3:=-K*A1*A*A2/(1+sqr(A*A2));
 C4:=K*A3/(1+sqr(A*A4));  C5:=-K*A3*A*A4/(1+sqr(A*A4));
 for I:=0 to N do
    begin
    T[I]:=Dt*I;
    X[I]:=A0+A1*sin(A2*T[I])+A3*sin(A4*T[I]);
    Y[I]:=(Y0-C1-C3-C5)*exp(-T[I]/A)+C1+C2*sin(A2*T[I])+C3*cos(A2*T[I])+
         +C4*sin(A4*T[I])+C5*cos(A4*T[I]);
    end;
End;

procedure An_SinExp(N:Ir; Y0,A,K,Dtau,A0,A1,A2,A3:Db; Var T,X,Y:Vec);
var
  I : Ir;
  Dt,C1,C2,C3 : Db;
begin
 Dt:=Dtau/N;
 C1:=K*A0; C2:=K*A1*sqr(A*A2+1)/(sqr(A*A2+1)+sqr(A*A3));
 C3:=-K*A1*A*A3/(sqr(A*A2+1)+sqr(A*A3));
 for I:=0 to N do
    begin
    T[I]:=Dt*I;
    X[I]:=A0+A1*exp(A2*T[I])*sin(A3*T[I]);
    Y[I]:=(Y0-C1-C3)*exp(-T[I]/A)+C1+exp(A2*T[I])*(C2*sin(A3*T[I])+C3*cos(A3*T[I]));
    end;
End;

procedure An_SinSd(N:Ir; Y0,A,K,Dtau,A0,A1,A2,A3:Db; Var T,X,Y:Vec);
var
  I : Ir;
  Dt,C1,C2,C3 : Db;
begin
 Dt:=Dtau/N;
 C1:=K*A0; C2:=K*A1*(cos(A3)+A2*A*sin(A3))/(sqr(A*A2)+1);
 C3:=K*A1*(sin(A3)-A2*A*cos(A3))/(sqr(A*A2)+1);
 for I:=0 to N do
    begin
    T[I]:=Dt*I;
    X[I]:=A0+A1*sin(A2*T[I]+A3);
    Y[I]:=(Y0-C1-C3)*exp(-T[I]/A)+C1+C2*sin(A2*T[I])+C3*cos(A2*T[I]);
    end;
End;

End.
