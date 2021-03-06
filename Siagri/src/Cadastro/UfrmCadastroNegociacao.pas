unit UfrmCadastroNegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadastroBase, DB, Grids, DBGrids, ComCtrls, DBCtrls, Buttons,
  ExtCtrls, UdtmNegociacao, UdtmNegociacaoProduto, StdCtrls, Mask,
  UdtmProdutorDistribuidorLimite, udtmProdutor, udtmDistribuidor;

type
  TfrmCadastroNegociacao = class(TfrmCadastroBase)
    lblCodigo: TLabel;
    lblNomeProduto: TLabel;
    lblValorVenda: TLabel;
    edtCodigo: TDBEdit;
    edtNomeProdutor: TDBEdit;
    edtCodigoDistribuidor: TDBEdit;
    edtCodigoProdutor: TDBEdit;
    btnPesquisaProdutor: TSpeedButton;
    edtNomeDistribuidor: TDBEdit;
    btnDistribuidor: TSpeedButton;
    Label1: TLabel;
    edtStatus: TDBEdit;
    Label2: TLabel;
    edtDataCadastro: TDBEdit;
    GroupBox1: TGroupBox;
    btnInserirProduto: TBitBtn;
    btnExcluirProduto: TBitBtn;
    grdProdutos: TDBGrid;
    Label3: TLabel;
    edtTotalNegociacao: TDBEdit;
    dtsProdutos: TDataSource;
    lblCodigoContrato: TLabel;
    edtCodigoContrato: TDBEdit;
    dtsProdutor: TDataSource;
    dtsDistribuidor: TDataSource;
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure dtsCadastroDataChange(Sender: TObject; Field: TField);
    procedure btnInserirProdutoClick(Sender: TObject);
    procedure btnDistribuidorClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnPesquisaProdutorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FNegociacao: TdtmNegociacao;
    FNegociacaoProduto: TdtmNegociacaoProduto;
    FProdutorDistLimite: TdtmProdutorDistribuidorLimite;
    FProdutor: TdtmProdutor;
    FDistribuidor: TdtmDistribuidor;
    procedure validarLimite(cValorNovoProd: Currency);
    function obterTotalProdutos: Currency;
    procedure AtualizaTotal;
  public
    { Public declarations }
  end;

var
  frmCadastroNegociacao: TfrmCadastroNegociacao;

implementation

uses UfrmPesquisaProdutor, UfrmPesquisaDistribuidor,
  UfrmInformarProdutoNegociacao;

{$R *.dfm}

procedure TfrmCadastroNegociacao.AtualizaTotal;
begin
  if not (dtsCadastro.DataSet.State in [dsinsert, dsedit]) then
    dtsCadastro.DataSet.Edit;
  dtsCadastro.DataSet.FieldByName('VALORTOTAL').AsCurrency := obterTotalProdutos;
  btnSalvarClick(self);   
end;

procedure TfrmCadastroNegociacao.btnDistribuidorClick(Sender: TObject);
begin
  inherited;
  frmPesquisaDistribuidor := TfrmPesquisaDistribuidor.Create(Self);
  frmPesquisaDistribuidor.ShowModal;
  if frmPesquisaDistribuidor.ID > 0 then
    begin
      dtsCadastro.DataSet.FieldByName('ID_DISTRIBUIDOR').AsInteger := frmPesquisaDistribuidor.ID;
    end;
  frmPesquisaDistribuidor.Free;
end;

procedure TfrmCadastroNegociacao.btnExcluirProdutoClick(Sender: TObject);
begin
  inherited;
  FNegociacaoProduto.excluirNegociacaoProduto(dtsProdutos.DataSet.FieldByName('ID_NEGOCIACAOPRODUTO').AsInteger);
  FNegociacaoProduto.buscarNegociacaoProduto(dtsCadastro.DataSet.FieldByName('ID_NEGOCIACAO').AsInteger);
  AtualizaTotal;
end;

procedure TfrmCadastroNegociacao.btnInserirClick(Sender: TObject);
begin
  inherited;
  edtCodigoProdutor.SetFocus;
end;

procedure TfrmCadastroNegociacao.btnInserirProdutoClick(Sender: TObject);
begin
  inherited;
  if dtsCadastro.State in [dsinsert, dsEdit] then
    btnSalvarClick(self);

  frmInformarProdutoNegociacao := TfrmInformarProdutoNegociacao.Create(Self);
  frmInformarProdutoNegociacao.ShowModal;
  if frmInformarProdutoNegociacao.ID_Produto > 0 then
    begin
      validarLimite(frmInformarProdutoNegociacao.Quantidade *
        frmInformarProdutoNegociacao.ValorUnitario);
      FNegociacaoProduto.inserirNegociacaoProduto(dtsCadastro.DataSet.FieldByName('ID_NEGOCIACAO').AsInteger,
        frmInformarProdutoNegociacao.ID_Produto, frmInformarProdutoNegociacao.Quantidade,
        frmInformarProdutoNegociacao.ValorUnitario);

    end;
  frmInformarProdutoNegociacao.Free;
  FNegociacaoProduto.buscarNegociacaoProduto(dtsCadastro.DataSet.FieldByName('ID_NEGOCIACAO').AsInteger);
  AtualizaTotal;
end;

procedure TfrmCadastroNegociacao.FormCreate(Sender: TObject);
begin
  FProdutor := TdtmProdutor.Create(Self);
  dtsProdutor.DataSet := FProdutor.cdsProdutor;
  FDistribuidor := TdtmDistribuidor.Create(Self);
  dtsDistribuidor.DataSet := FDistribuidor.cdsDistribuidor;
  
  FNegociacao := TdtmNegociacao.Create(Self);
  dtsCadastro.DataSet := FNegociacao.cdsNegociacao;
  FNegociacaoProduto := TdtmNegociacaoProduto.Create(Self);
  FNegociacaoProduto.cdsNegProduto.Open;
  dtsProdutos.DataSet := FNegociacaoProduto.cdsNegProdutoProdutos;
  FNegociacaoProduto.cdsNegProdutoProdutos.Open;

  FProdutorDistLimite := TdtmProdutorDistribuidorLimite.Create(Self);
  inherited;
end;

procedure TfrmCadastroNegociacao.FormDestroy(Sender: TObject);
begin
  inherited;
  FNegociacao.Free;
  FNegociacaoProduto.Free;
  FProdutorDistLimite.Free;
  FProdutor.Free;
  FDistribuidor.Free;
end;

function TfrmCadastroNegociacao.obterTotalProdutos: Currency;
var cTotal: Currency;
begin
  cTotal := 0;
  with dtsProdutos.DataSet do
    begin
      First;
      while not EOF do
        begin
          cTotal := cTotal + FieldByName('valortotalproduto').AsCurrency;
          Next;
        end; // while
      First;
    end; // with
  Result := cTotal;  
end;

procedure TfrmCadastroNegociacao.validarLimite(cValorNovoProd: Currency);
var cDisp: Currency;
begin
  cDisp := FProdutorDistLimite.obterLimite(
    dtsCadastro.DataSet.FieldByName('ID_PRODUTOR').AsInteger,
    dtsCadastro.DataSet.FieldByName('ID_DISTRIBUIDOR').AsInteger);
  if dtsCadastro.DataSet.FieldByName('STATUS').AsString <> 'A' then
    cDisp := (cDisp - obterTotalProdutos);
  if cValorNovoProd > cDisp then
    raise exception.Create('Limte distribuidor ultrapassado.' + #13#10 +
      'Limite disponivel: ' + FloatToStrF(cDisp, ffNumber, 15,2));
end;

procedure TfrmCadastroNegociacao.btnPesquisaProdutorClick(Sender: TObject);
begin
  inherited;
  frmPesquisaProdutor := TfrmPesquisaProdutor.Create(Self);
  frmPesquisaProdutor.ShowModal;
  if frmPesquisaProdutor.ID > 0 then
    begin
      dtsCadastro.DataSet.FieldByName('ID_PRODUTOR').AsInteger := frmPesquisaProdutor.ID;
    end;
  frmPesquisaProdutor.Free;
end;

procedure TfrmCadastroNegociacao.dtsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (dtsCadastro.DataSet <> nil) and (dtsCadastro.DataSet.FieldByName('ID_NEGOCIACAO').AsInteger > 0) then
    FNegociacaoProduto.buscarNegociacaoProduto(dtsCadastro.DataSet.FieldByName('ID_NEGOCIACAO').AsInteger)
  else
    FNegociacaoProduto.buscarNegociacaoProduto(-1);

  if (dtsCadastro.DataSet <> nil) and (dtsCadastro.DataSet.FieldByName('ID_PRODUTOR').AsInteger > 0) then
    FProdutor.buscarNomeProd(dtsCadastro.DataSet.FieldByName('ID_PRODUTOR').AsInteger)
  else
    FProdutor.buscarNomeProd(-1);

  if (dtsCadastro.DataSet <> nil) and (dtsCadastro.DataSet.FieldByName('ID_DISTRIBUIDOR').AsInteger > 0) then
    FDistribuidor.buscarNomeDistr(dtsCadastro.DataSet.FieldByName('ID_DISTRIBUIDOR').AsInteger)
  else
    FDistribuidor.buscarNomeDistr(-1);
end;

end.
