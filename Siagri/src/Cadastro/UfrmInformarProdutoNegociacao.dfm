inherited frmInformarProdutoNegociacao: TfrmInformarProdutoNegociacao
  Caption = 'Informar Produto Negocia'#231#227'o'
  OnShow = FormShow
  ExplicitWidth = 463
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 45
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblQuantidade: TLabel
    Left = 24
    Top = 66
    Width = 65
    Height = 13
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnPesquisarProduto: TSpeedButton
    Left = 93
    Top = 31
    Width = 23
    Height = 22
    Hint = 'Pesquisa Produto'
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    OnClick = btnPesquisarProdutoClick
  end
  object lblValorUnitario: TLabel
    Left = 167
    Top = 66
    Width = 80
    Height = 13
    Caption = 'Valor Unit'#225'rio '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorTotal: TLabel
    Left = 305
    Top = 66
    Width = 61
    Height = 13
    Caption = 'Valor Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 160
    Width = 447
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 5
    ExplicitLeft = -28
    ExplicitTop = 128
    ExplicitWidth = 475
    object btnConfirmar: TBitBtn
      Left = 56
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TBitBtn
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object edtCodigoProduto: TEdit
    Left = 24
    Top = 32
    Width = 66
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object edtNomeProduto: TEdit
    Left = 120
    Top = 32
    Width = 283
    Height = 21
    TabStop = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object edtQuantidade: TEdit
    Left = 24
    Top = 82
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = '0,00'
    OnExit = edtQuantidadeExit
  end
  object edtValorUnitario: TEdit
    Left = 167
    Top = 82
    Width = 98
    Height = 21
    TabStop = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object edtValorTotal: TEdit
    Left = 305
    Top = 82
    Width = 98
    Height = 21
    TabStop = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
end
