{
  Copyright (c) 2018 Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
program test;

uses
  ooRunTest,
  ooBytesText_test in '..\code\ooBytesText_test.pas',
  ooBytesScale_test in '..\code\ooBytesScale_test.pas',
  ooBytes.ByteFromInteger_test in '..\code\ooBytes.ByteFromInteger_test.pas',
  ooByteCast in '..\..\code\ooByteCast.pas',
  ooBytesText in '..\..\code\ooBytesText.pas',
  ooBytes in '..\..\code\ooBytes.pas',
  ooBytesScale in '..\..\code\ooBytesScale.pas';

{R *.RES}

begin
  Run;

end.
