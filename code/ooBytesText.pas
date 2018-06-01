{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Bytes format abstraction
  @created(20/11/2017)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooBytesText;

interface

uses
  SysUtils,
  ooBytesScale;

type
{$REGION 'documentation'}
{
  @abstract(Bytes format interface)
  @member(
    Build Convert bytes to string with specific scale unit
    @param(ScaleUnit Scale unit kind to use when build)
  )
}
{$ENDREGION}
  IBytesText = interface
    ['{D8FD710B-0A6D-4D50-80D8-AA05CFF776BE}']
    function Build(const ScaleUnit: TBytesScaleUnit): String;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IBytesText) to convert to string)
  Build a redeable string of bytes
  @member(Build @seealso(IBytesText.Build))
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

  TBytesText = class(TInterfacedObject, IBytesText)
  strict private
    _BytesScale: IBytesScale;
  public
    function Build(const Scale: TBytesScaleUnit): String;
    constructor Create(const Bytes: IBytesScale);
    class function New(const Bytes: IBytesScale): IBytesText;
  end;

implementation

function TBytesText.Build(const Scale: TBytesScaleUnit): String;
const
  SIZE_TYPE: array [TBytesScaleUnit] of string = ('Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
begin
  Result := Format('%n %s', [_BytesScale.ScaleOf(Scale), SIZE_TYPE[Scale]]);
end;

constructor TBytesText.Create(const Bytes: IBytesScale);
begin
  _BytesScale := Bytes;
end;

class function TBytesText.New(const Bytes: IBytesScale): IBytesText;
begin
  Result := Create(Bytes);
end;

end.
