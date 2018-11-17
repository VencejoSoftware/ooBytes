{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit BytesScale_test;

interface

uses
  SysUtils,
  Math,
  Bytes, BytesScale,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TBytesScaleTest = class sealed(TTestCase)
  published
    procedure BytesFit;
    procedure KBFit;
    procedure MBFit;
    procedure GBFit;
    procedure TBFit;
    procedure PBFit;
    procedure EBFit;
    procedure ZBFit;
    procedure YBFit;
  end;

implementation

procedure TBytesScaleTest.BytesFit;
begin
  CheckTrue(Byte = TBytesScale.New(TBytes.New((Power(1024, Ord(Byte))))).FitScaleUnit);
end;

procedure TBytesScaleTest.KBFit;
begin
  CheckTrue(KB = TBytesScale.New(TBytes.New((Power(1024, Ord(KB))))).FitScaleUnit);
end;

procedure TBytesScaleTest.MBFit;
begin
  CheckTrue(MB = TBytesScale.New(TBytes.New((Power(1024, Ord(MB))))).FitScaleUnit);
end;

procedure TBytesScaleTest.GBFit;
begin
  CheckTrue(GB = TBytesScale.New(TBytes.New((Power(1024, Ord(GB))))).FitScaleUnit);
end;

procedure TBytesScaleTest.TBFit;
begin
  CheckTrue(TB = TBytesScale.New(TBytes.New((Power(1024, Ord(TB))))).FitScaleUnit);
end;

procedure TBytesScaleTest.PBFit;
begin
  CheckTrue(PB = TBytesScale.New(TBytes.New((Power(1024, Ord(PB))))).FitScaleUnit);
end;

procedure TBytesScaleTest.EBFit;
begin
  CheckTrue(EB = TBytesScale.New(TBytes.New((Power(1024, Ord(EB))))).FitScaleUnit);
end;

procedure TBytesScaleTest.ZBFit;
begin
  CheckTrue(YB = TBytesScale.New(TBytes.New((Power(1024, Ord(YB))))).FitScaleUnit);
end;

procedure TBytesScaleTest.YBFit;
begin
  CheckTrue(ZB = TBytesScale.New(TBytes.New((Power(1024, Ord(ZB))))).FitScaleUnit);
end;

initialization

RegisterTest(TBytesScaleTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
