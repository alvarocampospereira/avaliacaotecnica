unit UdtmProdutor;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr, udtmPrincipal;

type
  TdtmProdutor = class(TDataModule)
    sdsProdutor: TSQLDataSet;
    dspProdutor: TDataSetProvider;
    cdsProdutor: TClientDataSet;
    sdsProdutorID_PRODUTOR: TIntegerField;
    sdsProdutorCPFCNPJPRODUTOR: TStringField;
    cdsProdutorID_PRODUTOR: TIntegerField;
    cdsProdutorCPFCNPJPRODUTOR: TStringField;
    sdsProdutorNOMEPRODUTOR: TStringField;
    cdsProdutorNOMEPRODUTOR: TStringField;
    procedure cdsProdutorBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure buscarNomeProd(idProdutor: Integer);
  end;

var
  dtmProdutor: TdtmProdutor;

implementation

{$R *.dfm}

procedure TdtmProdutor.buscarNomeProd(idProdutor: Integer);
begin
  with cdsProdutor do
    begin
      Close;
      CommandText := 'SELECT * FROM PRODUTOR WHERE PRODUTOR.ID_PRODUTOR = ' + IntToStr(idProdutor);
      Open;
    end;
end;

procedure TdtmProdutor.cdsProdutorBeforePost(DataSet: TDataSet);
var sDoc: String;
begin
  if Trim(cdsProdutorNOMEPRODUTOR.AsString) = '' then
    raise exception.Create('Nome do produtor n�o informado!');
  if Trim(cdsProdutorCPFCNPJPRODUTOR.AsString) = '' then
    raise exception.Create('Cnpj/Cpf n�o informado!');

  sDoc := StringReplace(cdsProdutorCPFCNPJPRODUTOR.AsString, '.', '', [rfReplaceAll]);
  sDoc := StringReplace(sDoc, '-', '', [rfReplaceAll]);
  sDoc := StringReplace(sDoc, '/', '', [rfReplaceAll]);

  if Length(sDoc) = 11 then
    begin
      if not dtmPrincipal.CpfValido(sDoc) then
        raise exception.Create('Cpf informado � inv�lido!');
      sDoc := Copy(sDoc,1,3) + '.' + Copy(sDoc,4,3) + '.' + Copy(sDoc,7,3) + '-' + Copy(sDoc,10,2);
    end
  else
    begin
      if not dtmPrincipal.CnpjValido(sDoc) then
        raise exception.Create('Cnpj informado � inv�lido!');
      sDoc := Copy(sDoc,1,2) + '.' + Copy(sDoc,3,3) + '.' + Copy(sDoc,6,3) + '/' + Copy(sDoc,9,4) + '-' + Copy(sDoc,13,2);  
    end;
  cdsProdutorCPFCNPJPRODUTOR.AsString := sDoc;
  if cdsProdutorID_PRODUTOR.AsInteger = 0 then
    begin
      cdsProdutorID_PRODUTOR.ReadOnly := False;
      cdsProdutorID_PRODUTOR.AsInteger := dtmPrincipal.ObterGenID('GEN_PRODUTOR');
      cdsProdutorID_PRODUTOR.ReadOnly := True;
    end;
end;

end.
