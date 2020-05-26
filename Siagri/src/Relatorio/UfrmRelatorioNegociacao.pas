unit UfrmRelatorioNegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, activex, StdCtrls, Buttons ;

type
  TfrmRelatorioNegociacao = class(TForm)
    WebBrowser: TWebBrowser;
    Panel1: TPanel;
    btnImprimir: TBitBtn;
    btnFechar: TBitBtn;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setarHtml(sHtml: TStringList);
  end;

var
  frmRelatorioNegociacao: TfrmRelatorioNegociacao;

implementation

{$R *.dfm}

{ TfrmRelatorioNegociacao }

procedure TfrmRelatorioNegociacao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioNegociacao.btnImprimirClick(Sender: TObject);
var
  vIn, vOut: OleVariant;
begin
  WebBrowser.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
end;

procedure TfrmRelatorioNegociacao.setarHtml(sHtml: TStringList);
var
   ms: TMemoryStream;
begin
   WebBrowser.Navigate('about:blank') ;
   while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

   if Assigned(WebBrowser.Document) then
   begin

     try
       ms := TMemoryStream.Create;
       try
         sHtml.SaveToStream(ms);
         ms.Seek(0, 0) ;
         (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms)) ;
       finally
         ms.Free;
       end;
     finally

     end;
   end;
end;

end.
