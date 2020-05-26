unit UfrmCadastroDistribuidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadastroBase, ComCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids,
  DBCtrls, udtmDistribuidor, StdCtrls, Mask;

type
  TfrmCadastroDistribuidor = class(TfrmCadastroBase)
    lblCodigo: TLabel;
    lblNomeDistribuidor: TLabel;
    lblCnpj: TLabel;
    edtCodigo: TDBEdit;
    edtNomeDistribuidor: TDBEdit;
    edtCnpjDistribuidor: TDBEdit;
    procedure btnInserirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDistribuidor: TdtmDistribuidor;
  public
    { Public declarations }
  end;

var
  frmCadastroDistribuidor: TfrmCadastroDistribuidor;

implementation

{$R *.dfm}

procedure TfrmCadastroDistribuidor.btnInserirClick(Sender: TObject);
begin
  inherited;
  edtNomeDistribuidor.SetFocus;
end;

procedure TfrmCadastroDistribuidor.FormCreate(Sender: TObject);
begin
  FDistribuidor := TdtmDistribuidor.Create(Self);
  dtsCadastro.DataSet := FDistribuidor.cdsDistribuidor;
  inherited;

end;

procedure TfrmCadastroDistribuidor.FormDestroy(Sender: TObject);
begin
  inherited;
  FDistribuidor.Free;
end;

end.
