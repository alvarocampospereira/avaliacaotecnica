unit UfrmCadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadastroBase, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls, DB, Grids, DBGrids, udtmProduto;

type
  TfrmCadastroProduto = class(TfrmCadastroBase)
    lblCodigo: TLabel;
    lblNomeProduto: TLabel;
    lblValorVenda: TLabel;
    edtCodigo: TDBEdit;
    edtNomeProduto: TDBEdit;
    edtValorVenda: TDBEdit;
    procedure btnInserirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FProduto: TdtmProduto;
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

procedure TfrmCadastroProduto.btnInserirClick(Sender: TObject);
begin
  inherited;
  edtNomeProduto.SetFocus;
end;

procedure TfrmCadastroProduto.FormCreate(Sender: TObject);
begin
  FProduto := TdtmProduto.Create(self);
  dtsCadastro.DataSet := FProduto.cdsProduto;
  inherited;

end;

procedure TfrmCadastroProduto.FormDestroy(Sender: TObject);
begin
  inherited;
  FProduto.Free;
end;

end.
