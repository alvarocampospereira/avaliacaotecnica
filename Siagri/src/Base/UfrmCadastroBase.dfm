inherited frmCadastroBase: TfrmCadastroBase
  Caption = 'frmCadastroBase'
  ClientHeight = 345
  ClientWidth = 577
  OnCreate = FormCreate
  ExplicitWidth = 593
  ExplicitHeight = 384
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 49
    Align = alTop
    TabOrder = 0
    object btnInserir: TSpeedButton
      Left = 5
      Top = 10
      Width = 60
      Height = 33
      Caption = 'Inserir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnInserirClick
    end
    object btnSalvar: TSpeedButton
      Left = 66
      Top = 10
      Width = 60
      Height = 33
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSalvarClick
    end
    object btnCancelar: TSpeedButton
      Left = 128
      Top = 10
      Width = 60
      Height = 33
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
    end
    object btnExcluir: TSpeedButton
      Left = 190
      Top = 10
      Width = 60
      Height = 33
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnExcluirClick
    end
    object btnAlternar: TSpeedButton
      Left = 258
      Top = 10
      Width = 60
      Height = 33
      Caption = 'Lista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnAlternarClick
    end
    object DBNavigator1: TDBNavigator
      Left = 330
      Top = 15
      Width = 224
      Height = 25
      DataSource = dtsCadastro
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        'Primeiro Registro'
        'Registro Anterior'
        'Pr'#243'ximo Registro'
        #218'ltimo Registro')
      TabOrder = 0
    end
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 49
    Width = 577
    Height = 296
    ActivePage = tbsCadastro
    Align = alClient
    TabOrder = 1
    object tbsCadastro: TTabSheet
      Caption = 'tbsCadastro'
    end
    object tbsLista: TTabSheet
      Caption = 'tbsLista'
      ImageIndex = 1
      object grdListaCadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 569
        Height = 268
        Align = alClient
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
      end
    end
  end
  object dtsCadastro: TDataSource
    OnStateChange = dtsCadastroStateChange
    Left = 312
    Top = 80
  end
end
