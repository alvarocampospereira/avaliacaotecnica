unit UfrmPesquisaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmPesquisaBase, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  udtmProduto;

type
  TfrmPesquisaProduto = class(TfrmPesquisaBase)
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FProduto: TdtmProduto;
    FValorVenda: Currency;
    procedure SetValorVenda(const Value: Currency);
  public
    { Public declarations }
    property ValorVenda: Currency read FValorVenda write SetValorVenda;
  protected
    procedure ExecutarBusca; override;
  end;

var
  frmPesquisaProduto: TfrmPesquisaProduto;

implementation

{$R *.dfm}

{ TfrmPesquisaProduto }

procedure TfrmPesquisaProduto.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  ValorVenda := dtsPesquisa.DataSet.FieldByName('VALORVENDA').AsCurrency;
end;

procedure TfrmPesquisaProduto.ExecutarBusca;
begin
  inherited;
  with FProduto.cdsProduto do
    begin
      Close;
      CommandText := 'SELECT * FROM PRODUTO WHERE PRODUTO.NOMEPRODUTO LIKE ''%' + edtPesquisa.Text + '%'' ORDER BY PRODUTO.NOMEPRODUTO';
      Open;
    end;
end;

procedure TfrmPesquisaProduto.FormCreate(Sender: TObject);
begin
  FProduto := TdtmProduto.Create(Self);
  dtsPesquisa.DataSet := FProduto.cdsProduto;
  inherited;
  CampoID := 'ID_PRODUTO';
  CampoDescricao := 'NOMEPRODUTO';
end;

procedure TfrmPesquisaProduto.SetValorVenda(const Value: Currency);
begin
  FValorVenda := Value;
end;

end.
