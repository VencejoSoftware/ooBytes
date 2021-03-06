{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Bytes scale cast object
  @created(20/11/2017)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit BytesScale;

interface

uses
  Math,
  Bytes;

type
{$REGION 'documentation'}
{
  Enum for archive attributes
  @value Bytes Byte scale
  @value KB Kilobyte scale
  @value MB Megabyte scale
  @value GB Gigabyte scale
  @value TB Terabyte scale
  @value PB Petabyte scale
  @value EB Exabyte scale
  @value ZB Zettabyte scale
  @value YB Yottabyte scale
}
{$ENDREGION}
  TBytesScaleUnit = (Byte, KB, MB, GB, TB, PB, EB, ZB, YB);

{$REGION 'documentation'}
{
  @abstract(Bytes scale cast object)
  @member(
    ScaleOf Cast bytes to scale unit
    @param(Units Scale unit kind to scale)
    @return(Double value in the bytes size scale)
  )
  @member(FitScaleUnit Automatic find scale unit)
}
{$ENDREGION}

  IBytesScale = interface(IBytes)
    ['{554430DF-59D1-4B1E-8A09-082CA6B066F8}']
    function ScaleOf(const Units: TBytesScaleUnit): Extended;
    function FitScaleUnit: TBytesScaleUnit;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IBytesScale))
  @member(Size @seealso(IBytes.Size))
  @member(ScaleOf @seealso(IBytesScale.ScaleOf))
  @member(FitScaleUnit @seealso(IBytesScale.FitScaleUnit))
  @member(
    Create Object constructor
    @param(Bytes Bytes source object)
  )
  @member(
    New Create a new @classname as interface
    @param(Bytes Bytes source object)
  )
}
{$ENDREGION}

  TBytesScale = class sealed(TInterfacedObject, IBytesScale)
  strict private
    _Bytes: IBytes;
  public
    function Size: Extended;
    function ScaleOf(const Units: TBytesScaleUnit): Extended;
    function FitScaleUnit: TBytesScaleUnit;
    constructor Create(const Bytes: IBytes);
    class function New(const Bytes: IBytes): IBytesScale;
  end;

implementation

function TBytesScale.Size: Extended;
begin
  Result := _Bytes.Size;
end;

function TBytesScale.FitScaleUnit: TBytesScaleUnit;
begin
  for Result := Low(TBytesScaleUnit) to High(TBytesScaleUnit) do
    if Size < Power(1024, Succ(Ord(Result))) then
      Break;
end;

function TBytesScale.ScaleOf(const Units: TBytesScaleUnit): Extended;
begin
  Result := Size / IntPower(1024, Ord(Units));
end;

constructor TBytesScale.Create(const Bytes: IBytes);
begin
  _Bytes := Bytes;
end;

class function TBytesScale.New(const Bytes: IBytes): IBytesScale;
begin
  Result := TBytesScale.Create(Bytes);
end;

end.
