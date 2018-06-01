{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooBytes.ByteFromInteger_test;

interface

uses
  SysUtils,
  ooByteCast,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TByteFromIntegerTest = class sealed(TTestCase)
  published
    procedure MinorZero;
    procedure Mayor255;
    procedure Is128;
    procedure Is255;
  end;

implementation

procedure TByteFromIntegerTest.Is128;
begin
  CheckEquals(128, TByteFromInteger.New(128).Value);
end;

procedure TByteFromIntegerTest.Is255;
begin
  CheckEquals(255, TByteFromInteger.New(255).Value);
end;

procedure TByteFromIntegerTest.Mayor255;
begin
  CheckEquals(255, TByteFromInteger.New(1000).Value);
end;

procedure TByteFromIntegerTest.MinorZero;
begin
  CheckEquals(0, TByteFromInteger.New( - 1000).Value);
end;

initialization

RegisterTest(TByteFromIntegerTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
