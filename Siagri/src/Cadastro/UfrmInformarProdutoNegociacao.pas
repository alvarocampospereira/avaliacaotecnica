unit UfrmInformarProdutoNegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmBaseModal, StdCtrls, Buttons, ExtCtrls;

type
  TfrmInformarProdutoNegociacao = class(TfrmBaseModal)
    Label1: TLabel;
    lblQuantidade: TLabel;
    btnPesquisarProduto: TSpeedButton;
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    edtCodigoProduto: TEdit;
    edtNomeProduto: TEdit;
    edtQuantidade: TEdit;
    edtValorUnitario: TEdit;
    edtValorTotal: TEdit;
    lblValorUnitario: TLabel;
    lblValorTotal: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnPesquisarProdutoClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FID_Produto: Integer;
    FValorUnitario: Currency;
    FQuantidade: Currency;
    procedure SetID_Produto(const Value: Integer);
    procedure SetQuantidade(const Value: Currency);
    procedure SetValorUnitario(const Value: Currency);
    { Private declarations }
  public
    { Public declarations }
    property ID_Produto: Integer read FID_Produto write SetID_Produto;
    property ValorUnitario: Currency read FValorUnitario write SetValorUnitario;
    property Quantidade: Currency read FQuantidade write SetQuantidade;
  end;

var
  frmInformarProdutoNegociacao: TfrmInformarProdutoNegociacao;

implementation

uses UfrmPesquisaProduto;

{$R *.dfm}

procedure TfrmInformarProdutoNegociacao.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmInformarProdutoNegociacao.btnConfirmarClick(Sender: TObject);
var cQtde, cValorUnit: Currency;
begin
  inherited;
  if Trim(edtCodigoProduto.Text) = '' then
    raise exception.Create('Produto n�o informado!');
  cQtde := StrToFloat(edtQuantidade.Text);
  if cQtde = 0 then
    raise exception.Create('Quantidade n�o informado!');
  cValorUnit := StrToFloat(edtValorUnitario.Text);
  if cValorUnit = 0 then
    raise exception.Create('Valor unit�rio n�o informado!');

  ID_Produto := StrToInt(edtCodigoProduto.Text);
  Quantidade := cQtde;
  ValorUnitario := cValorUnit;
  
  Close;
end;

procedure TfrmInformarProdutoNegociacao.btnPesquisarProdutoClick(
  Sender: TObject);
begin
  inherited;
  frmPesquisaProduto := TfrmPesquisaProduto.Create(Self);
  frmPesquisaProduto.ShowModal;
  if frmPesquisaProduto.ID > 0 then
    begin
      edtCodigoProduto.Text := inttoStr(frmPesquisaProduto.ID);
      edtNomeProduto.Text := frmPesquisaProduto.Descricao;
      edtValorUnitario.Text := FormatFloat('0.00', frmPesquisaProduto.ValorVenda);
    end;
  frmPesquisaProduto.Free;
end;

procedure TfrmInformarProdutoNegociacao.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  Try
    TEdit(Sender).Text := StringReplace(TEdit(Sender).Text, '.', '', [rfReplaceAll]);
    {Verificar se � uma valor numerico}
    StrToFloat(TEdit(Sender).Text);

    TEdit(Sender).Text := FormatFloat('0.00', StrToFloat(TEdit(Sender).Text));
 Except on EConvertError do
    TEdit(Sender).Text := '0,00';
 End;

 edtValorTotal.Text :=  FormatFloat('0.00', StrToFloat(TEdit(Sender).Text) * StrToFloat(edtValorUnitario.Text));
end;

procedure TfrmInformarProdutoNegociacao.FormShow(Sender: TObject);
begin
  inherited;
  edtCodigoProduto.SetFocus;
end;

procedure TfrmInformarProdutoNegociacao.SetID_Produto(const Value: Integer);
begin
  FID_Produto := Value;
end;

procedure TfrmInformarProdutoNegociacao.SetQuantidade(const Value: Currency);
begin
  FQuantidade := Value;
end;

procedure TfrmInformarProdutoNegociacao.SetValorUnitario(const Value: Currency);
begin
  FValorUnitario := Value;
end;

end.
