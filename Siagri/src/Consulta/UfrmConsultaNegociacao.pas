unit UfrmConsultaNegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBaseChild, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  udtmNegociacao, DB;

type
  TfrmConsultaNegociacao = class(TfrmBaseChild)
    Label1: TLabel;
    btnPesquisarDistribuidor: TSpeedButton;
    edtCodigoDistribuidor: TEdit;
    edtNomeDistribuidor: TEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    edtCodigoProdutor: TEdit;
    edtNomeProdutor: TEdit;
    grdConsulta: TDBGrid;
    pnlBotoes: TPanel;
    btnConsultar: TBitBtn;
    btnLimpar: TBitBtn;
    BitBtn3: TBitBtn;
    btnImprimir: TBitBtn;
    dtsConsulta: TDataSource;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnPesquisarDistribuidorClick(Sender: TObject);
  private
    { Private declarations }
    FNegociacao: TdtmNegociacao;
    procedure Limpar;
    procedure imprimirConsulta;
    procedure Consultar;
  public
    { Public declarations }
  end;

var
  frmConsultaNegociacao: TfrmConsultaNegociacao;

implementation

uses UfrmPesquisaDistribuidor, UfrmPesquisaProdutor, UfrmRelatorioNegociacao;

{$R *.dfm}

procedure TfrmConsultaNegociacao.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultaNegociacao.btnConsultarClick(Sender: TObject);
begin
  inherited;
  Consultar;
end;

procedure TfrmConsultaNegociacao.btnImprimirClick(Sender: TObject);
begin
  inherited;
  imprimirConsulta;
end;

procedure TfrmConsultaNegociacao.btnLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmConsultaNegociacao.btnPesquisarDistribuidorClick(Sender: TObject);
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

procedure TfrmConsultaNegociacao.Consultar;
begin
  with FNegociacao.cdsConsultaNeg do
   begin
    Close;
    CommandText := 'SELECT NEGOCIACAO.status, NEGOCIACAO.id_produtor, PRODUTOR.nomeprodutor, ' +
      ' NEGOCIACAO.id_distribuidor, DISTRIBUIDOR.nomedistribuidor, ' +
      ' NEGOCIACAO.datacadastro, NEGOCIACAO.valortotal , NEGOCIACAO.dataaprovacao, ' +
      ' NEGOCIACAO.dataconclusao, NEGOCIACAO.datacancelamento, negociacao.codigocontrato ' +
      ' FROM NEGOCIACAO, DISTRIBUIDOR, PRODUTOR ' +
      ' WHERE NEGOCIACAO.id_distribuidor = DISTRIBUIDOR.id_distribuidor ' +
      '   AND NEGOCIACAO.id_produtor = PRODUTOR.id_produtor ';
    if trim(edtCodigoDistribuidor.Text) <> '' then
      CommandText := CommandText + ' AND NEGOCIACAO.id_distribuidor = ' + edtCodigoDistribuidor.Text;
    if Trim(edtCodigoProdutor.Text) <> '' then
      CommandText := CommandText + ' AND NEGOCIACAO.id_produtor = ' + edtCodigoProdutor.Text;
    Open;
    
   end;

end;

procedure TfrmConsultaNegociacao.FormCreate(Sender: TObject);
begin
  inherited;
  FNegociacao := TdtmNegociacao.Create(Self);
  dtsConsulta.DataSet := FNegociacao.cdsConsultaNeg;
end;

procedure TfrmConsultaNegociacao.FormDestroy(Sender: TObject);
begin
  inherited;
  FNegociacao.Free;
end;

procedure TfrmConsultaNegociacao.imprimirConsulta;
var sTexto: TStringList;
begin
  // gerar um html para servir de relatorio
  sTexto := TStringList.Create;
  sTexto.Add('<!DOCTYPE html>');
  sTexto.Add('<html>');
  sTexto.Add('<head>');
  sTexto.Add('<style>');
  sTexto.Add('table {');
  sTexto.Add('font-family: arial, sans-serif;');
  sTexto.Add('border-collapse: collapse;');
  sTexto.Add('width: 100%;}');
  sTexto.Add('td, th {');
  sTexto.Add('border: 1px solid #dddddd;');
  sTexto.Add('text-align: left;');
  sTexto.Add('padding: 8px;}');
  sTexto.Add('tr:nth-child(even) {');
  sTexto.Add('background-color: #F8F8FF;}');
  sTexto.Add('</style>');
  sTexto.Add('</head>');
  sTexto.Add('<body>');
  sTexto.Add('<h2>Relatório de Negociação</h2>');
  sTexto.Add('<table>');
  sTexto.Add('<tr>');
  sTexto.Add('  <th>Nome Produtor</th>');
  sTexto.Add('  <th>Nome Distribuidor</th>');
  sTexto.Add('  <th>Cód Contrato</th>');
  sTexto.Add('  <th>Data Cadastro</th>');
  sTexto.Add('  <th>Data Aprovação</th>');
  sTexto.Add('  <th>Data Conclusão</th>');
  sTexto.Add('  <th>Data Cancelamento</th>');
  sTexto.Add('  <th>Valor Total</th>');
  sTexto.Add('</tr>');
  with dtsConsulta.DataSet do
    begin
      First;
      while not EOF do
        begin
          sTexto.Add('<tr>');
          sTexto.Add('<td>' + FieldByName('nomeprodutor').AsString + '</td>');
          sTexto.Add('<td>' + FieldByName('nomedistribuidor').AsString + '</td>');
          sTexto.Add('<td>' + FieldByName('codigocontrato').AsString + '</td>');
          sTexto.Add('<td>' + FieldByName('datacadastro').AsString + '</td>');
          sTexto.Add('<td>' + FieldByName('dataaprovacao').AsString + '</td>');
          sTexto.Add('<td>' + FieldByName('dataconclusao').AsString + '</td>');
          sTexto.Add('<td>' + FieldByName('datacancelamento').AsString + '</td>');
          sTexto.Add('<td>' + FloatToStrF(FieldByName('valortotal').AsCurrency,ffNumber, 15,2) + '</td>');
          sTexto.Add('</tr>');
          Next;
        end;// while
    end; // with
  sTexto.Add('</table>');
  sTexto.Add('</body>');
  sTexto.Add('</html>');
  //stexto.SaveToFile(ExtractFilePath(ParamStr(0)) + 'meu_relatorio.html');

  frmRelatorioNegociacao := TfrmRelatorioNegociacao.Create(Self);
  frmRelatorioNegociacao.setarHtml(sTexto);
  frmRelatorioNegociacao.ShowModal;
  frmRelatorioNegociacao.Free;
  sTexto.free;
end;

procedure TfrmConsultaNegociacao.Limpar;
begin
  edtCodigoDistribuidor.Clear;
  edtNomeDistribuidor.Clear;
  edtCodigoProdutor.Clear;
  edtNomeProdutor.Clear;
  edtCodigoProdutor.SetFocus;
  dtsConsulta.DataSet.Close;
end;

procedure TfrmConsultaNegociacao.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  frmPesquisaProdutor := TfrmPesquisaProdutor.Create(Self);
  frmPesquisaProdutor.ShowModal;
  if frmPesquisaProdutor.ID > 0 then
    begin
      edtCodigoProdutor.Text := inttoStr(frmPesquisaProdutor.ID);
      edtNomeProdutor.Text := frmPesquisaProdutor.Descricao;
    end;
  frmPesquisaProdutor.Free;
end;

end.
