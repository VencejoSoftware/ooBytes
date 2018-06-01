{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Bytes object definition
  @created(20/11/2017)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooBytes;

interface

type
{$REGION 'documentation'}
{
  @abstract(Bytes object interface)
  @member(Size Value of bytes in double type)
}
{$ENDREGION}
  IBytes = interface
    ['{4D09BE05-8382-4817-B707-5A233180C768}']
    function Size: Extended;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IBytes))
  @member(Size @seealso(IBytes.Size))
  @member(
    Create Object constructor
    @param(Size Size of bytes)
  )
  @member(
    New Create a new @classname as interface
    @param(Size Size of bytes)
  )
}
{$ENDREGION}

  TBytes = class sealed(TInterfacedObject, IBytes)
  strict private
    _Size: Extended;
  public
    function Size: Extended;
    constructor Create(const Size: Extended);
    class function New(const Size: Extended): IBytes;
  end;

implementation

function TBytes.Size: Extended;
begin
  Result := _Size;
end;

constructor TBytes.Create(const Size: Extended);
begin
  _Size := Size;
end;

class function TBytes.New(const Size: Extended): IBytes;
begin
  Result := TBytes.Create(Size);
end;

end.
