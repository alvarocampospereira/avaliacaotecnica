inherited frmManutencaoNegociacao: TfrmManutencaoNegociacao
  Caption = 'Manuten'#231#227'o Negocia'#231#227'o'
  ClientHeight = 343
  ClientWidth = 515
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 531
  ExplicitHeight = 382
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 105
    Height = 13
    Caption = 'C'#243'digo Negocia'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblStatus: TLabel
    Left = 24
    Top = 64
    Width = 37
    Height = 13
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 175
    Top = 64
    Width = 81
    Height = 13
    Caption = 'Data Cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDistribuidor: TLabel
    Left = 24
    Top = 162
    Width = 66
    Height = 13
    Caption = 'Distribuidor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblProdutor: TLabel
    Left = 24
    Top = 111
    Width = 50
    Height = 13
    Caption = 'Produtor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorTotal: TLabel
    Left = 327
    Top = 64
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
  object edtNegociacao: TEdit
    Left = 24
    Top = 35
    Width = 105
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnExit = edtNegociacaoExit
  end
  object edtStatusAtual: TEdit
    Left = 24
    Top = 82
    Width = 121
    Height = 21
    TabStop = False
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = 'edtStatusAtual'
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 290
    Width = 515
    Height = 53
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 9
    ExplicitTop = 224
    object btnAlterarStatus: TBitBtn
      Left = 24
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Alterar Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAlterarStatusClick
    end
    object btnLimpar: TBitBtn
      Left = 200
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnLimparClick
    end
    object btnFechar: TBitBtn
      Left = 384
      Top = 16
      Width = 100
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnFecharClick
    end
  end
  object edtDataCadastro: TEdit
    Left = 175
    Top = 82
    Width = 121
    Height = 21
    TabStop = False
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = 'Edit1'
  end
  object edtNomeProdutor: TEdit
    Left = 92
    Top = 125
    Width = 356
    Height = 21
    TabStop = False
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = 'Edit1'
  end
  object edtNomeDistribuidor: TEdit
    Left = 88
    Top = 179
    Width = 360
    Height = 21
    TabStop = False
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Text = 'Edit1'
  end
  object edtCodProdutor: TEdit
    Left = 24
    Top = 125
    Width = 66
    Height = 21
    TabStop = False
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = 'edtCodProdutor'
  end
  object edtCodDistribuidor: TEdit
    Left = 24
    Top = 179
    Width = 66
    Height = 21
    TabStop = False
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = 'Edit1'
  end
  object edtValorTotal: TEdit
    Left = 327
    Top = 82
    Width = 121
    Height = 21
    TabStop = False
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = 'Edit1'
  end
  object rgpNovoStatus: TRadioGroup
    Left = 32
    Top = 216
    Width = 385
    Height = 57
    Caption = 'Novo Status'
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      'Aprovada'
      'Concluida'
      'Cancelada')
    ParentFont = False
    TabOrder = 8
  end
end
