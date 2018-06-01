{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooBytesText_test;

interface

uses
  SysUtils,
  ooBytes, ooBytesScale, ooBytesText,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TStringOfBytesTest = class sealed(TTestCase)
  published
    procedure BuildOf1024Bytes;
    procedure BuildToScaleUnitMBOf6000Bytes;
  end;

implementation

procedure TStringOfBytesTest.BuildToScaleUnitMBOf6000Bytes;
begin
  CheckEquals(Format('%n MB', [0.01]), TBytesText.New(TBytesScale.New(TBytes.New(6000))).Build(MB));
end;

procedure TStringOfBytesTest.BuildOf1024Bytes;
begin
  CheckEquals(Format('%n KB', [1.00]), TBytesText.New(TBytesScale.New(TBytes.New(1024))).Build(KB));
end;

initialization

RegisterTest(TStringOfBytesTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
