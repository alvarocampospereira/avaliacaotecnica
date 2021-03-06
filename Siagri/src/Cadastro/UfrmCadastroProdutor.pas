unit UfrmCadastroProdutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadastroBase, DB, Grids, DBGrids, ComCtrls, DBCtrls, Buttons,
  ExtCtrls, udtmProdutor, StdCtrls, Mask, UdtmProdutorDistribuidorLimite;

type
  TfrmCadastroProdutor = class(TfrmCadastroBase)
    lblCodigo: TLabel;
    lblNomeProdutor: TLabel;
    lblValorVenda: TLabel;
    edtCodigo: TDBEdit;
    edtNomeProdutor: TDBEdit;
    edtCnpjCpf: TDBEdit;
    GroupBox1: TGroupBox;
    btnExcluirDistribuidor: TSpeedButton;
    btnInserirDistribuidor: TSpeedButton;
    grdDistribuidorLimite: TDBGrid;
    dtsDistribuidorLimite: TDataSource;
    procedure btnExcluirDistribuidorClick(Sender: TObject);
    procedure dtsCadastroDataChange(Sender: TObject; Field: TField);
    procedure btnInserirClick(Sender: TObject);
    procedure btnInserirDistribuidorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FProdutor: TdtmProdutor;
    FProdutorDistribuidorLimite: TdtmProdutorDistribuidorLimite;
  public
    { Public declarations }
  end;

var
  frmCadastroProdutor: TfrmCadastroProdutor;

implementation

uses UfrmInformarLimiteDistribuidor;

{$R *.dfm}

procedure TfrmCadastroProdutor.btnExcluirDistribuidorClick(Sender: TObject);
begin
  inherited;
  FProdutorDistribuidorLimite.ExcluirDistribuidorLimite(dtsDistribuidorLimite.DataSet.FieldByName('ID_LIMITE').AsInteger);
  FProdutorDistribuidorLimite.buscarDistribuidorProdutor(dtsCadastro.DataSet.FieldByName('ID_PRODUTOR').AsInteger);
end;

procedure TfrmCadastroProdutor.btnInserirClick(Sender: TObject);
begin
  inherited;
  edtNomeProdutor.SetFocus;
end;

procedure TfrmCadastroProdutor.btnInserirDistribuidorClick(Sender: TObject);
begin
  inherited;
  if dtsCadastro.State in [dsInsert, dsEdit] then
    dtsCadastro.DataSet.Post;

  frmInformarLimiteDistribuidor := TfrmInformarLimiteDistribuidor.Create(Self);
  frmInformarLimiteDistribuidor.ShowModal;
  if frmInformarLimiteDistribuidor.ID_Distribuidor > 0 then
    begin
      FProdutorDistribuidorLimite.InserirDistribuidorLimite(frmInformarLimiteDistribuidor.ID_Distribuidor,
        dtsCadastro.DataSet.FieldByName('ID_PRODUTOR').AsInteger, frmInformarLimiteDistribuidor.ValorLimite);
    end;
  frmInformarLimiteDistribuidor.Free;

  FProdutorDistribuidorLimite.buscarDistribuidorProdutor(dtsCadastro.DataSet.FieldByName('ID_PRODUTOR').AsInteger);
end;

procedure TfrmCadastroProdutor.dtsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (dtsCadastro.DataSet <> nil) and (dtsCadastro.DataSet.FieldByName('ID_PRODUTOR').AsInteger > 0) then
    FProdutorDistribuidorLimite.buscarDistribuidorProdutor(dtsCadastro.DataSet.FieldByName('ID_PRODUTOR').AsInteger)
  else
    FProdutorDistribuidorLimite.buscarDistribuidorProdutor(-1);  
end;

procedure TfrmCadastroProdutor.FormCreate(Sender: TObject);
begin
  FProdutor := TdtmProdutor.Create(Self);
  dtsCadastro.DataSet := FProdutor.cdsProdutor;

  FProdutorDistribuidorLimite := TdtmProdutorDistribuidorLimite.Create(Self);
  dtsDistribuidorLimite.DataSet := FProdutorDistribuidorLimite.cdsLimiteDistr;
  FProdutorDistribuidorLimite.cdsLimite.Open;
  FProdutorDistribuidorLimite.cdsLimiteDistr.Open;
  inherited;

end;

procedure TfrmCadastroProdutor.FormDestroy(Sender: TObject);
begin
  inherited;
  FProdutor.Free;
end;

end.
