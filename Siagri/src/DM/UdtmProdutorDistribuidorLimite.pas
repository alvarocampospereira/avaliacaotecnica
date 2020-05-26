unit UdtmProdutorDistribuidorLimite;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr, udtmPrincipal,
    Variants, Dialogs ;

type
  TdtmProdutorDistribuidorLimite = class(TDataModule)
    sdsLimite: TSQLDataSet;
    dspLimite: TDataSetProvider;
    cdsLimite: TClientDataSet;
    sdsLimiteID_LIMITE: TIntegerField;
    sdsLimiteID_PRODUTOR: TIntegerField;
    sdsLimiteID_DISTRIBUIDOR: TIntegerField;
    sdsLimiteVALORLIMITE: TFMTBCDField;
    cdsLimiteID_LIMITE: TIntegerField;
    cdsLimiteID_PRODUTOR: TIntegerField;
    cdsLimiteID_DISTRIBUIDOR: TIntegerField;
    cdsLimiteVALORLIMITE: TFMTBCDField;
    cdsLimiteDistr: TClientDataSet;
    sdsLimiteDistr: TSQLDataSet;
    dspLimiteDistr: TDataSetProvider;
    sdsLimiteDistrVALORLIMITE: TFMTBCDField;
    sdsLimiteDistrNOMEDISTRIBUIDOR: TStringField;
    sdsLimiteDistrID_DISTRIBUIDOR: TIntegerField;
    cdsLimiteDistrID_DISTRIBUIDOR: TIntegerField;
    cdsLimiteDistrNOMEDISTRIBUIDOR: TStringField;
    sdsLimiteDistrID_LIMITE: TIntegerField;
    cdsLimiteDistrID_LIMITE: TIntegerField;
    cdsLimiteDistrVALORLIMITE: TFMTBCDField;
    sdsObterLimite: TSQLDataSet;
    dspObterLimite: TDataSetProvider;
    cdsObterLimite: TClientDataSet;
    sdsObterLimiteVALORLIMITECALC: TFMTBCDField;
    cdsObterLimiteVALORLIMITECALC: TFMTBCDField;
    procedure cdsLimiteDistrVALORLIMITEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsLimiteBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InserirDistribuidorLimite(idDistribuidor, idProdutor: Integer; cValorLimite:
      Currency);
    procedure ExcluirDistribuidorLimite(idLimite: Integer);
    procedure buscarDistribuidorProdutor(idProdutor: Integer);
    function obterLimite(idProdutor, idDistribuidor: Integer): Currency;
  end;

var
  dtmProdutorDistribuidorLimite: TdtmProdutorDistribuidorLimite;

implementation

{$R *.dfm}

{ TdtmProdutorDistribuidorLimite }

procedure TdtmProdutorDistribuidorLimite.buscarDistribuidorProdutor(
  idProdutor: Integer);
begin
  with cdsLimiteDistr do
    begin
      Close;
      Params.ParamByName('IDPRODUTOR').AsInteger := idProdutor;
      Open;
    end;
end;

procedure TdtmProdutorDistribuidorLimite.cdsLimiteBeforePost(DataSet: TDataSet);
begin
  if cdsLimiteID_LIMITE.AsInteger = 0 then
    begin
      cdsLimiteID_LIMITE.ReadOnly := False;
      cdsLimiteID_LIMITE.AsInteger := dtmPrincipal.ObterGenID('GEN_PRODUTORDISTRIBUIDORLIMITE');
      cdsLimiteID_LIMITE.ReadOnly := True;
    end;
end;

procedure TdtmProdutorDistribuidorLimite.cdsLimiteDistrVALORLIMITEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString <> '' Then
    text:=FormatFloat('#0.00',sender.AsFloat);
end;

procedure TdtmProdutorDistribuidorLimite.ExcluirDistribuidorLimite(
  idLimite: Integer);
begin
  if cdsLimite.Locate('ID_LIMITE', VarArrayOf([idLimite]), [loCaseInsensitive]) then
    begin
      cdsLimite.Delete;
      cdsLimite.ApplyUpdates(-1);
    end;
end;

procedure TdtmProdutorDistribuidorLimite.InserirDistribuidorLimite(
  idDistribuidor, idProdutor: Integer; cValorLimite: Currency);
begin
  // verifica se j� n�o esta cadastrado
  if not cdsLimite.Locate('ID_DISTRIBUIDOR;ID_PRODUTOR', VarArrayOf([idDistribuidor,idProdutor]), [loCaseInsensitive]) then
    begin
      cdsLimite.Append;
      cdsLimiteID_DISTRIBUIDOR.AsInteger := idDistribuidor;
      cdsLimiteID_PRODUTOR.AsInteger := idProdutor;
      cdsLimiteVALORLIMITE.AsCurrency := cValorLimite;
      cdsLimite.Post;
      cdsLimite.ApplyUpdates(-1);
    end
  else
    MessageDlg('Distribuidor j� cadastrado para o produtor atual!',mtWarning, [mbOK], 0);
end;

function TdtmProdutorDistribuidorLimite.obterLimite(idProdutor,
  idDistribuidor: Integer): Currency;
begin
  with cdsObterLimite do
    begin
      Close;
      Params.ParamByName('IDPRODUTOR').AsInteger := idProdutor;
      Params.ParamByName('IDDISTRIBUIDOR').AsInteger := idDistribuidor;
      Open;
      Result := FieldByName('VALORLIMITECALC').AsCurrency;
    end;
end;

end.

