unit ufrmBaseChild;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TfrmBaseChild = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseChild: TfrmBaseChild;

implementation

{$R *.dfm}

procedure TfrmBaseChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBaseChild.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  begin
    key := #0;
    if (sender is TDBGrid) then
      TDBGrid(Sender).Perform(WM_KeyDown,VK_Tab,0)
    else
      Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
