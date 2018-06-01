{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Cast integer value to byte
  @created(20/11/2017)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooByteCast;

interface

type
{$REGION 'documentation'}
{
  @abstract(Cast integer value to byte interface)
  @member(Value Byte representation)
}
{$ENDREGION}
  IByteCast = interface
    ['{1321FEEE-BEC0-44F8-A9D0-259893984898}']
    function Value: Byte;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IByteCast))
  @member(Value @seealso(IByteCast.Value))
  @member(
    Create Object constructor
    @param(Source Integer value)
  )
  @member(
    New Create a new @classname as interface
    @param(Source Integer value)
  )
}
{$ENDREGION}

  TByteFromInteger = class sealed(TInterfacedObject, IByteCast)
  strict private
    _Value: Byte;
    function RangeByte(const Source: Integer): Byte;
  public
    function Value: Byte;
    constructor Create(const Source: Integer);
    class function New(const Source: Integer): IByteCast;
  end;

implementation

function TByteFromInteger.RangeByte(const Source: Integer): Byte;
{$IFDEF FPC}
begin
  if Source < 0 then
    Result := 0
  else
    if Source > 255 then
      Result := 255
    else
      Result := Source;
{$ELSE}
asm
  MOV  EAX, Source      // store value in EAX register (32-bit register)
  CMP  EAX, 254         // compare it to 254
  JG   @SETHI           // if greater than 254 then go set to 255 (max value)
  CMP  EAX, 1           // if less than 255, compare to 1
  JL   @SETLO           // if less than 1 go set to 0 (min value)
  RET                   // otherwise it doesn't change, just exit
@SETHI:                 // Set value to 255
  MOV  EAX, 255         // Move 255 into the EAX register
  RET                   // Exit (result value is the EAX register value)
@SETLO:                 // Set value to 0
  MOV  EAX, 0           // Move 0 into EAX register
  {$ENDIF}
end;

function TByteFromInteger.Value: Byte;
begin
  Result := _Value
end;

constructor TByteFromInteger.Create(const Source: Integer);
begin
  _Value := RangeByte(Source);
end;

class function TByteFromInteger.New(const Source: Integer): IByteCast;
begin
  Result := TByteFromInteger.Create(Source);
end;

end.
