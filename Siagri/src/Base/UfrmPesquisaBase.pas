unit UfrmPesquisaBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmBaseModal, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB;

type
  TfrmPesquisaBase = class(TfrmBaseModal)
    pnlRodape: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlTopo: TPanel;
    grdPesquisa: TDBGrid;
    dtsPesquisa: TDataSource;
    lblPesquisa: TLabel;
    edtPesquisa: TEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FID: Integer;
    FDescricao: String;
    FCampoID: String;
    FCampoDescricao: String;
    procedure SetCampoDescricao(const Value: String);
    procedure SetCampoID(const Value: String);
    procedure SetDescricao(const Value: String);
    procedure SetID(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property ID: Integer read FID write SetID;
    property Descricao: String read FDescricao write SetDescricao;
  protected
    procedure ExecutarBusca; virtual;
    property CampoID: String read FCampoID write SetCampoID;
    property CampoDescricao: String read FCampoDescricao write SetCampoDescricao;
  end;

var
  frmPesquisaBase: TfrmPesquisaBase;

implementation

{$R *.dfm}

procedure TfrmPesquisaBase.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ID := 0;
  Descricao := '';
  Close;
end;

procedure TfrmPesquisaBase.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if dtsPesquisa.DataSet.RecordCount > 0 then
    begin
      ID := dtsPesquisa.DataSet.FieldByName(CampoID).AsInteger;
      Descricao := dtsPesquisa.DataSet.FieldByName(CampoDescricao).AsString;
      Close;
    end
  else
    MessageDlg('Nenhuma informação selecionada!', mtWarning, [mbOK], 0);
end;

procedure TfrmPesquisaBase.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  ExecutarBusca;
end;

procedure TfrmPesquisaBase.ExecutarBusca;
begin

end;

procedure TfrmPesquisaBase.FormCreate(Sender: TObject);
begin
  inherited;
  ID := 0;
  dtsPesquisa.DataSet.Open;
end;

procedure TfrmPesquisaBase.SetCampoDescricao(const Value: String);
begin
  FCampoDescricao := Value;
end;

procedure TfrmPesquisaBase.SetCampoID(const Value: String);
begin
  FCampoID := Value;
end;

procedure TfrmPesquisaBase.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TfrmPesquisaBase.SetID(const Value: Integer);
begin
  FID := Value;
end;

end.
