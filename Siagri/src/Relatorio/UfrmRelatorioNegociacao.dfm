object frmRelatorioNegociacao: TfrmRelatorioNegociacao
  Left = 0
  Top = 0
  Caption = 'Relatorio Negocia'#231#227'o'
  ClientHeight = 423
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser: TWebBrowser
    Left = 0
    Top = 34
    Width = 571
    Height = 389
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 40
    ExplicitWidth = 481
    ExplicitHeight = 353
    ControlData = {
      4C000000043B0000342800000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 571
    Height = 34
    Align = alTop
    TabOrder = 1
    object btnImprimir: TBitBtn
      Left = 21
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 0
      OnClick = btnImprimirClick
    end
    object btnFechar: TBitBtn
      Left = 471
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btnFecharClick
    end
  end
end
