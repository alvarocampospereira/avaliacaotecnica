unit UfrmCadastroBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBaseChild, ExtCtrls, Buttons, ComCtrls, Grids, DBGrids, DB,
  DBClient, DBCtrls;

type
  TfrmCadastroBase = class(TfrmBaseChild)
    pnlMenu: TPanel;
    btnInserir: TSpeedButton;
    pgcPrincipal: TPageControl;
    tbsCadastro: TTabSheet;
    tbsLista: TTabSheet;
    grdListaCadastro: TDBGrid;
    dtsCadastro: TDataSource;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnAlternar: TSpeedButton;
    DBNavigator1: TDBNavigator;
    procedure btnAlternarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dtsCadastroStateChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

{$R *.dfm}

procedure TfrmCadastroBase.btnSalvarClick(Sender: TObject);
begin
  inherited;
  dtsCadastro.DataSet.Post;
  TCustomClientDataSet(dtsCadastro.DataSet).ApplyUpdates(-1);
end;

procedure TfrmCadastroBase.dtsCadastroStateChange(Sender: TObject);
begin
  inherited;
  btnInserir.Enabled := not (dtsCadastro.State in [dsInsert, dsEdit]);
  btnSalvar.Enabled := (dtsCadastro.State in [dsInsert, dsEdit]);
  btnCancelar.Enabled := (dtsCadastro.State in [dsInsert, dsEdit]);
  btnExcluir.Enabled := not (dtsCadastro.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadastroBase.FormCreate(Sender: TObject);
begin
  inherited;
  dtsCadastro.DataSet.Open;
  // posiciona na aba de cadastro
  tbsCadastro.TabVisible := False;
  tbsLista.TabVisible := False;
  pgcPrincipal.ActivePageIndex := 0;
end;

procedure TfrmCadastroBase.btnAlternarClick(Sender: TObject);
begin
  inherited;
  if pgcPrincipal.ActivePageIndex = 0 then
    begin
      btnAlternar.Caption := 'Cadastro';
      pgcPrincipal.ActivePageIndex := 1;
    end
  else
    begin
      btnAlternar.Caption := 'Lista';
      pgcPrincipal.ActivePageIndex := 0;
    end;
end;

procedure TfrmCadastroBase.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dtsCadastro.DataSet.Cancel;
  TCustomClientDataSet(dtsCadastro.DataSet).ApplyUpdates(-1);
end;

procedure TfrmCadastroBase.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente apagar o registro?', mtConfirmation,[mbYes, mbNo],0) = mrYes then
    begin
      dtsCadastro.DataSet.Delete;
      TCustomClientDataSet(dtsCadastro.DataSet).ApplyUpdates(-1);
    end;
end;

procedure TfrmCadastroBase.btnInserirClick(Sender: TObject);
begin
  inherited;
  dtsCadastro.DataSet.Append;
end;

end.

