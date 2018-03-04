{$REGION 'documentation'}
{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Bytes format abstraction
  @created(20/11/2017)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooBytes.Format.Intf;

interface

uses
  ooBytes.Scale;

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
  IBytesFormat = interface
    ['{D8FD710B-0A6D-4D50-80D8-AA05CFF776BE}']
    function Build(const ScaleUnit: TBytesScaleUnit): String;
  end;

implementation

end.
