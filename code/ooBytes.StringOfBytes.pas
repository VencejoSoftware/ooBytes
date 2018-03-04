{$REGION 'documentation'}
{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Build a redeable string of bytes
  @created(20/11/2017)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooBytes.StringOfBytes;

interface

uses
  SysUtils,
  ooBytes.Scale,
  ooBytes.Format.Intf;

type
{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IBytesFormat) to convert to string)
  Build a redeable string of bytes
  @member(Build @seealso(IBytesFormat.Build))
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
  TStringOfBytes = class(TInterfacedObject, IBytesFormat)
  strict private
    _BytesScale: IBytesScale;
  public
    function Build(const Scale: TBytesScaleUnit): String;
    constructor Create(const Bytes: IBytesScale);
    class function New(const Bytes: IBytesScale): IBytesFormat;
  end;

implementation

function TStringOfBytes.Build(const Scale: TBytesScaleUnit): String;
const
  SIZE_TYPE: array [TBytesScaleUnit] of string = ('Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
begin
  Result := Format('%n %s', [_BytesScale.ToScaleUnit(Scale), SIZE_TYPE[Scale]]);
end;

constructor TStringOfBytes.Create(const Bytes: IBytesScale);
begin
  _BytesScale := Bytes;
end;

class function TStringOfBytes.New(const Bytes: IBytesScale): IBytesFormat;
begin
  Result := Create(Bytes);
end;

end.
