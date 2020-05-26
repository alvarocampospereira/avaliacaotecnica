unit UfrmInformarLimiteDistribuidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmBaseModal, StdCtrls, Buttons, ExtCtrls;

type
  TfrmInformarLimiteDistribuidor = class(TfrmBaseModal)
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    edtCodigoDistribuidor: TEdit;
    edtNomeDistribuidor: TEdit;
    btnPesquisarDistribuidor: TSpeedButton;
    edtLimite: TEdit;
    procedure edtCodigoDistribuidorExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtLimiteExit(Sender: TObject);
    procedure btnPesquisarDistribuidorClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FID_Distribuidor: Integer;
    FValorLimite: Currency;
    procedure SetID_Distribuidor(const Value: Integer);
    procedure SetValorLimite(const Value: Currency);
    { Private declarations }
  public
    { Public declarations }
    property ID_Distribuidor: Integer read FID_Distribuidor write SetID_Distribuidor;
    property ValorLimite: Currency read FValorLimite write SetValorLimite;
  end;

var
  frmInformarLimiteDistribuidor: TfrmInformarLimiteDistribuidor;

implementation

uses UfrmPesquisaDistribuidor;

{$R *.dfm}

procedure TfrmInformarLimiteDistribuidor.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmInformarLimiteDistribuidor.btnConfirmarClick(Sender: TObject);
var cVal: Currency;
begin
  inherited;
  if Trim(edtCodigoDistribuidor.Text) = '' then
    raise exception.Create('Distribuidor não informado!');
  cVal := StrToFloat(edtLimite.Text);
  if cVal = 0 then
    raise exception.Create('Valor limite não informado!');
  ID_Distribuidor := StrToInt(edtCodigoDistribuidor.Text);
  ValorLimite := cVal;

  Close;
end;

procedure TfrmInformarLimiteDistribuidor.btnPesquisarDistribuidorClick(Sender: TObject);
begin
  inherited;
  frmPesquisaDistribuidor := TfrmPesquisaDistribuidor.Create(Self);
  frmPesquisaDistribuidor.ShowModal;
  if frmPesquisaDistribuidor.ID > 0 then
    begin
      edtCodigoDistribuidor.Text := inttoStr(frmPesquisaDistribuidor.ID);
      edtNomeDistribuidor.Text := frmPesquisaDistribuidor.Descricao;
    end;
  frmPesquisaDistribuidor.Free;
end;

procedure TfrmInformarLimiteDistribuidor.edtCodigoDistribuidorExit(
  Sender: TObject);
begin
  inherited;
  if Trim(edtCodigoDistribuidor.Text) <> '' then
    begin

    end
  else
    edtNomeDistribuidor.Clear;  
end;

procedure TfrmInformarLimiteDistribuidor.edtLimiteExit(Sender: TObject);
begin
  inherited;
  Try
    TEdit(Sender).Text := StringReplace(TEdit(Sender).Text, '.', '', [rfReplaceAll]);
    {Verificar se é uma valor numerico}
    StrToFloat(TEdit(Sender).Text);

    TEdit(Sender).Text := FormatFloat('0.00', StrToFloat(TEdit(Sender).Text));
 Except on EConvertError do
    TEdit(Sender).Text := '0,00';
 End;
end;

procedure TfrmInformarLimiteDistribuidor.FormCreate(Sender: TObject);
begin
  inherited;
  ID_Distribuidor := 0;
end;

procedure TfrmInformarLimiteDistribuidor.SetID_Distribuidor(
  const Value: Integer);
begin
  FID_Distribuidor := Value;
end;

procedure TfrmInformarLimiteDistribuidor.SetValorLimite(const Value: Currency);
begin
  FValorLimite := Value;
end;

end.
