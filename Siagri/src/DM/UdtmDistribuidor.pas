unit UdtmDistribuidor;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdtmDistribuidor = class(TDataModule)
    sdsDistribuidor: TSQLDataSet;
    dspDistribuidor: TDataSetProvider;
    cdsDistribuidor: TClientDataSet;
    sdsDistribuidorID_DISTRIBUIDOR: TIntegerField;
    sdsDistribuidorNOMEDISTRIBUIDOR: TStringField;
    sdsDistribuidorCNPJDISTRUIBUIDOR: TStringField;
    cdsDistribuidorID_DISTRIBUIDOR: TIntegerField;
    cdsDistribuidorNOMEDISTRIBUIDOR: TStringField;
    cdsDistribuidorCNPJDISTRUIBUIDOR: TStringField;
    procedure cdsDistribuidorBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure buscarNomeDistr(idDistribuidor: Integer);
  end;

var
  dtmDistribuidor: TdtmDistribuidor;

implementation

uses UdtmPrincipal;

{$R *.dfm}

procedure TdtmDistribuidor.buscarNomeDistr(idDistribuidor: Integer);
begin
  with cdsDistribuidor do
    begin
      Close;
      CommandText := 'SELECT * FROM DISTRIBUIDOR WHERE DISTRIBUIDOR.ID_DISTRIBUIDOR = ' + IntToStr(idDistribuidor);
      Open;
    end;
end;

procedure TdtmDistribuidor.cdsDistribuidorBeforePost(DataSet: TDataSet);
var sDoc: String;
begin
  if Trim(cdsDistribuidorNOMEDISTRIBUIDOR.AsString) = '' then
    raise exception.Create('Nome do distribuidor n�o informado!');
  if Trim(cdsDistribuidorCNPJDISTRUIBUIDOR.AsString) = '' then
    raise exception.Create('Cnpj do distribuidor n�o informado!');

  sDoc := StringReplace(cdsDistribuidorCNPJDISTRUIBUIDOR.AsString, '.', '', [rfReplaceAll]);
  sDoc := StringReplace(sDoc, '-', '', [rfReplaceAll]);
  sDoc := StringReplace(sDoc, '/', '', [rfReplaceAll]);

  if not dtmPrincipal.CnpjValido(sDoc) then
    raise exception.Create('Cnpj informado � inv�lido!');
  if cdsDistribuidorID_DISTRIBUIDOR.AsInteger = 0 then
    begin
      cdsDistribuidorID_DISTRIBUIDOR.ReadOnly := False;
      cdsDistribuidorID_DISTRIBUIDOR.AsInteger := dtmPrincipal.ObterGenID('GEN_DISTRIBUIDOR');
      cdsDistribuidorID_DISTRIBUIDOR.ReadOnly := True;
    end;
end;

end.
