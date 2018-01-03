unit formulas;

interface

uses
  CustomFormulas,
  TypeDefinitions;


{$REGION '============================================================================= > | method'}

procedure doHybridPas(PIteration3D: TPIteration3D);
function doHybridPasDE(PIteration3D: TPIteration3D): Double;
procedure doHybridSSE2(PIteration3D: TPIteration3D);
function doHybridDESSE2(PIteration3D: TPIteration3D): Double;
procedure doInterpolHybridPas(PIteration3D: TPIteration3D);
procedure doInterpolHybridSSE2(PIteration3D: TPIteration3D);
function doInterpolHybridPasDE(PIteration3D: TPIteration3D): Double;
function doInterpolHybridDESSE2(PIteration3D: TPIteration3D): Double;
procedure doInterpolHybridPas4D(PIteration3D: TPIteration3D);
function doInterpolHybridPas4DDE(PIteration3D: TPIteration3D): Double;
//function doInterpolHybridPasIFS(PIteration3D: TPIteration3D): Double;
procedure doHybrid4DPas(PIteration3D: TPIteration3D);
procedure doHybrid4DSSE2(PIteration3D: TPIteration3D);
function doHybrid4DDEPas(PIteration3D: TPIteration3D): Double;
function doHybridIFS3D(PIteration3D: TPIteration3D): Double;
function doHybridIFS3DnoVecIni(PIteration3D: TPIteration3D): Double; //to use behind common fractals, use the new vec for it
procedure HybridCube(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridCubeDE(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridCubeSSE2(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridCubeSSE2DE(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridItTricorn(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridQuat(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridItIntPow2(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridItIntPow3(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridItIntPow4(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridIntP5(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridIntP6(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridIntP7(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridIntP8(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridQuatSSE2(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridItIntPow2SSE2(var x, y, z, w: Double; PIteration3D: TPIteration3D);
//procedure HybridCustomIFS;
procedure TestHybrid(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridCustomIFStest;
procedure HybridFloatPow(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure HybridSuperCube2(var x, y, z, w: Double; PIteration3D: TPIteration3D);   //Bulbox
procedure HybridFolding(var x, y, z, w: Double; PIteration3D: TPIteration3D);
procedure EmptyFormula(var x, y, z, w: Double; PIteration3D: TPIteration3D); //for not used formulas
procedure HybridItIntPow2scale(var x, y, z, w: Double; PIteration3D: TPIteration3D); //sine bulb with scaling
procedure CalcSmoothIterations(PIt3D: TPIteration3D; n: Integer);
procedure AexionC(var x, y, z, w: Double; PIteration3D: TPIteration3D);

{$ENDREGION '========================================================================== > | method'}


{$REGION '============================================================================= > | var'}

var
    fIsMemberAlternating:   TMandFunction    = doHybridPas;
    fIsMemberAlternatingDE: TMandFunctionDE  = doHybridPasDE;
    fIsMemberAlternating4D: TMandFunction    = doHybrid4DPas;
    fIsMemberIpol:          TMandFunction    = doInterpolHybridPas;
    fIsMemberIpolDE:        TMandFunctionDE  = doInterpolHybridPasDE;
    fHybridCubeDE:          ThybridIteration = HybridCubeDE;
    fHybridCube:            ThybridIteration = HybridCube;
    fHybridQuat:            ThybridIteration = HybridQuat;
    fHybridItIntPow2:       ThybridIteration = HybridItIntPow2;
    fHybridTricorn:         ThybridIteration = HybridItTricorn;
    fHIntFunctions:         array[2..8] of ThybridIteration = (
      HybridItIntPow2,
      HybridItIntPow3,
      HybridItIntPow4,
      HybridIntP5,
      HybridIntP6,
      HybridIntP7,
      HybridIntP8);


    testhybridDEoption:    Integer = -1;  //X+SinY
    testhybridRstop:       Double  = 16;
    testhybridDEscale:     Double  = 0.2;
    testhybridPow:         Double  = 2;   //0,7,0    21: .SRECI2 single + reciproc single
    testhybridOptionCount: Integer = 6;   //AmazingBox vars: scale=double, MinR=boxscale: Scale/Sqr(MinR), Sqr(MinR), Fold=double..
    testhybridOptionTypes:     array[0..5] of Integer = (2,2,1,1,1,1);  //6:.3SingleAngles  9:DSquare
    testhybridOptionVals:      array[0..5] of Double = (1,2,0,1,1,0);
    testhybridOptionsStrings:  array[0..5] of String = (
      'Index1',
      'Index2',
      'Offset 1',
      'Scale 1',
      'Scale 2',
      'Offset 2');


{$ENDREGION '========================================================================== > | var'}


{$REGION '============================================================================= > | const'}

const  cs05:                  Single  = 0.5;
       cs099:                 Single  = 0.99;
       testIFSDEoption:       Integer = 20;
       testIFSOptionCount:    Integer = 10;  //Plane with otrap map coloring
       testIFSOptionTypes:    array [0..9] of Integer = (0,0,0,0,0,2,2,1,1,2);
       testIFSOptionVals:     array [0..9] of Double = (0,1,0,0,1,0,0,0,1,0);
       testIFSOptionsStrings: array [0..9] of String = (
        'Normal Z',
        'Normal Y',
        'Normal X',
        'Offset',
        'Scale',
        'Otrap color map',
        'Map channel',
        'Otrap offset',
        'Otrap scale',
        'Solid (0,1)');


{$ENDREGION '========================================================================== > | const'}

implementation

uses
  Math,
  DivUtils,
  Math3D,
  SysUtils;
//LightGUI


{$REGION '============================================================================= > | method'}


procedure HybridCustomIFStest;
asm

    //PlaneIFS   DotProd(Normal,P) - Offset
  movupd xmm0, [esi - 120]  //x,y
  movsd  xmm1, [esi - 104]  //z
  mulpd  xmm0, [edi - 32]
  mulsd  xmm1, [edi - 16]
  addsd  xmm1, xmm0
  unpckhpd xmm0, xmm0
  addsd  xmm1, xmm0
  subsd  xmm1, [edi - 40]
  cmp   [edi - 68], 0
  jne   @up
  andpd xmm1, [edi]
@up: movsd [esi - 32], xmm1   //Rout: Double;     //+56
  mov   edx, [edi - 52]
  test  edx, edx
  jz    @out

  push  ecx              //otrap coloring
  add   esp, -32

  fld   qword [edi - 16]
  fld   qword [edi - 24]
  fld   qword [edi - 32]  //nx,ny,nz
  fld   st   //makeorthovecs
  fabs
  fcomp s011
  fnstsw ax
  and   ah, 41H
  jnz   @@1
  fld   st(2)
  fmul  st, st
  fld   st(1)
  fmul  st, st
  faddp
  fsqrt
  fld1
  fdivrp           //1/Sqrt(rr)
  fldz
  fld   st(4)
  fmul  st, st(2)
  fld   st(3)
  fchs
  fmulp st(2), st  //vo[0],0,vo[2],nx,ny,nz
  jmp   @@2
@@1:
  fld   st(2)
  fmul  st, st
  fld   st(2)
  fmul  st, st
  faddp
  fsqrt
  fld1
  fdivrp           //1/Sqrt(rr)
  fld   st(3)
  fchs
  fmul  st, st(1)
  fld   st(3)
  fmulp st(2), st  //0,vo[1],vo[2],nx,ny,nz
  fldz
@@2:
  fld   st
  fmul  qword [esi - 120] //x
  fld   st(2)
  fmul  qword [esi - 112] //y
  faddp
  fld   st(3)
  fmul  qword [esi - 104] //z
  faddp
  fmul  qword [edi - 48]
  fstp  qword [esp]
  fld   st(5)
  fmul  st, st(2)
  fld   st(5)
  fmul  st, st(4)
  fsubrp                //r0,vo[0],vo[1],vo[2],nx,ny,nz
  fxch
  fmul  st(6), st       //vo[0],r0,vo[1],vo[2],nx,ny,nz*vo[0]
  fxch  st(4)
  fmul  st(3), st       //nx,r0,vo[1],vo[2]*nx,vo[0],ny,nz*vo[0]
  fmulp st(2), st       //r0, vo[1]*nx, vo[2]*nx, vo[0], ny, nz*vo[0]
  fxch  st(4)           //ny, vo[1]*nx, vo[2]*nx, vo[0], r0, nz*vo[0]
  fmulp st(3), st       //vo[1]*nx, vo[2]*nx, vo[0]*ny, r0, nz*vo[0]
  fsubrp st(2), st      //vo[2]*nx, vo[1]*nx-vo[0]*ny=r2, r0, nz*vo[0]
  fsubp st(3), st       //r2, r0, nz*vo[0] - vo[2]*nx = r1
  fmul  qword [esi - 104] //z
  fxch
  fmul  qword [esi - 120] //x
  faddp
  fxch
  fmul  qword [esi - 112] //y
  faddp
  fmul  qword [edi - 48]
  fstp  qword [esp + 8]
  mov   eax, esp
  mov   ecx, esp
  call  [esi + 268]         //+356 - 88 = 268
//   PMapFunc2:  esi+356    //   eax             edx             ecx
//function GetMapPixelDirectXY(PVec3D: TPVec3D; MapNr: Integer): TVec3D; //Direct pixel coords 0..1 with tiling
  mov   ecx, [edi - 56]
  and   ecx, 3
  fld   qword [esp + ecx * 8]   //col of map
  fadd  dword [edi - 60]
  fmul  dword [edi - 64]
  fstp  qword [esi + 128]
  add   esp, 32
  pop   ecx
@out:



end;

procedure ipow2(var x, y: Double);  //x:=x*x-y*y   y:=2xy
asm
    fld  qword [eax]
    fld  qword [edx]
    fld  st(0)           //y,y,x
    fmul st(0), st(2)    //y*x,y,x
    fadd st(0), st(0)
    fstp qword [edx]
    fmul st(0), st(0)    //y*y,x
    fxch
    fmul st(0), st(0)    //x*x,y*y
    fsubrp st(1), st(0)
    fstp qword [eax]
end;

procedure ComplexSqr(var xy: TComplex);  //x:=x*x-y*y   y:=2xy
asm
    fld  qword [eax]
    fld  qword [eax + 8] //y,x
    fld  st(0)           //y,y,x
    fmul st(0), st(2)    //y*x,y,x
    fadd st(0), st(0)
    fstp qword [eax + 8]
    fmul st(0), st(0)    //y*y,x
    fxch
    fmul st(0), st(0)    //x*x,y*y
    fsubrp st(1), st(0)
    fstp qword [eax]
end;

function ComplexMul(c1, c2: TComplex): TComplex;  //r[0] := x1*x2-y1*y2   r[1]:=x1*y2+x2*y1
begin
    Result[0] := c1[0] * c2[0] - c1[1] * c2[1];
    Result[1] := c1[0] * c2[1] + c1[1] * c2[0];
end;

function ComplexSqr2(c1: TComplex): TComplex;
begin
    Result[0] := c1[0] * c1[0] - c1[1] * c1[1];
    Result[1] := 2 * c1[0] * c1[1];
end;

function CConj(c1: TComplex): TComplex;
begin
    Result[0] := c1[0];
    Result[1] := -c1[1];
end;

function ComplexPower(cB, cE: TComplex): TComplex;
var c1, c2: TComplex;
    s, c, d: Double;
begin
    c1[0] := 0.5 * Ln(Sqr(cB[0]) + Sqr(cB[1]));
    c1[1] := ArcTan2(cB[1], cB[0]);
    c2[0] := cE[0] * c1[0] - cE[1] * c1[1];
    c2[1] := cE[0] * c1[1] + cE[1] * c1[0];
    d := Exp(c2[0]);
    SinCosD(c2[1], s, c);
    Result[0] := c * d;
    Result[1] := s * d;
end;

function ComplexSub(c1, c2: TComplex): TComplex;
begin
    Result[0] := c1[0] - c2[0];
    Result[1] := c1[1] - c2[1];
end;

function ComplexAdd(c1, c2: TComplex): TComplex;
begin
    Result[0] := c1[0] + c2[0];
    Result[1] := c1[1] + c2[1];
end;

function ComplexScale(c1: TComplex; d: Double): TComplex;
begin
    Result[0] := c1[0] * d;
    Result[1] := c1[1] * d;
end;

procedure QuatRotate(v: TPVec3D; q: TQuaternion);
var //w: TVec3D;
    w, x, y, z: Double;
begin
  {  w := v;
    v[0] := w[0] * (1 - 2 * (Sqr(q[1]) - Sqr(q[2]))) + w[1] * () + w[2] * ();
    v[1] := w[0] * () + w[1] * () + w[2] * ();
    v[2] := w[0] * () + w[1] * () + w[2] * ();   }

    w := -q[0] * v[0] - q[1] * v[1] - q[2] * v[2];
    x := q[3] * v[0] + q[1] * v[2] - q[2] * v[1];
    y := q[3] * v[1] - q[0] * v[2] + q[2] * v[0];
    z := q[3] * v[2] + q[0] * v[1] - q[1] * v[0];

    v[0] := (w * -q[0] + x * q[3] - y * q[2] + z * q[1]);
    v[1] := (w * -q[1] + x * q[2] + y * q[3] - z * q[0]);
    v[2] := (w * -q[2] - x * q[1] + y * q[0] + z * q[3]);
end;

procedure QuatMultiply(q1, q2: TPQuaternion);
var qt: TQuaternion;
begin
    qt := q1^;
    q1[3] := (qt[3]*q2[3] - qt[0]*q2[0] - qt[1]*q2[1] - qt[2]*q2[2]);
    q1[0] := (qt[3]*q2[0] + qt[0]*q2[3] + qt[1]*q2[2] - qt[2]*q2[1]);
    q1[1] := (qt[3]*q2[1] - qt[0]*q2[2] + qt[1]*q2[3] + qt[2]*q2[0]);
    q1[2] := (qt[3]*q2[2] + qt[0]*q2[1] - qt[1]*q2[0] + qt[2]*q2[3]);
end;

function Heart(x, y, z: Double): Double;
var xx, yy, zz, a: Double;
begin
  xx := x*x;
  yy := y*y;
  zz := z*z;
  a := 2*xx + yy + zz - 1;
  a := a*a*a;
  zz := zz * z;
  Result := a - 0.1 * xx * zz - yy * zz;
end;

procedure TestHybrid(var x, y, z, w: Double; PIteration3D: TPIteration3D); //available if 't' pressed on intern formula
const piM05: Double = 0.5 * Pi;
      d0148: Double = 0.148148148148148;

asm
    push esi   // PlusSinApp   fast V1+Sin(V2) with index, preoffset, prescale, scale, offset
    push edi
    push eax
    push edx
    mov  esi, [ebp + 8]
    mov  edi, [esi + 48]
    mov  esi, [edi - 16]
    and  esi, 3
    fld  qword [eax + esi * 8]
    xor  edx, edx
    fsub dword [edi - 20]
    fmul dword [edi - 24]
    fmul qword [edi]    // Pi05d //
    fld  st
    fsub qword [edi - 8]
    frndint
    fsubp
    fadd  st, st
    fld1
    fcomp
    fnstsw ax
    shr  ah, 1
    jnc  @1
    fld1
    fadd st, st
    fsubrp
    xor  edx, $80000000
@1: fldpi
    fmulp
    fcom  qword [edi + 8] //piM05 //
    fnstsw ax
    shr  ah, 1
    jc   @2
    fldpi
    fsubp
    xor  edx, $80000000
@2: fld  st
    fmul st, st
    fmul st, st(1)
    fmul qword [edi + 16] //d0148 //
    fsubp
    test edx, $80000000
    jns  @3
    fchs
@3:
    pop  edx
    pop  eax
    mov  esi, [edi - 12]
    fmul dword [edi - 28]
    and  esi, 3
    fadd dword [edi - 32]
    fadd qword [eax + esi * 8]
    fstp qword [eax + esi * 8]
    pop  edi
    pop  esi



end;

procedure doInterpolHybridPas(PIteration3D: TPIteration3D); //interpolate between 2 formulas. nHybrid[n] is single-weight
var X1, Y1: TVec4D;                                         //new ext version
    XX, YY: Double;  
    S1, S2: Single;
begin
    with TPIteration3Dext(Integer(PIteration3D) - 56)^ do
    begin
      if DoJulia then mCopyVec(@J1, @JU1) else mCopyVec(@J1, @C1);
      mCopyVec(@x, @C1);
      w := 0;
      Rout  := x * x + y * y + z * z;
      OTrap := Rout;
      bFirstIt  := 0;
      ItResultI := 0;
      S1 := PSingle(@nHybrid[0])^;
      S2 := PSingle(@nHybrid[1])^;
      repeat
        Rold := Rout;
        mCopyVec4(@Y1, @x);
        PVar := fHPVar[0];
        fHybrid[0](x, y, z, w, PIteration3D);
        mCopyVec4(@x1, @x);
        mCopyVec4(@x, @Y1);
        PVar := fHPVar[1];
        fHybrid[1](x, y, z, w, PIteration3D);
        XX := Sqrt(Sqr(x1[0]) + Sqr(x1[1]) + Sqr(x1[2]));
        YY := Sqrt(x * x + y * y + z * z);
        XX := XX * S1 + YY * S2;
        x := x1[0] * S1 + x * S2;
        y := x1[1] * S1 + y * S2;
        z := x1[2] * S1 + z * S2;
        w := x1[3] * S1 + w * S2;
        YY := XX / Sqrt(x * x + y * y + z * z + 1e-40);
        x := x * YY;
        y := y * YY;
        z := z * YY;
        Inc(ItResultI);
        Rout := XX * XX;
        if Rout < OTrap then OTrap := Rout;
      until
        (ItResultI >= maxIt) or (Rout > RStop);
      if CalcSIT then CalcSmoothIterations(PIteration3D, 0);
    end;
end;

procedure doInterpolHybridSSE2(PIteration3D: TPIteration3D);   // new ext version 
asm
  push  eax
  push  ebx                  
  push  ecx
  push  edx                  
  push  esi
  push  edi                   //x = edi-32  y = edi-24 ..  Rold = edi - 48, Rstop = edi - 40, (i = edi + 212 = btmp = esi - 44)
  add   esp, -72
  mov   edi, eax              //was: Rold = esp, Rstop = esp + 8, aligned16: esp + 16,  X1 = a16  X2 = a16+8..  Y1 = a16+32 ..
  lea   esi, eax + 256
  mov   eax, esp
  add   eax, 35
  and   eax, $FFFFFFF0
  mov   [esp], eax            // aligned 16 Ybuf    aligned16: esp,  X1 = a16.. = Y1 =  (aligned)
  cvtps2pd xmm7, [edi + 76]   //nHybrid[0] +76  weights in double for s1,s2 (lo,hi part)
  movupd  xmm0, [edi]
  movsd   xmm1, [edi + 16]
  movupd  [edi - 32], xmm0    //xyz=C
  movupd  [edi - 16], xmm1
  cmp   dword [esi - 104], 0  //DoJulia:+152
  jz    @sjup
  movupd  xmm2, [esi + 64]
  movsd   xmm3, [esi + 80]
  movupd  [edi + 24], xmm2    //J=Ju
  movsd   [edi + 40], xmm3
  jmp   @skipIfJulia
@sjup:
  movupd  [edi + 24], xmm0    //J=C
  movsd   [edi + 40], xmm1
@skipIfJulia:
  mulpd   xmm0, xmm0
  mulsd   xmm1, xmm1
  CVTSS2SD xmm5, [edi + 72]   //RStop in double
  addsd   xmm1, xmm0
  unpckhpd  xmm0, xmm0
  movsd   [edi - 40], xmm5
  addsd   xmm1, xmm0
  xor   ebx, ebx
  movsd   [esi - 64], xmm1    //OTrap=Rout
  movsd   [edi + 56], xmm1    //Rout
  mov   [esi - 48], ebx       //bFirstIt  := 0; +208
  mov   [edi + 64], ebx       //ItresultI :=0   +64

@Repeat:
  movsd   xmm2, [edi + 56]
  mov   ebx, [edi + 100]      //fHPVar[0] +100
  mov   eax, [esp]
  mov   [edi + 48], ebx       //PVars:    +48
  movsd   [edi - 48], xmm2    //Rold := Rout

  movupd  xmm0, [edi - 32]    //Y:=xyz
  movupd  xmm1, [edi - 16]
  movapd  [eax], xmm0
  movapd  [eax + 16], xmm1

  lea   eax, edi - 32         // x
  lea   edx, edi - 24         // y
  lea   ecx, edi - 16         // z
  lea   ebx, edi - 8          // w
  push  ebx
  push  edi
  call  [edi + 124]           //fHybrid[0] of ThybridIteration2

  mov   eax, [esp]
  movupd  xmm0, [edi - 32]        //    mCopyVec4(@x1, @x);
  movupd  xmm1, [edi - 16]        //   mCopyVec4(@x, @Y1);
  movapd  xmm2, [eax]
  movapd  xmm3, [eax + 16]
  movapd  [eax], xmm0
  movapd  [eax + 16], xmm1
  movupd  [edi - 32], xmm2    //xyz=Y1
  movupd  [edi - 16], xmm3

  mov   ebx, [edi + 104]      //fHPVar[1]
  mov   [edi + 48], ebx       //PVars:    +48
  lea   eax, edi - 32         // x
  lea   edx, edi - 24         // y
  lea   ecx, edi - 16         // z
  lea   ebx, edi - 8          // w
  push  ebx
  push  edi
  call  [edi + 128]           //fHybrid[1] of ThybridIteration2

  mov   eax, [esp]
  movupd  xmm0, [edi - 32]    //x,y   was: y1
  movapd  xmm2, [eax]         //x[0,1]
  movupd  xmm1, [edi - 16]    //z,w
  movapd  xmm3, [eax + 16]    //x[2,3]
  movapd  xmm5, xmm0          //x,y
  movapd  xmm6, xmm2          //x[0,1]
  mulpd   xmm0, xmm0          //x²,y²
  mulpd   xmm2, xmm2          //x[0]²,x[1]²
  mulsd   xmm1, xmm1          //z²,w
  mulsd   xmm3, xmm3          //x[2]²
  addsd   xmm1, xmm0          //z²+x²
  addsd   xmm3, xmm2          //x[2]²+x[0]²
  unpckhpd xmm0, xmm0         //y²
  unpckhpd xmm2, xmm2         //x[1]²
  addsd   xmm1, xmm0          //x²+y²+z²
  addsd   xmm3, xmm2          //x[0]²+x[1]²+x[2]²
  unpcklpd xmm3, xmm1         //x[0]²+x[1]²+x[2]²,x²+y²+z²
  sqrtpd  xmm0, xmm3          //xx,yy
  mulpd   xmm0, xmm7          //xx*s1,yy*s2
  pshufd  xmm2, xmm0, $4E
  addsd   xmm0, xmm2          //XX = xx*s1+yy*s2
  pshufd  xmm3, xmm7, $4E     //wy
  movsd   xmm2, xmm7          //wx
  unpcklpd xmm3, xmm3         //s2,s2
  unpcklpd xmm2, xmm2         //s1,s1
  movupd  xmm1, [edi - 16]    //z,w
  mulpd   xmm5, xmm3          //x,y *s2
  mulpd   xmm6, xmm2          //x[0,1] *s1
  mulpd   xmm3, xmm1          //z,w *s2
  mulpd   xmm2, [eax + 16]    //x[2,3] *s1
  addpd   xmm5, xmm6          //x,y
  addpd   xmm3, xmm2          //z,w

  movapd  xmm4, xmm5          //x,y
  movsd   xmm2, xmm3          //z
  mulpd   xmm4, xmm4          //x²,y²
  mulsd   xmm2, xmm2          //z²      4D:  mulpd
  addsd   xmm2, xmm4          //z²+x²   4D: addpd ...
  unpckhpd xmm4, xmm4         //y²
  addsd   xmm4, xmm2          //x²+y²+z²
  addsd   xmm4, d1em40
  sqrtsd  xmm4, xmm4

  movsd   xmm2, xmm0          //XX
  divsd   xmm2, xmm4          //YY := XX / Sqrt(x * x + y * y + z * z + 1e-40);
  unpcklpd xmm2, xmm2         //YY,YY
  mulpd   xmm5, xmm2
  mulsd   xmm3, xmm2
  movupd  [edi - 32], xmm5    //x,y
  movupd  [edi - 16], xmm3    //z,w
  mulsd   xmm0, xmm0
  movsd   [edi + 56], xmm0    //Rout := XX * XX;
  movsd   xmm1, xmm0
  inc   dword [edi + 64]      //Inc(ItResultI)
  minsd   xmm0, [esi - 64]
  movsd   [esi - 64], xmm0    //OTrap := Min(Rout, OTrap);

  mov   eax, [edi + 64]
  cmp   eax, [edi + 68]       //maxIt: +68
  jnl   @out
  comisd  xmm1, [edi - 40]    //RStop
  jc    @Repeat
@out:
  cmp   byte [esi - 108], 0  //CalcSIT: +148
  jz    @NoCalcSITout

  mov   eax, edi
  xor   edx, edx
  call  CalcSmoothIterations //(PIt3D: TPIteration3D; n: Integer);
@NoCalcSITout:
  add   esp, 72
  pop   edi
  pop   esi
  pop   edx
  pop   ecx
  pop   ebx
  pop   eax
end;

function doInterpolHybridPasDE(PIteration3D: TPIteration3D): Double;
var X1, Y1: TVec4D;                                     
    XX, YY: Double;  
    S1, S2: Single;
begin
    with TPIteration3Dext(Integer(PIteration3D) - 56)^ do
    begin
      if DoJulia then mCopyVec(@J1, @JU1) else mCopyVec(@J1, @C1);
      mCopyVec(@x, @C1);
      Rout  := x * x + y * y + z * z;
      OTrap := Rout;
      if (DEoption and $18) = 16 then w := Rout else w := 1;
      S1 := PSingle(@nHybrid[0])^;
      S2 := PSingle(@nHybrid[1])^;
      bFirstIt  := 0;
      ItResultI := 0;
      repeat
        Rold := Rout;
        mCopyVec4(@Y1, @x);
        PVar := fHPVar[0];
        fHybrid[0](x, y, z, w, PIteration3D);
        mCopyVec4(@x1, @x);
        mCopyVec4(@x, @Y1);
        PVar := fHPVar[1];
        fHybrid[1](x, y, z, w, PIteration3D);
        XX := Sqrt(Sqr(x1[0]) + Sqr(x1[1]) + Sqr(x1[2]));
        YY := Sqrt(x * x + y * y + z * z);
        XX := XX * S1 + YY * S2;
        x := x1[0] * S1 + x * S2;
        y := x1[1] * S1 + y * S2;
        z := x1[2] * S1 + z * S2;
        w := Abs(x1[3]) * S1 + Abs(w) * S2;
        YY := XX / Sqrt(x * x + y * y + z * z + 1e-40);
        x := x * YY;
        y := y * YY;
        z := z * YY;
        Inc(ItResultI);
        Rout := XX * XX;
        if Rout < OTrap then OTrap := Rout;
      until
        (ItResultI >= maxIt) or (Rout > RStop);

      case DEoption and 7 of
        4: Result := Abs(z) * Ln(Abs(z)) / w; //Julia?
        7: Result := Sqrt(Rout / RStop) * Power(PDouble(Integer(PVar) - 16)^, -ItResultI);    //Pvar does only work for single formula
      else Result := Sqrt(Rout) / Abs(w);   //AmBox + IFS
      end;     // distance = 0.5 * r * log(r) / r_dz;  for analytical powers!

      if CalcSIT then CalcSmoothIterations(PIteration3D, 0);
    end;
end;

function doInterpolHybridDESSE2(PIteration3D: TPIteration3D): Double;   // new ext version
asm
  push  eax
  push  ebx                  
  push  ecx
  push  edx                  
  push  esi
  push  edi                   //x = edi-32  y = edi-24 ..  Rold = edi - 48, Rstop = edi - 40, i = edi + 212 = btmp = esi - 44
  add   esp, -72
  mov   edi, eax              //was: Rold = esp, Rstop = esp + 8, aligned16: esp + 16,  X1 = a16  X2 = a16+8..  Y1 = a16+32 ..
  lea   esi, eax + 256
  mov   eax, esp
  add   eax, 35              
  and   eax, $FFFFFFF0
  mov   [esp], eax            // aligned 16 Ybuf    aligned16: esp,  X1 = a16.. = Y1 =  (aligned)
  cvtps2pd xmm7, [edi + 76]   //nHybrid[0] +76  weights in double for s1,s2 (lo,hi part)
  movupd  xmm0, [edi]
  movsd   xmm1, [edi + 16]
  movupd  [edi - 32], xmm0    //xyz=C
  movupd  [edi - 16], xmm1
  cmp   dword [esi - 104], 0  //DoJulia:+152
  jz    @sjup
  movupd  xmm2, [esi + 64]
  movsd   xmm3, [esi + 80]
  movupd  [edi + 24], xmm2    //J=Ju
  movsd   [edi + 40], xmm3
  jmp   @skipIfJulia
@sjup:
  movupd  [edi + 24], xmm0    //J=C
  movsd   [edi + 40], xmm1
@skipIfJulia:
  mulpd   xmm0, xmm0
  mulsd   xmm1, xmm1
  CVTSS2SD xmm5, [edi + 72]   //RStop in double
  addsd   xmm1, xmm0
  unpckhpd  xmm0, xmm0
  movsd   [edi - 40], xmm5
  addsd   xmm1, xmm0
  xor   ebx, ebx
  movsd   [esi - 64], xmm1    //OTrap=Rout
  movsd   [edi + 56], xmm1    //Rout
  mov   [esi - 48], ebx       //bFirstIt  := 0; +208
  mov   [edi + 64], ebx       //ItresultI :=0   +64

  mov   eax, [esi - 96]       //DEoption +160
  and   eax, $18
  sub   eax, 16
  jnz   @UU1
  fld   qword [edi + 56]
  jmp   @UU2
@UU1:
  fld1
@UU2:  
  fstp  qword [edi - 8]       // if (DEoption and $18) = 16 then w := Rout  else w := 1;

@Repeat:
  movsd   xmm2, [edi + 56]
  mov   ebx, [edi + 100]      //fHPVar[0] +100
  mov   eax, [esp]
  mov   [edi + 48], ebx       //PVars:    +48
  movsd   [edi - 48], xmm2    //Rold := Rout

  movupd  xmm0, [edi - 32]    //Y:=xyz
  movupd  xmm1, [edi - 16]
  movapd  [eax], xmm0
  movapd  [eax + 16], xmm1

  lea   eax, edi - 32         // x
  lea   edx, edi - 24         // y
  lea   ecx, edi - 16         // z
  lea   ebx, edi - 8          // w
  push  ebx
  push  edi
  call  [edi + 124]           //fHybrid[0] of ThybridIteration2

  mov   eax, [esp]
  movupd  xmm0, [edi - 32]        //    mCopyVec4(@x1, @x);
  movupd  xmm1, [edi - 16]        //   mCopyVec4(@x, @Y1);
  movapd  xmm2, [eax]
  movapd  xmm3, [eax + 16]
  movapd  [eax], xmm0
  movapd  [eax + 16], xmm1
  movupd  [edi - 32], xmm2    //xyz=Y1
  movupd  [edi - 16], xmm3

  mov   ebx, [edi + 104]      //fHPVar[1]
  mov   [edi + 48], ebx       //PVars:    +48
  lea   eax, edi - 32         // x
  lea   edx, edi - 24         // y
  lea   ecx, edi - 16         // z
  lea   ebx, edi - 8          // w
  push  ebx
  push  edi
  call  [edi + 128]           //fHybrid[1] of ThybridIteration2

  mov   eax, [esp]
  movupd  xmm0, [edi - 32]    //x,y   was: y1
  movapd  xmm2, [eax]         //x[0,1]
  movupd  xmm1, [edi - 16]    //z,w
  movapd  xmm3, [eax + 16]    //x[2,3]
  movapd  xmm5, xmm0          //x,y
  movapd  xmm6, xmm2          //x[0,1]
  mulpd   xmm0, xmm0          //x²,y²
  mulpd   xmm2, xmm2          //x[0]²,x[1]²
  mulsd   xmm1, xmm1          //z²,w
  mulsd   xmm3, xmm3          //x[2]²
  addsd   xmm1, xmm0          //z²+x²
  addsd   xmm3, xmm2          //x[2]²+x[0]²
  unpckhpd xmm0, xmm0         //y²
  unpckhpd xmm2, xmm2         //x[1]²
  addsd   xmm1, xmm0          //x²+y²+z²
  addsd   xmm3, xmm2          //x[0]²+x[1]²+x[2]²
  unpcklpd xmm3, xmm1         //x[0]²+x[1]²+x[2]²,x²+y²+z²
  sqrtpd  xmm0, xmm3          //xx,yy
  mulpd   xmm0, xmm7          //xx*s1,yy*s2
  pshufd  xmm2, xmm0, $4E
  addsd   xmm0, xmm2          //XX = xx*s1+yy*s2
  pshufd  xmm3, xmm7, $4E     //wy
  movsd   xmm2, xmm7          //wx
  unpcklpd xmm3, xmm3         //s2,s2
  unpcklpd xmm2, xmm2         //s1,s1
  movupd  xmm1, [edi - 16]    //z,w
  mulpd   xmm5, xmm3          //x,y *s2
  mulpd   xmm6, xmm2          //x[0,1] *s1
  mulpd   xmm3, xmm1          //z,w *s2
  mulpd   xmm2, [eax + 16]    //x[2,3] *s1
  addpd   xmm5, xmm6          //x,y
  addpd   xmm3, xmm2          //z,w

  movapd  xmm4, xmm5          //x,y
  movsd   xmm2, xmm3          //z
  mulpd   xmm4, xmm4          //x²,y²
  mulsd   xmm2, xmm2          //z²      4D:  mulpd
  addsd   xmm2, xmm4          //z²+x²   4D: addpd ...
  unpckhpd xmm4, xmm4         //y²
  addsd   xmm4, xmm2          //x²+y²+z²
  addsd   xmm4, d1em40
  sqrtsd  xmm4, xmm4

  movsd   xmm2, xmm0          //XX
  divsd   xmm2, xmm4          //YY := XX / Sqrt(x * x + y * y + z * z + 1e-40);
  unpcklpd xmm2, xmm2         //YY,YY
  mulpd   xmm5, xmm2
  mulsd   xmm3, xmm2
  movupd  [edi - 32], xmm5    //x,y
  movupd  [edi - 16], xmm3    //z,w
  mulsd   xmm0, xmm0
  movsd   [edi + 56], xmm0    //Rout := XX * XX;
  movsd   xmm1, xmm0
  inc   dword [edi + 64]      //Inc(ItResultI)
  minsd   xmm0, [esi - 64]
  movsd   [esi - 64], xmm0    //OTrap := Min(Rout, OTrap);

  mov   eax, [edi + 64]
  cmp   eax, [edi + 68]       //maxIt: +68
  jnl   @out
  comisd  xmm1, [edi - 40]    //RStop
  jc    @Repeat
@out:
  mov   eax, [esi - 96]       //DEoption +160
  and   eax, 7
  sub   eax, 4       
  jnz   @UU3     //Result := Abs(z) * Ln(Abs(z)) / w;
  fld   qword [edi - 16]
  fabs
  fldln2
  fld   st(1)
  fyl2x
  fmulp
  fdiv  qword [edi - 8]   //Result
  jmp   @UU6
@UU3:
  sub   eax, 3                           //  / intPower faster?
  jnz   @UU4   //Result := Sqrt(Rout/RStop) * Power(PDouble(Integer(PVar) - 16)^, -ItResultI);
  mov   eax,  [edi + 48]
  fild  dword [edi + 64]  //ItResultI
  fchs              //-ItresultI
  fld   qword [eax - 16]  //(Pvar-16)^ (= scale or something)
  fldln2      //power function  base,expo  -> st, st(1)
  fxch
  fyl2x
  fxch
  fmulp
  fldl2e
  fmulp
  fld   st(0)
  frndint
  fsub  st(1), st(0)
  fxch
  f2xm1
  fld1
  faddp
  fscale
  fstp  st(1) //end of power function
  fld   qword [edi + 56]
  fdiv  dword [edi + 72] //rout/rstop,pow
  fsqrt
  fmulp
  jmp   @UU6
@UU4:          // else Result := Sqrt(Rout) / Abs(w);
  fld   qword [edi + 56]
  fsqrt
  fld   qword [edi - 8]
  fabs
  fdivp
@UU6:

  cmp   byte [esi - 108], 0  //CalcSIT: +148
  jz    @NoCalcSITout

  mov   eax, edi
  xor   edx, edx
  call  CalcSmoothIterations //(PIt3D: TPIteration3D; n: Integer);

@NoCalcSITout:
  add   esp, 72
  pop   edi
  pop   esi
  pop   edx
  pop   ecx
  pop   ebx
  pop   eax
end;

procedure doInterpolHybridPas4D(PIteration3D: TPIteration3D);
var X1, Y1: TVec4D;                                     
    XX, YY: Double;  
    S1, S2: Single;
begin
    with TPIteration3Dext(Integer(PIteration3D) - 56)^ do
    begin
      Rotate4Dex(@C1, @x, @SMatrix4);
      if DoJulia then
      begin
        mCopyVec(@J1, @JU1);
        J4 := Ju4;
      end
      else
      begin
        mCopyVec(@J1, @x);
        J4 := w;
      end;
      Rout := x*x + y*y + z*z + w*w;
      OTrap := Rout;
      bFirstIt := 0;
      ItResultI := 0;
      S1 := PSingle(@nHybrid[0])^;
      S2 := PSingle(@nHybrid[1])^;
      repeat
        Rold := Rout;
        mCopyVec4(@Y1, @x);
        PVar := fHPVar[0];
        fHybrid[0](x, y, z, w, PIteration3D);
        mCopyVec4(@x1, @x);
        mCopyVec4(@x, @Y1);
        PVar := fHPVar[1];
        fHybrid[1](x, y, z, w, PIteration3D);
        XX := Sqrt(Sqr(x1[0]) + Sqr(x1[1]) + Sqr(x1[2]) + Sqr(x1[3]));
        YY := Sqrt(x*x + y*y + z*z + w*w);
        XX := XX * S1 + YY * S2;
        x := x1[0] * S1 + x * S2;
        y := x1[1] * S1 + y * S2;
        z := x1[2] * S1 + z * S2;
        w := x1[3] * S1 + w * S2;
        YY := XX / Sqrt(x*x + y*y + z*z + w*w + 1e-40);
        x := x * YY;
        y := y * YY;
        z := z * YY;
        w := w * YY;
        Inc(ItResultI);
        Rout := XX * XX;
        if Rout < OTrap then OTrap := Rout;
      until
        (ItResultI >= maxIt) or (Rout > RStop);
      if CalcSIT then CalcSmoothIterations(PIteration3D, 0);
    end;
end;

function doInterpolHybridPas4DDE(PIteration3D: TPIteration3D): Double;
var X1, Y1: TVec4D;                                     
    XX, YY, DT, DD: Double;
    S1, S2: Single;
begin
    with TPIteration3Dext(Integer(PIteration3D) - 56)^ do
    begin
      Rotate4Dex(@C1, @x, @SMatrix4);
      if DoJulia then
      begin
        mCopyVec(@J1, @JU1);
        J4 := Ju4;
      end
      else
      begin
        mCopyVec(@J1, @x);
        J4 := w;
      end;
      Rout := x*x + y*y + z*z + w*w;
      OTrap := Rout;
      bFirstIt := 0;
      ItResultI := 0;
      case (DEoption and $38) of
        16:  Deriv1 := Rout;
        32:  begin Deriv1 := 1; Deriv2 := 0; Deriv3 := 0; end;
      else Deriv1 := 1;
      end;
      S1 := PSingle(@nHybrid[0])^;
      S2 := PSingle(@nHybrid[1])^;
      repeat
        Rold := Rout;
        mCopyVec4(@Y1, @x);
        DT := Deriv1;
        PVar := fHPVar[0];
        fHybrid[0](x, y, z, w, PIteration3D);
        mCopyVec4(@x1, @x);
        mCopyVec4(@x, @Y1);
        DD := Deriv1;
        Deriv1 := DT;
        PVar := fHPVar[1];
        fHybrid[1](x, y, z, w, PIteration3D);
        XX := Sqrt(Sqr(x1[0]) + Sqr(x1[1]) + Sqr(x1[2]) + Sqr(x1[3]));
        YY := Sqrt(x*x + y*y + z*z + w*w);
        XX := XX * S1 + YY * S2;
        x := x1[0] * S1 + x * S2;
        y := x1[1] * S1 + y * S2;
        z := x1[2] * S1 + z * S2;
        w := x1[3] * S1 + w * S2;
        Deriv1 := Abs(DD) * S1 + Abs(Deriv1) * S2;
        YY := XX / Sqrt(x*x + y*y + z*z + w*w + 1e-40);
        x := x * YY;
        y := y * YY;
        z := z * YY;
        w := w * YY;
        Inc(ItResultI);
        Rout := XX * XX;
        if Rout < OTrap then OTrap := Rout;
      until
        (ItResultI >= maxIt) or (Rout > RStop);
      case DEoption and 7 of                      //and 38 = 32...
        4: Result := Abs(z) * Ln(Abs(z)) / Deriv1;
        7: Result := Sqrt(Rout / RStop) * Power(PDouble(Integer(PVar) - 16)^, -ItResultI);    //Pvar does only work for single formula
      else Result := Sqrt(Rout) / Abs(Deriv1);   //AmBox4D + IFS4D         //  / Intpower?
      end;
      if CalcSIT then CalcSmoothIterations(PIteration3D, 0);
    end;
end;

function doHybridIFS3D(PIteration3D: TPIteration3D): Double;  
asm
    push  eax
    push  ebx
    push  ecx
    push  edx
    push  esi
    push  edi                   //x = esi-128  y = esi-120 .. btmp = esi+116  (eax+212)
    lea   esi, eax + 88         
    movupd  xmm0, [eax]         
    movsd   xmm1, [eax + 16]
    movupd  [eax - 32], xmm0    //X=Cx
    movsd   [eax - 16], xmm1
    lea   edx, esi + 128
    cmp   dword [esi + 64], 0   //DoJulia:+152
    jz    @sjup
    movupd  xmm0, [edx + 104]   //J=Ju  +320  -88=+232 -128=104
    movsd   xmm1, [edx + 120]
@sjup:
    movupd  [eax + 24], xmm0    //J=C
    movsd   [eax + 40], xmm1
@skipIfJulia:
    xor   ebx, ebx              //n:=0
    mov   eax, [esi + 296]
    mov   [esi + 120], ebx      //bFirstIt  := 0; +208
    mov   [esi - 24], ebx       //ItresultI:=0   +64
    mov   [esi - 36], eax       //bIsInsideRender tmp in SmothIts
    movzx ebx, word [esi + 102]
    fldz
    fld   d65535                //minDE ini
    fld1
    fstp  qword [esi + 112]     //VaryScale: //+200  absScale, must be changed in formulas
    fstp  qword [esi + TIteration3Dext.OTrap - 144]    // 104 OTrap: Double;  //+192  min of AbsScale
    fstp  qword [edx + TIteration3Dext.Dfree1 - 144 - 128]  //+248 +56
    mov   edi, [esi + ebx * 4 + 12]       //fHPVar[0] +100
    mov   ecx, [esi + ebx * 4 - 12]       //i:=nHybrid[0] +76
    and   ecx, $7FFFFFFF      
@Repeat:
    cmp   ecx, 0
    jnle  @up2
@While:
    inc   ebx
    cmp   bx, word [esi + 62]   //5  wEndTo: Word; //+150
    jle   @up3
    movzx ebx, word [esi + 100]       //n := iRepeatFrom //+188
@up3:
    mov   ecx, [esi + ebx * 4 - 12]   //i := nHybrid[n];  +76
    and   ecx, $7FFFFFFF
    jle   @While
    mov   edi, [esi + ebx * 4 + 12]  //fHPVar:array[0..5] of Pointer; //+100
@up2:
    call  [esi + ebx * 4 + 36]  //fHybrid[0..5] of ThybridIteration2; //+124
    dec   ecx                   //Dec(i)       access violation
    cmp   [esi + ebx * 4 - 12], 0
    jl    @Repeat
    movsd xmm0, [esi - 32]      //DEout relative; Rout: Double;     //+56
    inc   dword [esi - 24]      //Inc(ItResultI)  //+64
    divsd xmm0, [esi + 112]     //abs Scale  VaryScale:  Double;  //+200
    mov   eax, [esi - 24]
    ucomisd xmm0, [esi + 104]   // memorize the smallest DE for itresult
    jnc   @skip
    lea   edx, esi + 104
    mov   [esi + 124], eax      //  bTmp:       Integer;    //+212
    fld   qword [edx + TIteration3Dext.Dfree1 - 144-104]  //+128
    movsd [edx], xmm0           //result DE output
    fstp  qword [edx + TIteration3Dext.Dfree2 - 144-104]  //+136
    cmp   dword [esi - 36], 0   //was: +384  -88=296 bIsInsideRender
    js    @skip                 //if outside, compare if DE is lower than minDE
    ucomisd xmm0, [esi - 128]   //compare with RstopD, that contains the DEstop condition. Stop if nearer.
    jc    @out
@skip:
    cmp   eax, [esi - 20]       //maxIt: +68
    jl    @Repeat
@out:
    fild  dword [esi + 124]
    mov   eax, [esi + 124]      //it on minDE
    fstp  dword [esi - 36]      //SmoothItD:  Single;     //+52
    mov   [esi - 24], eax       //ItResultI
    add   esi, 104
    fld   qword [esi]           //MinDE in OTrap
    fld   qword [esi + 32]      //Dfree2
    fstp  qword [esi]           //OTrap
    pop   edi
    pop   esi
    pop   edx
    pop   ecx
    pop   ebx
    pop   eax
end;

function doHybridIFS3DnoVecIni(PIteration3D: TPIteration3D): Double; //to use behind common fractals, use the new vec for it
asm
    push  eax
    push  ebx
    push  ecx
    push  edx
    push  esi
    push  edi                   //x = esi-128  y = esi-120 .. btmp = esi+116  (eax+212)
    lea   esi, eax + 88         //
    xor   ebx, ebx              //n:=0
    mov   eax, [esi + 296]
    mov   [esi + 120], ebx      //bFirstIt  := 0; +208
    mov   [esi + 124], ebx
    mov   [esi - 24], ebx       //ItresultI:=0   +64
    mov   [esi - 36], eax       //bIsInsideRender tmp in SmothIts
    movzx ebx, word [esi + 102]       //n := iStartFrom
    fldz
    fld   d65535                //minDE ini
    fld1
    fstp  qword [esi + 112]     //VaryScale: //+200  absScale, must be changed in formulas
    fstp  qword [esi + TIteration3Dext.OTrap - 144]    // 104 OTrap: Double;  //+192  min of AbsScale
    fstp   qword [esi + TIteration3Dext.Dfree1 - 144]   //+248 +56
  //  fstp  qword [esi + TIteration3Dext.Dfree2 - 144]   //+248 +56
    mov   edi, [esi + ebx * 4 + 12]       //fHPVar[0] +100
    mov   ecx, [esi + ebx * 4 - 12]       //i:=nHybrid[n] +76
    and   ecx, $7FFFFFFF
@Repeat:
    cmp   ecx, 0
    jnle  @up2
@While:
    inc   ebx
    cmp   bx, word [esi + 62]   //5  wEndTo: Word; //+150
    jle   @up3
    movzx ebx, word [esi + 100]       //n := iRepeatFrom //+188
@up3:
    mov   ecx, [esi + ebx * 4 - 12]   //i := nHybrid[n];  +76
    and   ecx, $7FFFFFFF
    jle   @While
    mov   edi, [esi + ebx * 4 + 12]  //fHPVar:array[0..5] of Pointer; //+100
@up2:
    call  [esi + ebx * 4 + 36]  //fHybrid[0..5] of ThybridIteration2; //+124
    dec   ecx                   //Dec(i)
    cmp   [esi + ebx * 4 - 12], 0
    jl    @Repeat
    movsd xmm0, [esi - 32]      //DEout relative; Rout: Double;     //+56
    inc   dword [esi - 24]      //Inc(ItResultI)  //+64
    divsd xmm0, [esi + 112]     //abs Scale  VaryScale:  Double;  //+200
    mov   eax, [esi - 24]
    ucomisd xmm0, [esi + 104]   // memorize the smallest DE for itresult
    jnc   @skip
    lea   edx, esi + 104
    mov   [esi + 124], eax      //  bTmp:       Integer;    //+212
    fld   qword [edx + TIteration3Dext.Dfree1 - 144-104]  //+128   otrap color option
    movsd [edx], xmm0           //result DE output
    fstp  qword [edx + TIteration3Dext.Dfree2 - 144-104]  //+136
    cmp   dword [esi - 36], 0   //was: +384  -88=296 bIsInsideRender
    jne   @skip                 //if outside, compare if DE is lower than minDE
    ucomisd xmm0, [esi - 128]   //compare with RstopD, that contains the DEstop condition. Stop if nearer.
    jc    @out
@skip:
    cmp   eax, [esi - 20]       //maxIt: +68
    jl    @Repeat
@out:
    fild  dword [esi + 124]
    mov   eax, [esi + 124]      //it on minDE
    fstp  dword [esi - 36]      //SmoothItD:  Single;     //+52
    mov   [esi - 24], eax       //ItResultI
    add   esi, 104
    fld   qword [esi]           //MinDE in OTrap
    fld   qword [esi + 32]      //Dfree2
    fstp  qword [esi]           //OTrap
    pop   edi
    pop   esi
    pop   edx
    pop   ecx
    pop   ebx
    pop   eax
end;     

procedure CalcSmoothIterations(PIt3D: TPIteration3D; n: Integer);

asm
    add  eax, $34
    cmp  dword [eax + TIteration3D.Rout + 4 - $34], $3FF00000 //Rout <= 1? [Rout+4]  //+$3c    cmp with $3FF0.. does not work always!!!
    jg   @@1
    fild dword [eax + TIteration3D.ItResultI - $34]  //+$40
    fstp dword [eax + TIteration3D.SmoothItD - $34]  //+$34
    ret
@@1:
    fld  qword [eax + TIteration3D.Rout - $34]           //+$38  Rout
    cmp  dword [eax + TIteration3Dext.Rold - 56 + 4 - $34], $3FF00000 //Rold <= 1?   -$2c
    jnb  @@2
    fldln2
    fxch       //Rout,ln
    fyl2x
    fmul s05   //ln(Rout)*0.5
    fldln2
    fxch
    fyl2x
    fmul dword [eax + edx * 4 + TIteration3D.fHln - $34]  // PIt3D.fHln[n]  +$00a4
    fild dword [eax + TIteration3D.ItResultI - $34]       //+$40
    fadd dword [eax + TIteration3D.LNRStop - $34]         //+$009c
    fsubrp
    fstp dword [eax + TIteration3D.SmoothItD - $34]       //+$34
    ret
@@2:
    fldln2
    fxch
    fyl2x                  //ln(Rout)
    fmul s05
    fldln2
    fxch
    fyl2x                  //d
    fldln2                 //ln2,d
    fld  qword [eax + TIteration3Dext.Rold - 56 - $34] //Rold,ln2,d
    fyl2x
    fmul s05
    fldln2
    fxch
    fyl2x
    fsubr st, st(1)       //d - Ln(0.5 * Ln(PIt3D.Rold)), d
    fld  dword [eax + TIteration3D.LNRStop - $34]       //+$009c
    fsubrp st(2), st      //d - Ln(0.5 * Ln(PIt3D.Rold)), PIt3D.LNRStop - d
    fadd d1em100   //test
    fdivp                                                    //div0 sometimes
    fiadd dword [eax + TIteration3D.ItResultI - $34]    //+$40
    fstp dword [eax + TIteration3D.SmoothItD - $34]     //+$34
end;

procedure doHybridPas(PIteration3D: TPIteration3D);   //new ext version
var n: Integer;
begin
    with TPIteration3Dext(Integer(PIteration3D) - 56)^ do
    begin
      if DoJulia then mCopyVec(@J1, @JU1) else mCopyVec(@J1, @C1);
      mCopyVec(@x, @C1);
      w     := 0;
      Rout  := x * x + y * y + z * z;
      OTrap := Rout;
      n     := iStartFrom;
      bTmp  := nHybrid[n] and $7FFFFFFF;
      PVar  := fHPVar[n];
      bFirstIt  := 0;
      ItResultI := 0;
      repeat
        Rold := Rout;
        while bTmp <= 0 do
        begin
          Inc(n);
          if n > EndTo then n := iRepeatFrom;
          bTmp := nHybrid[n] and $7FFFFFFF;
          if bTmp > 0 then PVar := fHPVar[n];
        end;
        fHybrid[n](x, y, z, w, PIteration3D);
        Dec(bTmp);
        if nHybrid[n] < 0 then Continue else
        begin
          Inc(ItResultI);
          Rout := x * x + y * y + z * z;
          if Rout < OTrap then OTrap := Rout;
        end;
      until (ItResultI >= maxIt) or (Rout > RStop);
      if CalcSIT then CalcSmoothIterations(PIteration3D, n);
    end;
end;

function doHybrid4DDEPas(PIteration3D: TPIteration3D): Double;
var n: Integer;
begin
    with TPIteration3Dext(Integer(PIteration3D) - 56)^ do
    begin
      Rotate4Dex(@C1, @x, @SMatrix4);
      if DoJulia then
      begin
        mCopyVec(@J1, @JU1);
        J4 := Ju4;
      end
      else
      begin
        mCopyVec(@J1, @x);
        J4 := w;
      end;
      Rout := x*x + y*y + z*z + w*w;
      case (DEoption and $38) of
        16:  Deriv1 := Rout;
        32:  begin Deriv1 := 1; Deriv2 := 0; Deriv3 := 0; end;
      else Deriv1 := 1;
      end;
      OTrap := Rout;
      n     := iStartFrom;
      bTmp  := nHybrid[n] and $7FFFFFFF;
      PVar  := fHPVar[n];
      bFirstIt  := 0;
      ItResultI := 0;
      repeat
        Rold := Rout;
        while bTmp <= 0 do
        begin
          Inc(n);
          if n > EndTo then n := iRepeatFrom;
          bTmp := nHybrid[n] and $7FFFFFFF;
          if bTmp > 0 then PVar := fHPVar[n];
        end;
        fHybrid[n](x, y, z, w, PIteration3D);   //todo: parse 3d DEs deriv1 to w and back
        Dec(bTmp);
        if nHybrid[n] >= 0 then
        begin
          Inc(ItResultI);
          Rout := (x * x + y * y + z * z + w * w);
          if Rout < OTrap then OTrap := Rout;
        end;
      until
        (ItResultI >= maxIt) or (Rout > RStop);
      case DEoption and 7 of
        4: Result := Abs(z) * Ln(Abs(z)) / Deriv1;
        7: Result := Sqrt(Rout / RStop) * Power(PDouble(Integer(PVar) - 16)^, -ItResultI);    //Pvar does only work for single formula
      else Result := Sqrt(Rout) / Abs(Deriv1);   //AmBox4D + IFS4D
      end;
      if CalcSIT then CalcSmoothIterations(PIteration3D, n);
    end;
end;

procedure doHybrid4DPas(PIteration3D: TPIteration3D);    
var n: Integer;
begin
    with TPIteration3Dext(Integer(PIteration3D) - 56)^ do
    begin      //eax, edx, ecx
      Rotate4Dex(@C1, @x, @SMatrix4);
      if DoJulia then
      begin
        mCopyVec(@J1, @JU1);
        J4 := Ju4;
      end
      else
      begin
        mCopyVec(@J1, @x);
       // w := w + dWadd4dstep;  //test: 4d projection, stepping with w add parameter
        J4 := w; 
      end;
      Rout  := x*x + y*y + z*z + w*w;
      OTrap := Rout;
      n     := iStartFrom;
      bTmp  := nHybrid[n] and $7FFFFFFF;
      PVar  := fHPVar[n];
      bFirstIt  := 0;
      ItResultI := 0;
      repeat
        Rold := Rout;
        while bTmp <= 0 do
        begin
          Inc(n);
          if n > EndTo then n := iRepeatFrom;
          bTmp := nHybrid[n] and $7FFFFFFF;
          if bTmp > 0 then PVar := fHPVar[n];
        end;
        fHybrid[n](x, y, z, w, PIteration3D);
        Dec(bTmp);
        if nHybrid[n] >= 0 then
        begin
          Inc(ItResultI);              //test: abs( + + - ); minkowski
          Rout := x * x + y * y + z * z + w * w;
          if Rout < OTrap then OTrap := Rout;
        end;
      until
        (ItResultI >= maxIt) or (Rout > RStop);
      if CalcSIT then CalcSmoothIterations(PIteration3D, n);
    end;
end;

procedure doHybrid4DSSE2(PIteration3D: TPIteration3D);  //new ext version
asm
  push  eax
  push  ebx
  push  ecx
  push  edx
  push  esi
  push  edi                   //x = edi-32  y = edi-24 ..  Rold = edi - 48, Rstop = edi - 40, i = edi + 212 = btmp = esi - 44
  mov   edi, eax
  lea   esi, eax + 256

  lea   edx, edi -32
  mov   ecx, esi
  call  Rotate4Dex            //(@C1, @x, SMatrix4);   C1=It3D=eax

  movupd  xmm6, [edi - 32]
  movupd  xmm7, [edi - 16]
  cmp   dword [esi - 104], 0  //DoJulia:+152
  jz    @sjup
  movupd  xmm2, [esi + 64]
  movupd  xmm3, [esi + 80]
  movupd  [edi + 24], xmm2    //J=Ju
  movlpd  [edi + 40], xmm3
  movhpd  [edi - 56], xmm3    
  jmp   @skipIfJulia
@sjup:
  movupd  [edi + 24], xmm6    //J=C
  movlpd  [edi + 40], xmm7
  movhpd  [edi - 56], xmm7    //J4 = edi - 56
@skipIfJulia:
  mulpd   xmm6, xmm6
  mulpd   xmm7, xmm7
  CVTSS2SD xmm5, [edi + 72]   //RStop in double
  addpd   xmm7, xmm6
  pshufd  xmm6, xmm7, $4E
  movsd   [edi - 40], xmm5
  addsd   xmm7, xmm6          //xmm7=Rout
  movsd   [esi - 64], xmm7    //OTrap=Rout
  movsd   [edi + 56], xmm7    //Rout
  xor   ebx, ebx              //n:=0
  mov   [esi - 48], ebx       //bFirstIt  := 0; +208
  mov   [edi + 64], ebx       //ItresultI:=0   +64
  movzx ebx, word [esi - 66]  //n:=iStartFrom
  mov   eax, [edi + ebx * 4 + 100]      //fHPVar[0] +100
  mov   [edi + 48], eax       //PVars:    +48
  mov   eax, [edi + ebx * 4 + 76]       //i:=nHybrid[0] +76
  and   eax, $7FFFFFFF
  mov   [esi - 44], eax       //i(=It3D.btmp)

@Repeat:
  movsd   [edi - 48], xmm7    //Rold := Rout
  cmp   dword [esi - 44], 0
  jnle  @up2
@While:
  inc   ebx
  cmp   bx, word [esi - 106]   //5  wEndTo: Word; //+150
  jle   @up3
  movzx ebx, word [esi - 68]       //n := iRepeatFrom
@up3:
  mov   eax, [edi + ebx * 4 + 76]   //i := nHybrid[n];  +76
  and   eax, $7FFFFFFF
  jle   @While
  mov   [esi - 44], eax
  mov   eax, [edi + ebx * 4 + 100]  //fHPVar:array[0..5] of Pointer;
  mov   [edi + 48], eax       //PVars: +48
@up2:
  lea   eax, edi - 8          //was: esp + 24   w
  push  eax
  push  edi
  lea   edx, edi - 24         //was: esp + 16   y
  lea   ecx, edi - 16         //was: esp + 24   z
  add   eax, -24              // x
  call  [edi + ebx * 4 + 124] //fHybrid[0..5] of ThybridIteration2; //+124
  dec   [esi - 44]            //Dec(i)   write at addr... false dIFS??
  cmp   [edi + ebx * 4 + 76], 0   //nHybrid[fnr]
  jl    @Repeat  //SkipMaxItTest
  movupd  xmm6, [edi - 32]
  movupd  xmm7, [edi - 16]
  mulpd   xmm6, xmm6
  mulpd   xmm7, xmm7
  addpd   xmm7, xmm6
  pshufd  xmm6, xmm7, $4E
  addsd   xmm7, xmm6          //xmm7=Rout
  movsd   xmm5, xmm7
  minsd   xmm5, qword [esi - 64]
  movsd   [edi + 56], xmm7    //Rout
  movsd   [esi - 64], xmm5    //OTrap
  inc   dword [edi + 64]      //Inc(ItResultI)
  mov   eax, [edi + 64]
  cmp   eax, [edi + 68]       //maxIt: +68
  jnl   @out
  comisd  xmm7, [edi - 40]    //RStop
  jc    @Repeat
@out:
  cmp   byte [esi - 108], 0  //CalcSIT: +148
  jz    @NoCalcSITout

  mov   eax, edi
  mov   edx, ebx
  call  CalcSmoothIterations //(PIt3D: TPIteration3D; n: Integer);

@NoCalcSITout:
  pop   edi
  pop   esi
  pop   edx
  pop   ecx
  pop   ebx
  pop   eax
end;

function doHybridPasDE(PIteration3D: TPIteration3D): Double; //new ext version
var n: Integer;
begin
    with TPIteration3Dext(Integer(PIteration3D) - 56)^ do
    begin
      if DoJulia then mCopyVec(@J1, @JU1) else mCopyVec(@J1, @C1);
      mCopyVec(@x, @C1);
      Rout  := x * x + y * y + z * z;
      OTrap := Rout;
      n     := iStartFrom;
      btmp  := nHybrid[n] and $7FFFFFFF;
      PVar  := fHPVar[n];
      case (DEoption and $38) of
        16:  w := Rout;
        32:  begin Deriv1 := 1; Deriv2 := 0; Deriv3 := 0; end;
      else w := 1;
      end;
      bFirstIt  := 0;
      ItResultI := 0;
      repeat
        Rold := Rout;
        while btmp <= 0 do
        begin
          Inc(n);
          if n > EndTo then n := iRepeatFrom;
          btmp := nHybrid[n] and $7FFFFFFF;
          PVar := fHPVar[n];
        end;
        fHybrid[n](x, y, z, w, PIteration3D);   //access violation with new formulaclass sometimes
        Dec(btmp);
        if nHybrid[n] >= 0 then
        begin
          Inc(ItResultI);
          Rout := x * x + y * y + z * z;
          if Rout < OTrap then OTrap := Rout;
        end;
      until
        (ItResultI >= maxIt) or (Rout > RStop);

      if (DEoption and $38) = 32 then
        Result := Sqrt(Rout) * 0.5 * Ln(Rout) / Deriv1
      else
      case DEoption and 7 of
        4: Result := Abs(y) * Ln(Abs(y)) / w; //Julia?
        7: Result := Sqrt(Rout / RStop) * Power(PDouble(Integer(PVar) - 16)^, -ItResultI);  //Bulb, not really working
      else Result := Sqrt(Rout) / Abs(w);   //AmBox + IFS
      end;

      if CalcSIT then CalcSmoothIterations(PIteration3D, n);
    end;
end;

procedure doHybridSSE2(PIteration3D: TPIteration3D);  //new ext version
asm
  push  eax
  push  ebx
  push  ecx
  push  edx
  push  esi
  push  edi                   //x = edi-32  y = edi-24 ..  Rold = edi - 48, Rstop = edi - 40, (i = edi + 212 = btmp = esi - 44)
  mov   edi, eax              //  = [edi - 32]
  lea   esi, eax + 256
  movupd  xmm6, [edi]         //Iteration3D by calcMissed not aligned16?!
  movsd   xmm7, [edi + 16]
  movupd  [edi - 32], xmm6         //X=C
  movupd  [edi - 16], xmm7
  cmp   dword [esi - 104], 0  //DoJulia:+152
  jz    @sjup
  movupd  xmm2, [esi + 64]
  movsd   xmm3, [esi + 80]
  movupd  [edi + 24], xmm2    //J=Ju
  movsd   [edi + 40], xmm3
  jmp   @skipIfJulia
@sjup:
  movupd  [edi + 24], xmm6    //J=C
  movsd   [edi + 40], xmm7
@skipIfJulia:
  mulpd   xmm6, xmm6
  mulsd   xmm7, xmm7
  CVTSS2SD xmm5, [edi + 72]   //RStop in double
  addsd   xmm7, xmm6
  shufpd  xmm6, xmm6, 1
  movsd   [edi - 40], xmm5
  addsd   xmm7, xmm6          //xmm7=Rout
  movsd   [esi - 64], xmm7    //OTrap=Rout
  movsd   [edi + 56], xmm7    //Rout
  xor   ebx, ebx
  mov   [esi - 48], ebx       //bFirstIt := 0; +208
  mov   [edi + 64], ebx       //ItresultI:=0   +64
  movzx ebx, word [esi - 66]  //n := iStartFrom
  mov   eax, [edi + ebx * 4 + 100]      //fHPVar[0] +100
  mov   [edi + 48], eax       //PVars:    +48
  mov   eax, [edi + ebx * 4 + 76]       //i:=nHybrid[0] +76
  and   eax, $7FFFFFFF
  mov   [esi - 44], eax       //btmp

@Repeat:
  movsd   [edi - 48], xmm7    //Rold := Rout
  cmp   dword [esi - 44], 0
  jnle  @up2
@While:
  inc   ebx
  cmp   bx, word [esi - 106]   //5  wEndTo: Word; //+150
  jle   @up3
  movzx ebx, word [esi - 68]       //n := iRepeatFrom
@up3:
  mov   eax, [edi + ebx * 4 + 76]   //i := nHybrid[n];  +76
  and   eax, $7FFFFFFF
  jle   @While
  mov   [esi - 44], eax       //was btmp, now own var
  mov   eax, [edi + ebx * 4 + 100]  //fHPVar:array[0..5] of Pointer;
  mov   [edi + 48], eax       //PVars: +48
@up2:
  lea   eax, edi - 8          // w
  push  eax
  push  edi
  lea   edx, edi - 24
  lea   ecx, edi - 16
  add   eax, -24
  call  [edi + ebx * 4 + 124] //fHybrid[0..5] of ThybridIteration2; //+124   fp overflow: it3dex.z > 1eXXX !
  dec   [esi - 44]            //Dec(i)         !!! floating point invalid operation  / stack check
  cmp   [edi + ebx * 4 + 76], 0
  jl    @Repeat  //SkipMaxItTest
  movupd  xmm6, [edi - 32]
  movupd  xmm7, [edi - 16]
  mulpd   xmm6, xmm6
  mulsd   xmm7, xmm7          //4D: mulpd
  addsd   xmm7, xmm6          //4D:  addpd
  shufpd  xmm6, xmm6, 1       //4D:  pshufd xmm6, xmm7, $4E
  addsd   xmm7, xmm6          //xmm7=Rout
  movsd   xmm5, xmm7
  minsd   xmm5, qword [esi - 64]
  movsd   [edi + 56], xmm7    //Rout
  movsd   [esi - 64], xmm5    //OTrap
  inc   dword [edi + 64]      //Inc(ItResultI)
  mov   eax, [edi + 64]
  cmp   eax, [edi + 68]       //maxIt: +68
  jnl   @out
  comisd  xmm7, [edi - 40]     //RStop
  jc    @Repeat
@out:
  cmp   byte [esi - 108], 0  //CalcSIT: +148
  jz    @NoCalcSITout

  mov   eax, edi
  mov   edx, ebx
  call  CalcSmoothIterations //(PIt3D: TPIteration3D; n: Integer);

@NoCalcSITout:
  pop   edi
  pop   esi
  pop   edx
  pop   ecx
  pop   ebx
  pop   eax
end;

function doHybridDESSE2(PIteration3D: TPIteration3D): Double; //result in st(0)  new ext version
asm
  push  eax
  push  ebx
  push  ecx
  push  edx
  push  esi
  push  edi                   //x = edi-32  y = edi-24 ..  Rold = edi - 48, Rstop = edi - 40, (i = edi + 212 = btmp = esi - 44)
  mov   edi, eax
  lea   esi, eax + 256
  movupd  xmm6, [edi]         //Iteration3D by calcMissed not aligned16?!
  movsd   xmm7, [edi + 16]
  movupd  [edi - 32], xmm6    //X=C
  movupd  [edi - 16], xmm7
  cmp   dword [esi - 104], 0  //DoJulia:+152
  jz    @sjup
  movupd  xmm2, [esi + 64]
  movsd   xmm3, [esi + 80]
  movupd  [edi + 24], xmm2    //J=Ju
  movsd   [edi + 40], xmm3
  jmp   @skipIfJulia
@sjup:
  movupd  [edi + 24], xmm6    //J=C
  movsd   [edi + 40], xmm7
@skipIfJulia:
  mulpd   xmm6, xmm6
  mulsd   xmm7, xmm7
  CVTSS2SD xmm5, [edi + 72]   //RStop in double
  addsd   xmm7, xmm6
  shufpd  xmm6, xmm6, 1
  movsd   [edi - 40], xmm5
  addsd   xmm7, xmm6          //xmm7=Rout
  movsd   [esi - 64], xmm7    //OTrap=Rout
  movsd   [edi + 56], xmm7    //Rout
  movsd   [edi - 48], xmm7    //Rold := Rout
  xor   ebx, ebx              //n:=0
  mov   [edi + 208], ebx      //mov   [esi - 48], ebx       //bFirstIt  := 0; +208
  mov   [edi + 64], ebx       //ItresultI:=0   +64
  movzx ebx, word [esi - 66]  //n := iStartFrom
  mov   eax, [edi + ebx * 4 + 100]      //fHPVar[n] +100
  mov   [edi + 48], eax       //PVars:    +48
  mov   eax, [edi + ebx * 4 + 76]       //i:=nHybrid[n] +76
  and   eax, $7FFFFFFF
  mov   [esi - 44], eax
  mov   eax, [esi - 96]       //DEoption +160
  and   eax, $38              //    case (DEoption and $38) of
  sub   eax, 16
  jnz   @UU1
  fld   qword [edi + 56]      //   16:  w := Rout;
  jmp   @UU2
@UU1:
  sub   eax, 16
  jnz   @UU
  fld1
  fstp  qword [esi - 24]     // deriv1
  fldz                       //    32:  begin Deriv1 := 1; Deriv2 := 0; Deriv3 := 0;  end;
  fst   qword [esi - 16]
  fst   qword [esi - 8]
  jmp   @UU2
@UU:
  fld1                       //  else w := 1;
@UU2:
  fstp  qword [edi - 8]      //w := Rout,1,0

@Repeat:
  movsd   [edi - 48], xmm7    //Rold := Rout
  cmp   dword [esi - 44], 0
  jnle  @up2
@While:
  inc   ebx
//  cmp   ebx, 5
  cmp   bx, word [esi - 106]   //5  wEndTo: Word; //+150
  jle   @up3
  movzx ebx, word [esi - 68]       //n := iRepeatFrom
@up3:
  mov   eax, [edi + ebx * 4 + 76]   //i := nHybrid[n];  +76
  and   eax, $7FFFFFFF
  jle   @While
  mov   [esi - 44], eax
  mov   eax, [edi + ebx * 4 + 100]  //fHPVar:array[0..5] of Pointer;
  mov   [edi + 48], eax       //PVars: +48
@up2:
  lea   eax, edi - 8          //was: esp + 24   w
  push  eax
  push  edi
  lea   edx, edi - 24         //was: esp + 16   y
  lea   ecx, edi - 16         //was: esp + 24   z
  add   eax, -24              // x
  call  [edi + ebx * 4 + 124] //fHybrid[0..5] of ThybridIteration2; //+124   error in called function sometimes!!!
  dec   [esi - 44]            //Dec(i)    //Write off...??? bug in call... of mandbox or menger??!  abox as testhybrid! esi has changed?       !!! floating point overflow
  cmp   [edi + ebx * 4 + 76], 0
  jl    @Repeat  //SkipMaxItTest
  movupd  xmm6, [edi - 32]
  movupd  xmm7, [edi - 16]
  mulpd   xmm6, xmm6
  mulsd   xmm7, xmm7
  addsd   xmm7, xmm6
  shufpd  xmm6, xmm6, 1
  addsd   xmm7, xmm6          //xmm7=Rout
  movsd   xmm5, xmm7
  minsd   xmm5, qword [esi - 64]
  movsd   [edi + 56], xmm7    //Rout
  movsd   [esi - 64], xmm5    //OTrap
  inc   dword [edi + 64]      //Inc(ItResultI)
  mov   eax, [edi + 64]
  cmp   eax, [edi + 68]       //maxIt: +68
  jnl   @out
  comisd  xmm7, [edi - 40]    //RStop
  jc    @Repeat
@out:
  mov   eax, [esi - 96]       //DEoption +160     if (DEoption and $38) = 32 then
  and   eax, 38
  sub   eax, 32
  jnz   @JU1
  fld   qword [edi + 56]      //rout      Result := Sqrt(Rout) * 0.5 * Ln(Rout) / RoutDeriv
  fldln2
  fld   st(1)      //rout,ln2,rout
  fyl2x            //ln(rout),rout
  fxch
  fsqrt
  fmulp
  fmul  cs05
  fdiv  qword [esi - 24]      //Deriv1
  jmp   @UU6
@JU1:
  mov   eax, [esi - 96]       //DEoption +160
  and   eax, 7
  sub   eax, 4
  jnz   @UU3   //Result := Abs(X3) * Ln(Abs(X3)) / X4;
  fld   qword [edi - 16]      //X3
  fabs
  fldln2
  fld   st(1)      //absX3,ln2,absX3
  fyl2x            //ln(absX3),absX3
  fmulp
  fdiv  qword [edi - 8]   //Result
  jmp   @UU6
@UU3:
  sub   eax, 3
  jnz   @UU4   //Result := Sqrt(Rout/RStop) * Power(PDouble(Integer(PVar) - 16)^, -ItResultI);
  mov   eax,  [edi + 48]
  fild  dword [edi + 64]  //ItResultI
  fchs              //-ItresultI
  fld   [eax - 16]  //(Pvar-16)^ (= scale or something)
  fldln2      //power function  x,pow
  fxch
  fyl2x
  fxch
  fmulp
  fldl2e
  fmulp
  fld   st(0)
  frndint
  fsub  st(1), st(0)
  fxch
  f2xm1
  fld1
  faddp
  fscale
  fstp  st(1) //end of power function
  fld   qword [edi + 56]
  fdiv  dword [edi + 72] //rout/rstop,pow
  fsqrt
  fmulp
  jmp   @UU6
@UU4:          // else Result := Sqrt(Rout) / Abs(X4);
  fld   qword [edi + 56]
  fsqrt
  fld   qword [edi - 8]
  fabs
  fdivp
@UU6:
  cmp   byte [esi - 108], 0  //CalcSIT: +148
  jz    @NoCalcSITout

  mov   eax, edi
  mov   edx, ebx
  call  CalcSmoothIterations //(PIt3D: TPIteration3D; n: Integer);

@NoCalcSITout:
  pop   edi
  pop   esi
  pop   edx
  pop   ecx
  pop   ebx
  pop   eax
end;
          //x:eax,y:edx,z:ecx,w:esp->ebp+12, PIt:ebp+8
procedure HybridItTricorn(var x, y, z, w: Double; PIteration3D: TPIteration3D);
asm
  push  esi
  push  edi
  fld   qword [edx]
  fld   st(0)
  fmul  st(0), st(1)      // y*y, y
  fld   qword [eax]       // x, y*y, y
  mov   esi, [ebp + 8]    // PIteration3D
  fld   st(0)             // x, x, y*y, y
  fmul  st(0), st(1)      // x*x, x, y*y, y
  fld   qword [ecx]       // z, x*x, x, y*y, y
  fld   st(0)
  mov   edi, [esi + 48]
  fmul  st(0), st(1)      // z*z, z, x*x, x, y*y, y
  faddp st(4), st(0)      // z, x*x, x, y*y+z*z, y
  fmul  st(0), st(2)      // z*x, x*x, x, y*y+z*z, y
  fmul  qword [edi - 16]
  fld   qword [esi + 40]
  fmul  qword [edi - 24]
  faddp
  fstp  qword [ecx]       // x*x, x, y*y+z*z, y
  fsubrp st(2), st(0)     // x, x*x-y*y-z*z, y
  fmulp  st(2), st(0)     // x*x-y*y-z*z, y*x
  fadd  qword [esi + 24]
  fstp  qword [eax]       // y*x
  fadd  st(0), st(0)
  fadd  qword [esi + 32]
  fstp  qword [edx]
  pop   edi
  pop   esi
end;

procedure HybridQuat(var x, y, z, w: Double; PIteration3D: TPIteration3D);
var xt, yt, zt: Double;
begin
    with PIteration3D^ do
    begin
      xt := x;       //orig
      yt := y;
      zt := z;
      x  := x * x - y * y - z * z - w * w + J1;
      y  := 2 * (y * xt + z * w) + J2;
      z  := 2 * (z * xt + PDouble(Integer(PVar) - 16)^ * yt * w) + J3;
      w  := 2 * (w * xt + yt * zt) + PDouble(Integer(PVar) - 24)^
                                   + PDouble(Integer(PIteration3D) - 56)^;
    end;
end;
          //x:eax,y:edx,z:ecx,w:esp->ebp+12, PIt:ebp+8
procedure HybridQuatSSE2(var x, y, z, w: Double; PIteration3D: TPIteration3D);
asm
    push esi
    push edi
    mov  esi, [ebp + 8]
    mov  edi, [esi + 48]       //PVars
    movupd  xmm0, [eax]        //x,y
    movupd  xmm1, [ecx]        //z,w
    movapd  xmm6, xmm0         //x,y
    movapd  xmm5, xmm1         //z,w
    movapd  xmm3, xmm1         //z,w
    xorpd   xmm4, xmm4         //0,0
    mulpd   xmm6, xmm6         //xx,yy
    mulpd   xmm5, xmm5         //zz,ww
    movupd  xmm2, [edx]        //y,z
    subsd   xmm4, xmm5         //-zz
    shufpd  xmm3, xmm0, 1      //w,x
    shufpd  xmm4, xmm5, 2      //-zz, ww
    mulpd   xmm2, xmm0         //yx, zy
    addpd   xmm4, xmm6         //xx-zz, yy+ww
    mulpd   xmm0, xmm1         //xz, yw
    mulpd   xmm3, xmm1         //wz, xw
    pshufd  xmm6, xmm0, $4E    //yw, xz
    pshufd  xmm1, xmm4, $4E    //yy+ww, xx-zz
    mulsd   xmm6, [edi - 16]   //ywMul, xz
    addpd   xmm2, xmm3         //yx+wz, zy+xw    -> y, w
    addsd   xmm6, xmm0         //ywMul + xz      -> z
    subpd   xmm4, xmm1         //xx-zz-yy-ww     -> x
    addpd   xmm2, xmm2         //y,w
    addsd   xmm6, xmm6         //z
    shufpd  xmm2, xmm2, 1      //w, y
    movupd  xmm5, [esi + 24]   //J1,J2
    addsd   xmm2, [edi - 24]
    addsd   xmm2, [esi - 56]   //+J4
    shufpd  xmm6, xmm2, 0      //z, w
    shufpd  xmm4, xmm2, 2      //x, y
    addsd   xmm6, [esi + 40]   //+J3
    addpd   xmm4, xmm5         //+J1,2
    movupd  [eax], xmm4
    movupd  [ecx], xmm6
    pop  edi
    pop  esi
end;

procedure HybridItIntPow2(var x, y, z, w: Double; PIteration3D: TPIteration3D); //sine bulb
asm
  push  esi
  push  edi
  fld   qword [ecx]
  fld   qword [edx]
  fld   qword [eax]       //x,y,z
  mov   esi, [ebp + 8]    //PIteration3D
  fld   st(1)             //y,x,y,z
  fmul  st(0), st(2)      // y*y,x,y,z
  fld   st(1)             // x,y*y,x,y,z
  fmul  st(0), st(2)      // x*x, y*y,x,y,z
  fld   st(0)             // x*x, x*x, y*y,x,y,z
  fadd  st(0), st(2)      // xx+yy, xx, yy,x,y,z
  fld   st(0)             // xx+yy, xx+yy, xx, yy,x,y,z
  fsqrt
  mov   edi, [esi + 48]
  fmul  qword [edi - 16]  //*dOption1=Zmul
  fmul  st(0), st(6)      //*z
  fadd  st(0), st(0)      //*2
  fadd  qword [esi + 40]  //+cz nly for test
  fstp  qword [ecx]       //xx+yy, xx, yy,x,y,z
  fld   st(5)             //z, xx+yy, xx, yy,x,y,z
  fmulp st(6), st(0)      //xx+yy, xx, yy,x,y,z*z
  fld   st(0)             //xx+yy, xx+yy, xx, yy,x,y,z*z
  fsubrp st(6), st(0)     //xx+yy, xx, yy,x,y, a - z*z
  fdivp st(5), st(0)      //xx, yy,x,y, a - z*z / a  = a
  fsubrp                  //xx-yy,x,y, a
  fmul  st(0), st(3)      //a(xx-yy),x,y, a
  fadd  qword [esi + 24]
  fstp  qword [eax]       //x,y, a
  fmulp
  fmulp                   //x*y*a
  fadd  st(0), st(0)      //*2
  fadd  qword [esi + 32]  //+ cy only for test
  fstp  qword [edx]
  pop   edi
  pop   esi               //SineP2
end;
          //x:eax,y:edx,z:ecx,w:esp->ebp+12, PIt:ebp+8
procedure HybridItIntPow2SSE2(var x, y, z, w: Double; PIteration3D: TPIteration3D);
asm
    push esi
    push ebx
    mov  esi, [ebp + 8]
    movlpd   xmm0, [eax]        // x
    movhpd   xmm0, [edx]        // x, y
    movlpd   xmm1, [ecx]        // z
    movapd   xmm2, xmm0
    mov  ebx, [esi + 48]        //Pvars    
    movsd    xmm3, xmm1
    mulpd    xmm2, xmm2         // S1, S2
    mulsd    xmm3, xmm3         // S3
    pshufd   xmm5, xmm2, $4E    // S2, S1
    movapd   xmm4, xmm5
    addpd    xmm5, xmm2         // S1+S2
    subsd    xmm2, xmm4         // S1-S2
    movapd   xmm6, xmm5
    mulsd    xmm1, [ebx - 16]   // z*dZmul
    sqrtsd   xmm4, xmm6         // Sqrt(S2+S1)
    addsd    xmm1, xmm1         // z*dZmul*2
    subsd    xmm6, xmm3         // (S1+S2)-S3
    mulsd    xmm1, xmm4         // z*dZmul*2*Sqrt(S2+S1)
    movsd    xmm3, [edx]        // y
    addsd    xmm1, [esi + 40]   // z*dZmul*Sqrt(S2+S1)+J3 = z
    divsd    xmm6, xmm5         // (XT-S3)/XT   = XT
    addsd    xmm3, xmm3         // y*2
    movsd    [ecx], xmm1        // z
    mulsd    xmm3, xmm0         // y*2*x
    mulsd    xmm2, xmm6         // (S1-S2)*XT
    mulsd    xmm3, xmm6         // y*2*x*XT
    addsd    xmm2, [esi + 24]   // (S1-S2)*XT+J1 = x
    addsd    xmm3, [esi + 32]   // y*2*x*XT+J2 = y
    movsd    [eax], xmm2        // x
    movsd    [edx], xmm3        // y
    pop  ebx
    pop  esi
end;

procedure HybridFloatPow(var x, y, z, w: Double; PIteration3D: TPIteration3D);

asm
  push   esi
  push   edi
  mov    esi, [ebp + 8]     //PIteration3D
  mov    edi, [esi + 48]
  fld    qword [edi - 16]
  fld    qword [edx]
  fld    qword [eax]
  fld    st(1)
  fld    st(1)
  fpatan                    //theta, x, y, pow
  fmul   st, st(3)
  fsincos                   //Costheta, Sintheta, x, y, pow
  fld    qword [ecx]        //z,Costheta, Sintheta,x,y,pow
  fxch   st(3)              //x,Costheta, Sintheta,z,y,pow
  fmul   st, st
  fxch   st(4)              //y,Costheta, Sintheta,z,xx,pow
  fmul   st, st
  faddp  st(4), st          //Costheta,Sintheta,z,xx+yy,pow
  fxch   st(2)              //z,Sintheta,Costheta,xx+yy,pow
  fxch                      //Sintheta,z,Costheta,xx+yy,pow
  fxch   st(3)              //xx+yy,z,Costheta,Sintheta,pow
  fsqrt
  fpatan                    //phi,Costheta, Sintheta,pow
  fmul   st, st(3)
  fsincos                   //Cosphi,Sinphi,Costheta,Sintheta,pow
  fxch   st(4)              //pow,Sinphi,Costheta,Sintheta,Cosphi
  fmul   qword [edi - 8]    //*0.5 because of Rout=sqr(R)
  fld    qword [esi + 56]   //SqrRadius, pow*0.5,Sinphi,Costheta,Sintheta,Cosphi
  fldln2                    //power function  x,pow
  fxch
  fyl2x
  fxch
  fmulp
  fldl2e
  fmulp
  fld    st(0)
  frndint
  fsub   st(1), st(0)
  fxch
  f2xm1
  fld1
  faddp
  fscale
  fstp   st(1)              //NewRadius,Sinphi,Costheta,Sintheta,Cosphi
  fxch   st(2)              //Costheta,Sinphi,NewRadius,Sintheta,Cosphi
  fmul   st, st(4)
  fmul   st, st(2)
  fadd   qword [esi + 24]
  fstp   qword [eax]        //Sinphi,NewRadius,Sintheta,Cosphi
  fxch   st(3)              //Cosphi,NewRadius,Sintheta,Sinphi
  fmulp  st(2), st          //NewRadius,Sintheta*Cosphi,Sinphi
  fmul   st(1), st
  fmulp  st(2), st          //Sintheta*Cosphi*r,Sinphi*r
  fadd   qword [esi + 32]
  fstp   qword [edx]
  fmul   qword [edi - 24]
  fadd   qword [esi + 40]
  fstp   qword [ecx]
  pop    edi
  pop    esi
end;

          //x:eax,y:edx,z:ecx,w:esp->ebp+12, PIt:ebp+8
procedure HybridItIntPow3(var x, y, z, w: Double; PIteration3D: TPIteration3D);
asm
  push  esi
  push  edi
  mov   esi, [ebp + 8]    //PIteration3D
  fld   qword [edx]
  fmul  st, st            // y*y
  fld   qword [eax]       // x, y*y
  mov   edi, [esi + 48]   // PVars
  fmul  st, st            // x*x, y*y
  fld   st(0)             // x*x, x*x, y*y
  fadd  st(0), st(2)      // x*x+y*y = R, x*x = sx, y*y = sy
  fld   qword [ecx]
  fmul  st, st            // sz, R, sx, sy
  fld   qword [edi + 120] // 3, sz, R, sx, sy
  fld   st(1)             // sz, 3, sz, R, sx, sy
  fmul  st(0), st(1)      // 3*sz, 3, sz, R, sx, sy
  fld   st(3)
  fadd  qword [edi + 24]
  fdivp                   // 3*sz/R, 3, sz, R, sx, sy
  fld1
  fsubrp
//  fsubr qword [edi + 32]  // A, 3, sz, R, sx, sy       1-3*sz/R
  fld   st(1)             // 3, A, 3, sz, R, sx, sy
  fmul  st(0), st(6)      // 3*sy, ..
  fsubr st(0), st(5)      // sx-3*sy, ..
  fmul  st(0), st(1)      // A*(sx-3*sy), A, 3, sz, R, sx, sy
  fmul  qword [eax]
  fadd  qword [esi + 24]
  fstp  qword [eax]       // A, 3, sz, R, sx, sy
  fxch  st(4)             // sx, 3, sz, R, A, sy
  fmul  st(0), st(1)      // 3*sx, 3, sz, R, A, sy
  fsubrp st(5), st(0)     // 3, sz, R, A, 3*sx-sy  was: sy-3*sx!
  fmulp st(2), st(0)      // sz, 3*R, A, 3*sx-sy
  fsubrp                  // sz-3*R, A, 3*sx-sy
  fmul  qword [ecx]
  fmul  qword [edi - 16]  //*dZmul
  fsubr qword [esi + 40]
  fstp  qword [ecx]       // A, 3*sx-sy
  fmulp                   // A*(3*sx-sy)
  fmul  qword [edx]
  fadd  qword [esi + 32]
  fstp  qword [edx]
  pop   edi
  pop   esi
end;

procedure HybridItIntPow4(var x, y, z, w: Double; PIteration3D: TPIteration3D);

asm
  push  esi
  push  edi
  mov   esi, [ebp + 8]    //PIteration3D
  fld   qword [edx]
  fmul  st, st            // y*y
  fld   qword [eax]       // x, y*y
  mov   edi, [esi + 48]   // PVars
  fld   st
  fmul  st, st            // x*x, x, y*y
  fld   st(0)             // x*x, x*x, x, y*y
  fadd  st(0), st(3)      // x*x+y*y = R, sx, x, sy
  fld   qword [ecx]
  fmul  st, st            // sz, R, sx, x, sy
  fld   qword [edi + 144] // 6, sz, R, sx, x, sy
  fmul  st, st(2)         // 6*R, sz, R, sx, x, sy
  fsubr st, st(1)         // sz - 6*R, sz, R, sx, x, sy
  fmul  st(0), st(1)      // sz * (sz - 6 * R), sz, R, sx, x, sy
  fld   st(2)
  fmul  st, st            // R*R, sz * (sz - 6 * R), sz, R, sx, x, sy
  fadd  qword [edi + 24]  // 24-112  +1e-40
  fdivp                   // sz * (sz - 6 * R) / R*R, sz, R, sx, x, sy
  fld1
  faddp                   // A, sz, R, sx, x, sy
  fld   st(5)             // sy, A, sz, R, sx, x, sy
  fmul  qword [edi + 144] // 6*sy, A, sz, R, sx, x, sy
  fsubr st, st(4)         // sx-6*sy, A, sz, R, sx, x, sy
  fmul  st(0), st(4)      // sx*(sx-6*sy), A, sz, R, sx, x, sy
  fld   st(6)
  fmul  st, st
  faddp                   // sy*sy + sx*(sx-6*sy), A, sz, R, sx, x, sy
  fmul  st, st(1)
  fadd  qword [esi + 24]
  fstp  qword [eax]       // A, sz, R, sx, x, sy
  fxch  st(2)             // R, sz, A, sx, x, sy
  fsubr st(1), st         // R, R-sz, A, sx, x, sy
  fsqrt
  fmulp                   // sqrt(R)*(R-sz), A, sx, x, sy
  fmul  qword [ecx]
  fmul  qword [edi + 128] //*4
  fmul  qword [edi - 16]  //*dZmul
  fadd  qword [esi + 40]
  fstp  qword [ecx]       // A, sx, x, sy
  fxch                    // sx, A, x, sy    y := 4 * x * y * A * (sx - sy) + J2;
  fsubrp st(3), st        // A, x, sx-sy
  fmulp                   // A*x, sx-sy
  fmulp
  fmul  qword [edi + 128] //*4
  fmul  qword [edx]       //*y
  fadd  qword [esi + 32]
  fstp  qword [edx]
  pop   edi
  pop   esi
end;

procedure HybridIntP5(var x, y, z, w: Double; PIteration3D: TPIteration3D);

asm
  push  esi
  push  edi
  mov   esi, [ebp + 8]    //PIteration3D
  fld   qword [edx]
  fmul  st, st            // y*y
  fld   qword [eax]       // x, y*y
  mov   edi, [esi + 48]   // PVars
  fmul  st, st            // x*x, y*y
  fld   st                // x*x, x*x, y*y
  fadd  st, st(2)         // x*x+y*y = R, sx, sy
  fld   qword [ecx]
  fmul  st, st            // sz, R, sx, sy
  fld   qword [edi + 136] // 5, sz, R, sx, sy
  fld   st                // 5, 5, sz, R, sx, sy
  fld   st(2)
  fmul  st, st(4)
  fadd  st, st            // sz*R*2, 5, 5, sz, R, sx, sy
  fld   st(3)
  fmul  st, st
  fsubrp                  // sz*sz - sz*R*2, 5, 5, sz, R, sx, sy
  fmulp                   // (sz*sz - sz*R*2) * 5, 5, sz, R, sx, sy
  fld   st(3)
  fmul  st, st            // R*R, (sz*sz - sz*R*2) * 5, 5, sz, R, sx, sy
  fadd  qword [edi + 24]  // 24-112  +1e-40
  fdivp                   // (sz*sz - sz*R*2) * 5 / R*R, 5, sz, R, sx, sy
  fld1
  faddp                   // A, 5, sz, R, sx, sy
  fld   st(4)             // sx, A, 5, sz, R, sx, sy
  fmul  qword [edi + 168] // 10*sx, A, 5, sz, R, sx, sy
  fsub  st, st(6)         // 10*sx - sy, A, 5, sz, R, sx, sy
  fmul  st, st(6)         // sy*(10*sx - sy), A, 5, sz, R, sx, sy
  fld   st(5)
  fmul  st, st
  fmul  st, st(3)         // 5*sx*sx, sy*(10*sx - sy), A, 5, sz, R, sx, sy
  fsubrp                  // 5*sx*sx - sy*(10*sx - sy), A, 5, sz, R, sx, sy
  fmul  st, st(1)
  fmul  qword [edx]
  fadd  qword [esi + 32]
  fstp  qword [edx]       // A, 5, sz, R, sx, sy
  fld   st(3)
  fmul  st, st(2)
  fadd  st, st            // 10*R, A, 5, sz, R, sx, sy
  fsubr st, st(3)         // sz-10*R, A, 5, sz, R, sx, sy
  fmulp st(3), st         // A, 5, sz*(sz-10*R), R, sx, sy
  fxch  st(3)             // R, 5, sz*(sz-10*R), A, sx, sy
  fmul  st, st            //
  fmul  st, st(1)         //
  faddp st(2), st         // 5, sz*(sz-10*R)+5*R*R, A, sx, sy
  fld   st(4)
  fmul  st, st
  fmul  st, st(1)         // 5*sy*sy, 5, sz*(sz-10*R)+5*R*R, A, sx, sy
  fxch  st(5)             // sy, 5, sz*(sz-10*R)+5*R*R, A, sx, 5*sy*sy
  fmulp
  fadd  st, st            // 10*sy, sz*(sz-10*R)+5*R*R, A, sx, 5*sy*sy
  fsubr st, st(3)         // sx-10*sy, sz*(sz-10*R)+5*R*R, A, sx, 5*sy*sy
  fmulp st(3), st         // sz*(sz-10*R)+5*R*R, A, sx*(sx-10*sy), 5*sy*sy
  fmul  qword [ecx]
  fmul  qword [edi - 16]  //*dZmul
  fadd  qword [esi + 40]
  fstp  qword [ecx]       // A, sx*(sx-10*sy), 5*sy*sy
  fmul  qword [eax]
  fxch                    // sx*(sx-10*sy), A*x, 5*sy*sy
  faddp  st(2), st        // A*x, sx*(sx-10*sy)+5*sy*sy
  fmulp
  fadd  qword [esi + 24]
  fstp  qword [eax]
  pop   edi
  pop   esi
end;

procedure HybridIntP6(var x, y, z, w: Double; PIteration3D: TPIteration3D);

asm
  push  esi
  push  edi
  mov   esi, [ebp + 8]    //PIteration3D
  fld   qword [edx]
  fmul  st, st            // y*y
  fld   qword [eax]       // x, y*y
  mov   edi, [esi + 48]   // PVars
  fmul  st, st            // x*x, y*y
  fld   st                // x*x, x*x, y*y
  fadd  st, st(2)         // x*x+y*y = R, sx, sy
  fld   qword [ecx]
  add   edi, 112
  fmul  st, st            // sz, R, sx, sy
  fld   qword [edi + 176-112] // 15, sz, R, sx, sy
  fld   st                // 15, 15, sz, R, sx, sy
  fmul  st, st(3)         // 15*R,
  fsubr st, st(2)         // sz-R*15, 15, sz, R, sx, sy
  fmul  st, st(2)
  fld   st(3)
  fmul  st, st            // R*R, sz*(sz-R*15), 15, sz, R, sx, sy
  fxch
  fld   st(1)             // R*R, sz*(sz-R*15), R*R, 15, sz, R, sx, sy
  fmulp st(3), st         // sz*(sz-R*15), R*R, 15*R*R, sz, R, sx, sy
  faddp st(2), st         // R*R, 15*R*R+sz*(sz-R*15), sz, R, sx, sy
  fxch                    // 15*R*R+sz*(sz-R*15), R*R, sz, R, sx, sy
  fmul  st, st(2)         // sz*(15*R*R+sz*(sz-R*15)), R*R, sz, R, sx, sy
  fld   st(1)
  fmul  st, st(4)         // R*R*R, sz*(15*R*R+sz*(sz-R*15)), R*R, sz, R, sx, sy
  fadd  qword [edi + 24-112]  // 24-112  +1e-40
  fdivp                   // sz*(15*R*R+sz*(sz-R*15)) / R*R*R, R*R, sz, R, sx, sy
  fld1
  fsubrp                  // 1 - sz*(15*R*R+sz*(sz-R*15)) / R*R*R, R*R, sz, R, sx, sy
  fld   st(5)             // sy, A, R*R, sz, R, sx, sy
  fmul  qword [edi + 168-112] // 10*sy, A, R*R, sz, R, sx, sy
  fld   st(5)
  fmul  qword [edi + 120-112] // 3*sx, 10*sy, A, R*R, sz, R, sx, sy
  fsubrp                  // 3*sx-10*sy, A, R*R, sz, R, sx, sy
  fmul  st, st(5)         // sx*(3*sx-10*sy), A, R*R, sz, R, sx, sy
  fld   st(6)             // sy,
  fmul  st, st
  fmul  qword [edi + 120-112] // 3*sy*sy, sx*(3*sx-10*sy), A, R*R, sz, R, sx, sy
  faddp                   // 3*sy*sy+sx*(3*sx-10*sy), A, R*R, sz, R, sx, sy
  fmul  st, st(1)
  fmul  qword [edx]
  fmul  qword [eax]       //        z := PDouble(Integer(PVar) - 16)^*2*z*Sqrt(R)*(sz*(3*sz - 10*R) + 3*R*R) + J3;
  fadd  st, st            //        x := A*(S1*S1*(S1 - 15*S2) + S2*S2*(15*S1 - S2)) + J1;
  fadd  qword [esi + 32]
  fstp  qword [edx]       // A, R*R, sz, R, sx, sy
  fld   st(3)
  fmul  qword [edi + 168-112]
  fld   st(3)             // sz, 10*R, A, R*R, sz, R, sx, sy
  fmul  qword [edi + 120-112]
  fsubrp                  // 3*sz-10*R, A, R*R, sz, R, sx, sy
  fmulp st(3), st         // A, R*R, sz*(3*sz-10*R), R, sx, sy
  fxch
  fmul  qword [edi + 120-112] // 3*R*R, A, sz*(3*sz-10*R), R, sx, sy
  faddp st(2), st         // A, sz*(3*sz-10*R)+3*R*R, R, sx, sy
  fld   qword [edi + 176-112] // 15
  fld   st                // 15, 15, A, sz*(3*sz-10*R)+3*R*R, R, sx, sy
  fmul  st, st(5)
  fsub  st, st(6)
  fmul  st, st(6)
  fmul  st, st(6)         // S2*S2*(15*S1-S2), 15, A, sz*(3*sz-10*R)+3*R*R, R, sx, sy
  fxch
  fmulp st(6), st         // S2*S2*(15*S1-S2), A, sz*(3*sz-10*R)+3*R*R, R, sx, 15*sy
  fxch  st(5)             // 15*sy, A, sz*(3*sz-10*R)+3*R*R, R, sx, S2*S2*(15*S1-S2)
  fsubr st, st(4)         // sx-15*sy, A, sz*(3*sz-10*R)+3*R*R, R, sx, S2*S2*(15*S1-S2)
  fmul  st, st(4)
  fmulp st(4), st         // A, sz*(3*sz-10*R)+3*R*R, R, sx*sx*(sx-15*sy), S2*S2*(15*S1-S2)
  fxch  st(4)             // S2*S2*(15*S1-S2), sz*(3*sz-10*R)+3*R*R, R, sx*sx*(sx-15*sy), A
  faddp st(3), st         // sz*(3*sz-10*R)+3*R*R, R, S2*S2*(15*S1-S2)+sx*sx*(sx-15*sy), A
  fxch
  fsqrt
  fmulp                   // (sz*(3*sz-10*R)+3*R*R)*sqrt(R), S2*S2*(15*S1-S2)+sx*sx*(sx-15*sy), A
  fmul  qword [ecx]
  fmul  qword [edi - 16-112]  //*dZmul
  fadd  st, st
  fadd  qword [esi + 40]
  fstp  qword [ecx]       // S2*S2*(15*S1-S2)+sx*sx*(sx-15*sy), A
  fmulp
  fadd  qword [esi + 24]
  fstp  qword [eax]
  pop   edi
  pop   esi
end;

procedure HybridIntP7(var x, y, z, w: Double; PIteration3D: TPIteration3D);

asm
  push  esi
  push  edi
  mov   esi, [ebp + 8]    //PIteration3D
  fld   qword [edx]
  fmul  st, st            // y*y
  fld   qword [eax]       // x, y*y
  mov   edi, [esi + 48]   // PVars
  fmul  st, st            // x*x, y*y
  fld   st                // x*x, x*x, y*y
  fadd  st, st(2)         // x*x+y*y = R, sx, sy
  fld   qword [ecx]
  add   edi, 112
  fmul  st, st            // sz, R, sx, sy
  fld   st(1)             // R, sz, R, sx, sy
  fmul  qword [edi + 136-112] // 5R,
  fsubr st, st(1)         // sz-5R, sz, R, sx, sy
  fmul  st, st(1)         // sz(sz-5R), sz, R, sx, sy
  fld   st(2)
  fmul  st, st            // R*R, sz(sz-5R), sz, R, sx, sy
  fxch                    // sz(sz-5R), R*R, sz, R, sx, sy
  fld   st(1)             // R*R, sz(sz-5R), R*R, sz, R, sx, sy
  fmul  qword [edi + 120-112] // 3*R*R, sz(sz-5R), R*R, sz, R, sx, sy
  faddp                   // 3RR+sz(sz-5R), R*R, sz, R, sx, sy
  fmul  st, st(2)         // sz(3RR+sz(sz-5R)), R*R, sz, R, sx, sy
  fmul  qword [edi + 152-112]
  fld   st(1)
  fmul  st, st(4)         // R*R*R, 7sz(3RR+sz(sz-5R)), R*R, sz, R, sx, sy
  fadd  qword [edi + 24-112]  // 24-112  +1e-40
  fdivp                   // 7sz(3RR+sz(sz-5R))/RRR, R*R, sz, R, sx, sy
  fld1
  fsubrp                  // A, R*R, sz, R, sx, sy
  fld   st(5)             // sy, A, R*R, sz, R, sx, sy
  fmul  qword [edi + 200-112] // 35*sy, A, R*R, sz, R, sx, sy
  fld   st(5)
  fmul  qword [edi + 152-112] // 7*sx, 35*sy, A, R*R, sz, R, sx, sy
  fsubrp                  // 7*sx-35*sy, A, R*R, sz, R, sx, sy
  fmul  st, st(5)         // sx*(7*sx-35*sy), A, R*R, sz, R, sx, sy
  fld   st(6)             // sy,
  fmul  st, st
  fmul  qword [edi + 184-112] // 21*sy*sy, sx*(7*sx-35*sy), A, R*R, sz, R, sx, sy
  faddp                   // 21sysy+sx(7sx-35sy), A, R*R, sz, R, sx, sy
  fmul  st, st(5)
  fld   st(6)
  fmul  st, st
  fmul  st, st(7)         // sysysy, sx(21sysy+sx(7sx-35sy)), A, R*R, sz, R, sx, sy
  fsubp                   // sx(21sysy+sx(7sx-35sy))-sysysy, A, R*R, sz, R, sx, sy
  fmul  st, st(1)
  fmul  qword [edx]
  fadd  qword [esi + 32]
  fstp  qword [edx]       // A, R*R, sz, R, sx, sy
  fmul  qword [eax]       //   z := J3 - PDouble(Integer(PVar) - 16)^*z*(sz*sz*sz - 7*R*(sz*(3*sz - 5*R) + R*R));
                          //   x := A*x*(sx*(sx*(sx - 21*sy) + 35*sy*sy) - 7*sy*sy*sy) + J1;
  fld   st(3)
  fmul  qword [edi + 136-112] // 5R, A*x, R*R, sz, R, sx, sy
  fld   st(3)             // sz, 5R, A*x, R*R, sz, R, sx, sy
  fmul  qword [edi + 120-112]
  fsubrp                  // 3sz-5R, A*x, R*R, sz, R, sx, sy
  fmul  st, st(3)         // sz(3sz-5R), A*x, R*R, sz, R, sx, sy
  faddp st(2), st         // A*x, RR+sz(3sz-5R), sz, R, sx, sy
  fxch
  fmul  qword [edi + 152-112] // 7(RR+sz(3sz-5R)), A*x, sz, R, sx, sy
  fmulp st(3), st         // A*x, sz, 7R(sz(3sz-5R)+RR), sx, sy
  fld   st(1)
  fmul  st, st
  fmulp st(2), st         // A*x, szszsz, 7R(RR+sz(3sz-5R)), sx, sy
  fxch                    // szszsz, A*x, 7R(RR+sz(3sz-5R)), sx, sy
  fsubrp st(2), st        // A*x, szszsz-7R(RR+sz(3sz-5R)), sx, sy
  fld   st(3)             // sy, A*x, szszsz-7R(RR+sz(3sz-5R)), sx, sy
  fmul  qword [edi + 184-112] // 21sy, A*x, szszsz-7R(RR+sz(3sz-5R)), sx, sy
  fsubr st, st(3)         // sx-21sy, A*x, szszsz-7R(RR+sz(3sz-5R)), sx, sy
  fmul  st, st(3)         // sx(sx-21sy)
  fld   st(4)             // sy, sx(sx-21sy), A*x, szszsz-7R(RR+sz(3sz-5R)), sx, sy
  fmul  st, st            // sysy, sx(sx-21sy), A*x, szszsz-7R(RR+sz(3sz-5R)), sx, sy
  fmul  qword [edi + 200-112] // 35sysy, sx(sx-21sy), A*x, szszsz-7R(RR+sz(3sz-5R)), sx, sy
  faddp                   // 35sysy+sx(sx-21sy), A*x, szszsz-7R(RR+sz(3sz-5R)), sx, sy
  fmulp st(3), st         // A*x, szszsz-7R(RR+sz(3sz-5R)), sx(35sysy+sx(sx-21sy)), sy
  fxch  st(3)             // sy, szszsz-7R(RR+sz(3sz-5R)), sx(35sysy+sx(sx-21sy)), A*x
  fld   st
  fmul  st, st
  fmulp
  fmul  qword [edi + 152-112] // 7sysysy, szszsz-7R(RR+sz(3sz-5R)), sx(35sysy+sx(sx-21sy)), A*x
  fsubp st(2), st         // szszsz-7R(RR+sz(3sz-5R)), sx(35sysy+sx(sx-21sy))-7sysysy, A*x
  fmul  qword [ecx]
  fmul  qword [edi - 16-112]  //*dZmul
  fsubr qword [esi + 40]
  fstp  qword [ecx]       // sx(35sysy+sx(sx-21sy))-7sysysy, A*x
  fmulp
  fadd  qword [esi + 24]
  fstp  qword [eax]
  pop   edi
  pop   esi
end;

          //x:eax,y:edx,z:ecx,w:esp->ebp+12, PIt:ebp+8
procedure HybridIntP8(var x, y, z, w: Double; PIteration3D: TPIteration3D);   //P8 white's formula
asm
  push  esi
  push  edi
  mov   esi, [ebp + 8]    //PIteration3D
  fld   qword [eax]       //x
  mov   edi, [esi + 48]   //PVars
  fmul  st(0), st(0)      //xx
  fld   qword [edx]       //y
  add   edi, 88
  fmul  st(0), st(0)      //yy,xx
  fld   qword [ecx]       //z,yy,xx
  fmul  st(0), st(0)      //zz,yy,xx
  fld   st(2)             //xx,zz,yy,xx
  fadd  st(0), st(2)      //xx+yy=r,zz,yy,xx
  fld   st(0)             //r,r,zz,yy,xx
  fmul  st(0), st(1)      //rr,r,zz,yy,xx
  fld   st(2)
  fmul  st(0), st(0)      //zzzz(S3*S3),rr,r,zz,yy,xx
  fld   st(2)             //r,zzzz(S3*S3),rr,r,zz,yy,xx    z calculation
  fmul  st(0), st(4)      //r*zz
  fmul  qword [edi + 56]  //6*r*zz,zzzz(S3*S3),rr,r,zz,yy,xx   
  fsubr st(0), st(1)      //zzzz-6rzz,zzzz,rr,r,zz,yy,xx
  fadd  st(0), st(2)      //zzzz-6rzz+rr,zzzz,rr,r,zz,yy,xx
  fld   st(4)             //zz,zzzz-6rzz+rr,zzzz,rr,r,zz,yy,xx
  fsub  st(0), st(4)      //zz-r,zzzz-6rzz+rr,zzzz,rr,r,zz,yy,xx
  fmulp                   //(zz-r)*(zzzz-6rzz+rr),zzzz,rr,r,zz,yy,xx
  fld   st(3)             //r,(zz-r)*(zzzz-6rzz+rr),zzzz,rr,r,zz,yy,xx
  fsqrt
  fmulp                   //sqrt(r)*(zz-r)*(zzzz-6rzz+rr),zzzz,rr,r,zz,yy,xx
  fmul  qword [ecx]       //*z
  fmul  qword [edi + 72]  //*8
  fmul  qword [edi - 104] //*dZmul
  fchs
  fadd  qword [esi + 40]  //+J3
  fstp  qword [ecx]       //zzzz,rr,r,zz,yy,xx
  fld   st(0)             //zzzz,zzzz,rr,r,zz,yy,xx        a calculation
  fadd  st(0), st(2)      //zzzz+rr,zzzz,rr,r,zz,yy,xx
  fmulp st(3), st(0)      //zzzz,rr,r*(zzzz+rr),zz,yy,xx
  fld   st(1)             //rr,zzzz,rr,r*(zzzz+rr),zz,yy,xx
  fmul  qword [edi + 120]  //rr*70,zzzz,rr,r*(zzzz+rr),zz,yy,xx
  fadd  st(0), st(1)
  fmulp                   //(rr*70+zzzz)*zzzz,rr,r*(zzzz+rr),zz,yy,xx
  fxch  st(2)             //r*(zzzz+rr),rr,(rr*70+zzzz)*zzzz,zz,yy,xx
  fmulp st(3), st(0)      //rr,(rr*70+zzzz)*zzzz,zz*r*(zzzz+rr),yy,xx
  fxch  st(2)             //zz*r*(zzzz+rr),(rr*70+zzzz)*zzzz,rr,yy,xx
  fmul  qword [edi + 104]  //28*zz*r*(zzzz+rr),(rr*70+zzzz)*zzzz,rr,yy,xx
  fsubp                   //(rr*70+zzzz)*zzzz-28*zz*r*(zzzz+rr),rr,yy,xx
  fxch  st(1)
  fmul  st(0), st(0)      //rrrr,(rr*70+zzzz)*zzzz-28*zz*r*(zzzz+rr),yy,xx
  fadd  qword [edi - 64]  //   24-88  +1e-40
  fdivp                   //(zzzz*(rr*70+zzzz)-28*zz*r*(zzzz+rr))/rrrr,yy,xx
  fadd  qword [edi - 56]  //a,yy,xx    +1
  fld   st(1)             //yy,a,yy,xx                   y calculation
  fmul  qword [edi + 64]  //7*yy,a,yy,xx       + 152-128=24
  fld   st(3)             //xx,7*yy,a,yy,xx
  fmul  qword [edi + 64]  //7*xx,7*yy,a,yy,xx
  fsub  st(0), st(3)      //7*xx-yy,7*yy,a,yy,xx
  fld   st(4)             //xx,7*xx-yy,7*yy,a,yy,xx
  fsubr st(2), st(0)      //xx,7*xx-yy,xx-7*yy,a,yy,xx
  fmul  st(0), st(0)      //xxxx,7*xx-yy,xx-7*yy,a,yy,xx
  fmul  st(2), st(0)      //xxxx,7xx-yy,xxxx(xx-7yy),a,yy,xx
  fld   st(4)             //yy,xxxx,7xx-yy,xxxx(xx-7yy),a,yy,xx
  fmul  st(0), st(0)      //yyyy,xxxx,7xx-yy,xxxx(xx-7yy),a,yy,xx
  fmul  st(2), st(0)      //yyyy,xxxx,yyyy(7xx-yy),xxxx(xx-7yy),a,yy,xx
  fxch  st(2)             //yyyy(7xx-yy),xxxx,yyyy,xxxx(xx-7yy),a,yy,xx
  faddp st(3), st(0)      //xxxx,yyyy,yyyy(7xx-yy)+xxxx(xx-7yy),a,yy,xx
  fxch  st(2)             //yyyy(7xx-yy)+xxxx(xx-7yy),yyyy,xxxx,a,yy,xx
  fmul  qword [edi + 72]  //*8
  fmul  qword [eax]       //*x
  fmul  qword [edx]       //*y
  fmul  st(0), st(3)      //*a
  fadd  qword [esi + 32]  //+J2
  fstp  qword [edx]       //yyyy,xxxx,a,yy,xx
  fld   st(1)             //xxxx,yyyy,xxxx,a,yy,xx
  fmul  qword [edi + 120]  //70xxxx,yyyy,xxxx,a,yy,xx
  fadd  st(0), st(1)      //70xxxx+yyyy,yyyy,xxxx,a,yy,xx
  fmul  st(0), st(1)      //yyyy(70xxxx+yyyy),yyyy,xxxx,a,yy,xx
  fxch  st(1)             //yyyy,yyyy(70xxxx+yyyy),xxxx,a,yy,xx
  fadd  st(0), st(2)      //yyyy+xxxx,yyyy(70xxxx+yyyy),xxxx,a,yy,xx
  fmulp st(4), st(0)      //yyyy(70xxxx+yyyy),xxxx,a,yy(yyyy+xxxx),xx
  fxch  st(4)             //xx,xxxx,a,yy(yyyy+xxxx),yyyy(70xxxx+yyyy)
  fmulp st(3), st(0)      //xxxx,a,xxyy(yyyy+xxxx),yyyy(70xxxx+yyyy)
  fmul  st(0), st(0)      //xxxx*xxxx,a,xxyy(yyyy+xxxx),yyyy(70xxxx+yyyy)
  faddp st(3), st(0)      //a,xxyy(yyyy+xxxx),xxxx*xxxx+yyyy(70xxxx+yyyy)
  fxch  st(1)             //xxyy(yyyy+xxxx),a,xxxx*xxxx+yyyy(70xxxx+yyyy)
  fmul  qword [edi + 104]
  fsubp st(2), st(0)      //a,xxxx*xxxx+yyyy(70xxxx+yyyy)-28xxyy(yyyy+xxxx)
  fmulp
  fadd  qword [esi + 24]
  fstp  qword [eax]
  pop   edi
  pop   esi
end;

          //x:eax,y:edx,z:ecx,w:esp->ebp+12, PIt:ebp+8
procedure HybridCubeSSE2(var x, y, z, w: Double; PIteration3D: TPIteration3D);  // is used in alt hybrid without DE on w
asm
    push esi                
    push ebx
    mov  esi, [ebp + 8]    //PIteration3D
    mov  ebx, [esi + 48]
    
    movupd   xmm2, [eax]       //[x,y]
    movsd    xmm4, [ecx]       //[z]
    movapd   xmm0, xmm2
    maxpd    xmm0, [ebx - 64]     //const:-1,-1,1,1
    maxsd    xmm4, [ebx - 64]
    minpd    xmm0, [ebx - 48]
    minsd    xmm4, [ebx - 48]
    addpd    xmm0, xmm0
    addsd    xmm4, xmm4
    subpd    xmm0, xmm2
    subsd    xmm4, [ecx]

    movapd   xmm1, xmm0        //x, y
    movsd    xmm5, xmm4
    mulpd    xmm1, xmm1        //x*x, y*y
    mulsd    xmm5, xmm5        //z*z
    pshufd   xmm6, xmm1, $4E   //y*y, x*x    copies and swaps hi<>lo
    addsd    xmm1, xmm5        //x*x + z*z
    addsd    xmm1, xmm6        // w = sqr(r)
    ucomisd  xmm1, [ebx - 32]  //<dOption2 was:dOpt3
    jnb  @u1
    movsd    xmm3, [ebx - 24]  //dOption1
    jmp  @u3
@u1:ucomisd  xmm1, [ebx + 32]  //<1 ? ucomisd slow?
    movsd    xmm3, [ebx - 16]  //dPow = scale //Was:dOpt2
    jnb  @u3
    divsd    xmm3, xmm1
@u3:shufpd   xmm3, xmm3, 0
    movupd   xmm5, [esi + 24]  //[J1,J2]
    mulpd    xmm0, xmm3
    mulsd    xmm4, xmm3
    addpd    xmm0, xmm5
    addsd    xmm4, [esi + 40]  //J3
    movlpd   [eax], xmm0
    movhpd   [edx], xmm0
    movsd    [ecx], xmm4
    pop  ebx
    pop  esi
end;

procedure HybridCube(var x, y, z, w: Double; PIteration3D: TPIteration3D);
asm
    push  esi                   //Amazing box  x87     with options  fold  fold x2
    push  ebx
    mov   esi, [ebp + 8]        //PIteration3D
    mov   esi, [esi + 48]       //was:PAligned16
    mov   ebx, eax
    fld   qword [esi - 40]      //fold
    fld   qword [eax]           //x,fold
    fld   st(0)                 //x,x,fold     folding with x = abs(x+fold) - abs(x-fold) - x
    fsub  st(0), st(2)
    fabs
    fadd  st(0), st(1)          //abs(x-fold)+x,x,fold
    fxch                        //x,abs(x-fold)+x,fold
    fadd  st(0), st(2)
    fabs
    fsubrp                      //abs(x+fold)-(abs(x-fold)+x),fold
    fld   qword [edx]           //y,fold
    fld   st(0)
    fsub  st(0), st(3)
    fabs
    fadd  st(0), st(1)
    fxch
    fadd  st(0), st(3)
    fabs
    fsubrp
    fld   qword [ecx]           //y,fold
    fld   st(0)
    fsub  st(0), st(4)
    fabs
    fadd  st(0), st(1)
    fxch
    fadd  st(0), st(4)
    fabs
    fsubrp                      //z,y,x,fold

    fld   st(0)              //7
    fmul  st(0), st(1)
    fld   st(2)              //8
    fmul  st(0), st(3)
    faddp                    //7
    fld   st(3)              //8
    fmul  st(0), st(4)
    faddp                      //r,z,y,x,-fold,fold,fold x2
    fcom  qword [esi - 32]
    fnstsw ax
    shr   ah, 1
    jnc   @@7
    fstp  st(0)
    fld   qword [esi - 24]
    jmp   @@9
@@7:                           //r,z,y,x,-fold,fold,fold x2
    fld1
    fcom  st(1)
    fnstsw ax
    shr   ah, 1
    jc    @@8
    fstp  st(0)
    fdivr qword [esi - 16]
    jmp   @@9
@@8:
    fcompp
    fld   qword [esi - 16]
@@9:
    fmul  st(3), st(0)        //mul,zr,yr,xr,-fold,fold, foldx2
    fmul  st(2), st(0)
    fmulp                     //zr,yr,xr,-fold,fold, foldx2
    mov   esi, [ebp + 8]
    fadd  qword [esi + 40]
    fstp  qword [ecx]
    fadd  qword [esi + 32]
    fstp  qword [edx]
    fadd  qword [esi + 24]
    fstp  qword [ebx]
    fstp  st(0)
    mov  eax, ebx
    pop  ebx
    pop  esi
end;

procedure HybridCubeDE(var x, y, z, w: Double; PIteration3D: TPIteration3D);
asm
    push  esi                   //Amazing box without adding c    x87     with option fold
    push  ebx
    mov   esi, [ebp + 8]        //PIteration3D
    mov   ebx, eax
    mov   esi, [esi + 48]       //was:PAligned16
    fld   qword [esi - 40]      //fold
    fld   st(0)
    fchs                        //-fold,fold
    fld   qword [ebx]           //x,-fold,fold
    fld   st(0)                 //x,x,-fold,fold     folding with x = abs(x+fold) - abs(x-fold) - x
    fadd  st(0), st(2)
    fabs
    fadd  st(0), st(1)          
    fxch                        //x,abs(x-fold)+x,-fold,fold
    fadd  st(0), st(3)
    fabs
    fsubrp                      //abs(x+fold)-(abs(x-fold)+x),-fold,fold
    fld   qword [edx]           //y,x,-fold,fold
    fld   st(0)
    fadd  st(0), st(3)
    fabs
    fadd  st(0), st(1)
    fxch
    fadd  st(0), st(4)
    fabs
    fsubrp
    fld   qword [ecx]           //z,y,x,-fold,fold
    fld   st(0)
    fadd  st(0), st(4)
    fabs
    fadd  st(0), st(1)
    fxch
    fadd  st(0), st(5)
    fabs
    fsubrp

    fld   st(0)              //7
    fmul  st(0), st(1)
    fld   st(2)              //8
    fmul  st(0), st(3)
    faddp                    //7
    fld   st(3)              //8
    fmul  st(0), st(4)
    faddp                      //r,z,y,x,-fold,fold
    fcom  qword [esi - 32]
    fnstsw ax
    shr   ah, 1
    jnc   @@7
    fstp  st(0)
    fld   qword [esi - 24]
    jmp   @@9
@@7:                           //r,z,y,x,-fold,fold
    fld1
    fcom  st(1)
    fnstsw ax
    shr   ah, 1
    jc    @@8
    fstp  st(0)
    fdivr qword [esi - 16]
    jmp   @@9
@@8:
    fcompp
    fld   qword [esi - 16]
@@9:
    fld   qword [ecx + 8]     //w,mul,zr,yr,xr,-fold,fold
    fmul  st(0), st(1)
    fstp  qword [ecx + 8]
    fmul  st(3), st(0)        //mul,zr,yr,xr,-fold,fold
    fmul  st(2), st(0)
    fmulp                     //zr,yr,xr,-fold,fold
    mov   esi, [ebp + 8]
    fadd  qword [esi + 40]
    fstp  qword [ecx]
    fadd  qword [esi + 32]
    fstp  qword [edx]
    fadd  qword [esi + 24]
    fstp  qword [ebx]
    fcompp
    mov  eax, ebx
    pop  ebx
    pop  esi
end;

procedure HybridCubeSSE2DE(var x, y, z, w: Double; PIteration3D: TPIteration3D);
asm
    push esi
    push ebx
    mov  esi, [ebp + 8]        //PIteration3D
    mov  ebx, [esi + 48]       //was:PAligned16

    movupd   xmm2, [eax]       //[x,y]
    movsd    xmm4, [ecx]       //[z]
    movapd   xmm0, xmm2
    maxpd    xmm0, [ebx - 64]     //const:-R,-R,R,R
    maxsd    xmm4, [ebx - 64]
    minpd    xmm0, [ebx - 48]
    minsd    xmm4, [ebx - 48]
    addpd    xmm0, xmm0
    addsd    xmm4, xmm4
    subpd    xmm0, xmm2
    subsd    xmm4, [ecx]

    movapd   xmm1, xmm0        //x, y
    movsd    xmm5, xmm4
    mulpd    xmm1, xmm1        //x*x, y*y
    mulsd    xmm5, xmm5        //z*z
    pshufd   xmm2, xmm1, $4E   //y*y, x*x    copies and swaps hi<>lo
    addsd    xmm1, xmm5
    addsd    xmm1, xmm2        // w = sqr(r)
    ucomisd  xmm1, [ebx - 32]  //<dOption2   //7/6 clocks ucomisd latency :-(

    movsd    xmm3, [ebx - 24]  //dOption1
    jb   @u3
    ucomisd  xmm1, [ebx + 32]  //<1 ?
    movsd    xmm3, [ebx - 16]  //dPow = scale
    jnb  @u3
    divsd    xmm3, xmm1
@u3:
    movhpd   xmm4, [ecx + 8]
    shufpd   xmm3, xmm3, 0     //r, r
    movupd   xmm5, [esi + 24]  //[J1,J2]
    mulpd    xmm0, xmm3
    mulpd    xmm4, xmm3
    addpd    xmm0, xmm5
    addsd    xmm4, [esi + 40]  //J3
    movupd   [eax], xmm0
    movupd   [ecx], xmm4
    pop  ebx
    pop  esi
end;

procedure HybridItIntPow2scale(var x, y, z, w: Double; PIteration3D: TPIteration3D); //sine bulb with scaling
asm
  push  esi
  push  edi
  mov   edi, [ebp + 8]
  mov   esi, [edi + 48]
  fld   qword [ecx]
  fld   qword [edx]
  fld   qword [eax]       //x,y,z
  fld   qword [esi - 72]  // scaling
  fld1
  fdivrp
  fmul  st(3), st(0)
  fmul  st(2), st(0)
  fmulp
  fld   st(1)             //y,x,y,z
  fmul  st(0), st(2)      // y*y,x,y,z
  fld   st(1)             // x,y*y,x,y,z
  fmul  st(0), st(2)      // x*x, y*y,x,y,z
  fld   st(0)             // x*x, x*x, y*y,x,y,z
  fadd  st(0), st(2)      // xx+yy, xx, yy,x,y,z
  fld   st(0)             // xx+yy, xx+yy, xx, yy,x,y,z
  fsqrt
  fmul  st(0), st(6)      //*z
  fadd  st(0), st(0)      //*2
  fchs
  fmul  qword [esi - 72]
  fadd  qword [edi + 40]
  fstp  qword [ecx]       //xx+yy, xx, yy,x,y,z
  fld   st(5)             //z, xx+yy, xx, yy,x,y,z
  fmulp st(6), st(0)      //xx+yy, xx, yy,x,y,z*z
  fld   st(0)             //xx+yy, xx+yy, xx, yy,x,y,z*z
  fsubrp st(6), st(0)     //xx+yy, xx, yy,x,y, a - z*z
  fdivp st(5), st(0)      //xx, yy,x,y, a - z*z / a  = a
  fsubrp                  //xx-yy,x,y, a
  fmul  st(0), st(3)      //a(xx-yy),x,y, a
  fmul  qword [esi - 72]
  fadd  qword [edi + 24]
  fstp  qword [eax]       //x,y, a
  fmulp
  fmulp                   //x*y*a
  fadd  st(0), st(0)      //*2
  fmul  qword [esi - 72]
  fadd  qword [edi + 32]
  fstp  qword [edx]
  pop   edi
  pop   esi
end;

procedure HybridSuperCube2(var x, y, z, w: Double; PIteration3D: TPIteration3D);
var R1, R2, m, m2: Double;
    xyzIn, xyzOut: TVec3D;
begin
//    testhybridOptionVals: array[0..5] of Double = (2, 0.5, 1, 1, 2, 1.9);
    if PIteration3D.Rout < PDouble(Integer(PIteration3D.PVar) - 80)^ then     //smooth Bulbox
    with PIteration3D^ do
    begin
      if Rout < PDouble(Integer(PVar) - 88)^ then
        HybridItIntPow2scale(x, y, z, w, PIteration3D)   //ThybridIteration(pCodePointer) := fHIntFunctions[Round(dSIpow)];
      else
      begin
        R1 := PDouble(Integer(PVar) - 88)^;
        m := (Rout - R1) / (PDouble(Integer(PVar) - 80)^ - R1);
        FastMove(x, xyzIn, 24);
        HybridItIntPow2scale(x, y, z, w, PIteration3D);
        FastMove(x, xyzOut, 24);
        FastMove(xyzIn, x, 24);
        fHybridCube(x, y, z, w, PIteration3D);
        R1 := Sqrt(Sqr(x) + Sqr(y) + Sqr(z));
        m2 := 1 - m;
        R2 := R1 * m + m2 * Sqrt(Sqr(xyzOut[0]) + Sqr(xyzOut[1]) + Sqr(xyzOut[2]));
        x := x * m + m2 * xyzOut[0];
        y := y * m + m2 * xyzOut[1];
        z := z * m + m2 * xyzOut[2];
        R1 := R2 / Sqrt(Sqr(x) + Sqr(y) + Sqr(z) + 1e-40);
        x := x * R1;
        y := y * R1;
        z := z * R1;
      end;
    end
    else fHybridCube(x, y, z, w, PIteration3D);

{    if PIteration3D.Rout < PDouble(Integer(PIteration3D.PVar) - 80)^ then     //Bulbox, only RThreshold
      HybridItIntPow2scale(x, y, z, w, PIteration3D)                           //bscale5 vid=34s, 29.6s
    else
      fHybridCube(x, y, z, w, PIteration3D);  }
end;

procedure HybridFolding(var x, y, z, w: Double; PIteration3D: TPIteration3D);
asm
    push esi
    push edi
    push ebx
    mov  esi, [ebp + 8]        //PIteration3D
    mov  edi, [esi + 48]
    fld   qword [edi - 24]      //fold
    fld   qword [eax]           //x,fold
    fld   st(0)                 //x,x,fold     folding with x = abs(x+fold) - abs(x-fold) - x
    fsub  st(0), st(2)
    fabs
    fadd  st(0), st(1)          //abs(x-fold)+x,x,fold
    fxch                        //x,abs(x-fold)+x,fold
    fadd  st(0), st(2)
    fabs
    fsubrp                      //abs(x+fold)-(abs(x-fold)+x),fold
    fstp  qword [eax]
    fld   qword [edx]           //y,fold
    fld   st(0)
    fsub  st(0), st(2)
    fabs
    fadd  st(0), st(1)
    fxch
    fadd  st(0), st(2)
    fabs
    fsubrp
    fstp  qword [edx]
    fld   qword [ecx]           //z,fold
    fld   st(0)
    fsub  st(0), st(2)          //z-fold,z,fold
    fabs
    fadd  st(0), st(1)          //z+abs(z-fold),z,fold
    fxch  st(2)
    faddp                       //z+fold,z+abs(z-fold)
    fabs
    fsubrp                      //z'
    fstp  qword [ecx]
    mov  ebx, [ebp + 12]
    push ebx
    push esi
    call [edi - 52]
    pop  ebx
    pop  edi
    pop  esi
end;

procedure EmptyFormula(var x, y, z, w: Double; PIteration3D: TPIteration3D);
begin //not used formulas, itCount might be set to bigger 0 and executed!

end;

//########### from here: custom formulas generation, not at runtime -> use IFStest instead!

//procedure HybridCustomIFS;   //for IFS, different calling convention!  esi+edi is @it3dext.x+128 and @Pvar
//asm
//end;
          //x:eax,y:edx,z:ecx,w:esp->ebp+12, PIt:ebp+8
procedure AexionC(var x, y, z, w: Double; PIteration3D: TPIteration3D);

asm
    push esi
    push edi
    push ebx
    push ecx
    mov  esi, [ebp + 8]        //PIteration3D
    mov  edi, [esi + 48]
    fld  qword [ecx]
    fld  qword [edx]
    fld  qword [eax]   //x,y,z
    fld  st(1)
    fmul st, st        //yy,x,y,z
    fxch st(2)         //y,x,yy,z
    fld  st(3)
    fmul st, st        //zz,y,x,yy,z
    fld  st(2)
    fmul st, st        //xx,zz,y,x,yy,z
    fld  st(1)         //zz,xx,zz,y,x,yy,z
    fadd st, st(1)
    faddp st(5), st    //xx,zz,y,x,r1,z
    faddp
    fsqrt              //sqrt(xx+zz),y,x,r1,z
    fxch
    fpatan             //th,x,r1,z
    fxch st(3)
    fxch               //x,z,r1,th
    fpatan             //ph,r1,th
    fld qword [edi - 16] //pow,ph,r1,th
    fmul st(3), st
    fmul st(1), st
    fmul qword [edi - 8] //pow*0.5,ph,r1,th
    fxch               //ph,pow',r1,th
    fxch st(2)         //r1,pow',ph,th
    fldln2      //power function  base,expo  -> st, st(1)
    fxch
    fyl2x
    fxch
    fmulp
    fldl2e
    fmulp
    fld   st(0)
    frndint
    fsub  st(1), st(0)
    fxch
    f2xm1
    fld1
    faddp
    fscale
    fstp  st(1)          //r1',ph,th
    fxch st(2)         //th, ph, r1
    fsincos            //ct,st, ph, r1
    fxch st(2)         //ph, st,ct, r1
    fsincos            //cosP,sinP, sinT,cosT, r1
    fmul st, st(3)
    fmul st, st(4)
    fadd qword [esi + 24]
    fstp qword [eax]   //sinP, sinT,cosT, r1
    fmulp st(2), st    //sinT,cosT*SinP, r1
    fmul st, st(2)
    fmul qword [edi - 24]
    fadd qword [esi + 40]
    fstp qword [ecx]   //cosT*SinP, r1
    fmulp
    fadd qword [esi + 32]
    fstp qword [edx]

    cmp  dword [edi - 28], 0
    jz   @@1
    fld  qword [edi - 40]  //pd^
    cmp  dword [edi - 52], 0
    jz   @@2
    fld  qword [eax]
    fsub qword [esi + 24]
    fmul st, st
    fld  qword [edx]
    fsub qword [esi + 32]
    fmul st, st
    faddp
    fld  qword [ecx]
    fsub qword [esi + 40]
    fmul st, st
    faddp
    fsqrt
    fmulp
@@2:                       //pd^
    fld  qword [esi + 24]
    fmul st, st
    fld  qword [esi + 32]
    fmul st, st
    faddp
    fld  qword [esi + 40]
    fmul st, st
    faddp
    fsqrt             //r1, pd^
    mov  ebx, [edi - 56]
    test ebx, 16      //Modus Bit1: Flip atan theta, 2: Flip atan phi, 3: Flip theta and phi, 4: Flip CxCy, 5: diffs
    jz   @@4                   //           r,y              z,x                  y<>x/z            y<>x
    fld  qword [eax]
    fsub qword [esi + 24]
    fld  qword [ecx]
    fsub qword [esi + 40]
    fld  qword [edx]
    fsub qword [esi + 32]
    jmp  @@5
@@4:
    fld  qword [esi + 24]
    fld  qword [esi + 40]
    fld  qword [esi + 32]
@@5:                  //Cy, Cz, Cx, r1, pd^
    xor  eax, eax     //offset for cond phi test, normally x, or z if only flip-at2
    xor  ecx, ecx
    add  ecx, 8
    test ebx, 8       //Modus bit4: flip CYCX
    jz   @@6
    fxch //st(2)        //(Cx,Cz,Cy)
    add  ecx, 8      //(Cz,Cx,Cy)   test: Flip Cy<>Cz
 //   mov  eax, ecx
 //   xor  ecx, ecx
@@6:                  //y, z, x, r1, pd^
    fld  st(1)
    fmul st, st
    fld  st(3)
    fmul st, st
    faddp             //xx+zz, y, z, x, r1, pd^
    fsqrt             //sqrt(sqr(j1)+sqr(j3)), y, z, x, r1, pd
    test ebx, 1       //flip AT theta
    jnz  @@8
    fxch
@@8:
    fpatan            //th, Cz, Cx, r1, pd
    fxch st(2)        //Cx, Cz, th, r1, pd
    test ebx, 2       //flip AT phi
    jz   @@9
    fxch
    add  eax, 24
    sub  eax, ecx
  //  mov  eax, 16
@@9:
    fpatan            //ph, th, r1, pd
    test ebx, 4
    jz   @@7
    fxch
    mov  eax, ecx
@@7:
    cmp  dword [edi - 32], 0
    jz   @@10
    test dword [edx + eax - 4], $80000000
    jnz  @@10
    fchs
@@10:
    fmul st, st(3)
    fxch st(3)        //pd, th, r1, ph
    fmulp             //th, r1, ph
    fsincos           //costh,sinth,r1,ph
    fxch st(3)        //ph,sinth,r1,costh
    fsincos           //Cx,Sx,Sy,r1,Cy
    fmul st, st(4)
    fmul st, st(3)
    fstp qword [esi + 24]  //Sx,Sy,r1,Cy
    fmulp st(3), st   //Sy,r1,Cy*Sx
    fmul st, st(1)
    fmul qword [edi - 48]
    fstp qword [esi + 40] //r1,Cy*Sx
    fmulp
    fstp qword [esi + 32]
@@1:
    pop  ecx
    pop  ebx
    pop  edi
    pop  esi
end;


{$ENDREGION '========================================================================== > | method'}


end.

