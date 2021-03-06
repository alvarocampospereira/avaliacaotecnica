unit UdtmNegociacaoProduto;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr, Variants,Dialogs;

type
  TdtmNegociacaoProduto = class(TDataModule)
    sdsNegProduto: TSQLDataSet;
    dspNegProduto: TDataSetProvider;
    cdsNegProduto: TClientDataSet;
    sdsNegProdutoID_NEGOCIACAOPRODUTO: TIntegerField;
    sdsNegProdutoID_NEGOCIACAO: TIntegerField;
    sdsNegProdutoID_PRODUTO: TIntegerField;
    sdsNegProdutoVALORPRODUTO: TFMTBCDField;
    sdsNegProdutoQUANTIDADE: TFMTBCDField;
    sdsNegProdutoVALORTOTALPRODUTO: TFMTBCDField;
    cdsNegProdutoID_NEGOCIACAOPRODUTO: TIntegerField;
    cdsNegProdutoID_NEGOCIACAO: TIntegerField;
    cdsNegProdutoID_PRODUTO: TIntegerField;
    cdsNegProdutoVALORPRODUTO: TFMTBCDField;
    cdsNegProdutoQUANTIDADE: TFMTBCDField;
    cdsNegProdutoVALORTOTALPRODUTO: TFMTBCDField;
    sdsNegProdutoProdutos: TSQLDataSet;
    dspNegProdutoProdutos: TDataSetProvider;
    cdsNegProdutoProdutos: TClientDataSet;
    sdsNegProdutoProdutosID_NEGOCIACAOPRODUTO: TIntegerField;
    sdsNegProdutoProdutosID_PRODUTO: TIntegerField;
    sdsNegProdutoProdutosVALORPRODUTO: TFMTBCDField;
    sdsNegProdutoProdutosQUANTIDADE: TFMTBCDField;
    sdsNegProdutoProdutosVALORTOTALPRODUTO: TFMTBCDField;
    sdsNegProdutoProdutosNOMEPRODUTO: TStringField;
    cdsNegProdutoProdutosID_NEGOCIACAOPRODUTO: TIntegerField;
    cdsNegProdutoProdutosID_PRODUTO: TIntegerField;
    cdsNegProdutoProdutosVALORPRODUTO: TFMTBCDField;
    cdsNegProdutoProdutosQUANTIDADE: TFMTBCDField;
    cdsNegProdutoProdutosVALORTOTALPRODUTO: TFMTBCDField;
    cdsNegProdutoProdutosNOMEPRODUTO: TStringField;
    procedure cdsNegProdutoProdutosVALORTOTALPRODUTOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsNegProdutoProdutosQUANTIDADEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsNegProdutoProdutosVALORPRODUTOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsNegProdutoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure inserirNegociacaoProduto(idNegociacao, idProduto: Integer;
      cQuantidade, cValorUnitario: Currency);
    procedure excluirNegociacaoProduto(idNegociacaoProd: Integer);
    procedure buscarNegociacaoProduto(idNegociacaoProd: Integer);
  end;

var
  dtmNegociacaoProduto: TdtmNegociacaoProduto;

implementation

uses UdtmPrincipal;

{$R *.dfm}

{ TdtmNegociacaoProduto }

procedure TdtmNegociacaoProduto.buscarNegociacaoProduto(
  idNegociacaoProd: Integer);
begin
  with cdsNegProdutoProdutos do
    begin
      Close;
      Params.ParamByName('IDNEGOCIACAO').AsInteger := idNegociacaoProd;
      Open;
    end;
end;

procedure TdtmNegociacaoProduto.cdsNegProdutoBeforePost(DataSet: TDataSet);
begin
  if cdsNegProdutoID_NEGOCIACAOPRODUTO.AsInteger = 0 then
    begin
      cdsNegProdutoID_NEGOCIACAOPRODUTO.ReadOnly := False;
      cdsNegProdutoID_NEGOCIACAOPRODUTO.AsInteger := dtmPrincipal.ObterGenID('GEN_NEGOCIACAOPRODUTO');
      cdsNegProdutoID_NEGOCIACAOPRODUTO.ReadOnly := True;
    end;
end;

procedure TdtmNegociacaoProduto.cdsNegProdutoProdutosQUANTIDADEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString <> '' Then
    text:=FormatFloat('#0.00',sender.AsFloat);
end;

procedure TdtmNegociacaoProduto.cdsNegProdutoProdutosVALORPRODUTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString <> '' Then
    text:=FormatFloat('#0.00',sender.AsFloat);
end;

procedure TdtmNegociacaoProduto.cdsNegProdutoProdutosVALORTOTALPRODUTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString <> '' Then
    text:=FormatFloat('#0.00',sender.AsFloat);
end;

procedure TdtmNegociacaoProduto.excluirNegociacaoProduto(
  idNegociacaoProd: Integer);
begin
  if cdsNegProduto.Locate('ID_NEGOCIACAOPRODUTO', VarArrayOf([idNegociacaoProd]), [loCaseInsensitive]) then
    begin
      cdsNegProduto.Delete;
      cdsNegProduto.ApplyUpdates(-1);
    end;
end;

procedure TdtmNegociacaoProduto.inserirNegociacaoProduto(idNegociacao,
  idProduto: Integer; cQuantidade, cValorUnitario: Currency);
begin
  // verifica se j� n�o esta cadastrado
  if not cdsNegProduto.Locate('ID_NEGOCIACAO;ID_PRODUTO', VarArrayOf([idNegociacao,idProduto]), [loCaseInsensitive]) then
    begin
      cdsNegProduto.Append;
      cdsNegProdutoID_NEGOCIACAO.AsInteger := idNegociacao;
      cdsNegProdutoID_PRODUTO.AsInteger := idProduto;
      cdsNegProdutoQUANTIDADE.AsCurrency := cQuantidade;
      cdsNegProdutoVALORPRODUTO.AsCurrency := cValorUnitario;
      cdsNegProduto.Post;
      cdsNegProduto.ApplyUpdates(-1);
    end
  else
    MessageDlg('Produto j� cadastrado para a negocia��o atual!',mtWarning, [mbOK], 0);
end;

end.
