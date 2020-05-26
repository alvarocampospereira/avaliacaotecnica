inherited frmCadastroNegociacao: TfrmCadastroNegociacao
  Caption = 'Cadastro Negocia'#231#227'o'
  ClientHeight = 411
  ClientWidth = 707
  OnDestroy = FormDestroy
  ExplicitWidth = 723
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMenu: TPanel
    Width = 707
    ExplicitWidth = 707
  end
  inherited pgcPrincipal: TPageControl
    Width = 707
    Height = 362
    ExplicitWidth = 707
    ExplicitHeight = 362
    inherited tbsCadastro: TTabSheet
      ExplicitWidth = 699
      ExplicitHeight = 334
      object lblCodigo: TLabel
        Left = 20
        Top = 6
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeProduto: TLabel
        Left = 20
        Top = 52
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
      object lblValorVenda: TLabel
        Left = 20
        Top = 97
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
      object btnPesquisaProdutor: TSpeedButton
        Left = 93
        Top = 67
        Width = 23
        Height = 22
        Hint = 'Pesquisa Produtor'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnPesquisaProdutorClick
      end
      object btnDistribuidor: TSpeedButton
        Left = 94
        Top = 113
        Width = 23
        Height = 22
        Hint = 'Pesquisa Distribuidor'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnDistribuidorClick
      end
      object Label1: TLabel
        Left = 123
        Top = 6
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
      object Label2: TLabel
        Left = 228
        Top = 6
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
      object Label3: TLabel
        Left = 448
        Top = 97
        Width = 96
        Height = 13
        Caption = 'Total Negocia'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCodigoContrato: TLabel
        Left = 448
        Top = 6
        Width = 91
        Height = 13
        Caption = 'C'#243'digo Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodigo: TDBEdit
        Left = 20
        Top = 22
        Width = 77
        Height = 21
        DataField = 'ID_NEGOCIACAO'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edtNomeProdutor: TDBEdit
        Left = 123
        Top = 68
        Width = 285
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        DataField = 'NOMEPRODUTOR'
        DataSource = dtsProdutor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object edtCodigoDistribuidor: TDBEdit
        Left = 20
        Top = 114
        Width = 70
        Height = 21
        DataField = 'ID_DISTRIBUIDOR'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object edtCodigoProdutor: TDBEdit
        Left = 21
        Top = 68
        Width = 69
        Height = 21
        DataField = 'ID_PRODUTOR'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object edtNomeDistribuidor: TDBEdit
        Left = 124
        Top = 114
        Width = 285
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        DataField = 'NOMEDISTRIBUIDOR'
        DataSource = dtsDistribuidor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object edtStatus: TDBEdit
        Left = 123
        Top = 22
        Width = 95
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'DescricaoStatus'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edtDataCadastro: TDBEdit
        Left = 228
        Top = 22
        Width = 95
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'DATACADASTRO'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 152
        Width = 699
        Height = 182
        Align = alBottom
        Caption = 'Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        object btnInserirProduto: TBitBtn
          Left = 14
          Top = 17
          Width = 100
          Height = 25
          Caption = 'Inserir Produto'
          TabOrder = 0
          OnClick = btnInserirProdutoClick
        end
        object btnExcluirProduto: TBitBtn
          Left = 143
          Top = 17
          Width = 100
          Height = 25
          Caption = 'Excluir Produto'
          TabOrder = 1
          OnClick = btnExcluirProdutoClick
        end
        object grdProdutos: TDBGrid
          Left = 2
          Top = 51
          Width = 695
          Height = 129
          Align = alBottom
          DataSource = dtsProdutos
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
        end
      end
      object edtTotalNegociacao: TDBEdit
        Left = 448
        Top = 114
        Width = 95
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'VALORTOTAL'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
      end
      object edtCodigoContrato: TDBEdit
        Left = 448
        Top = 22
        Width = 96
        Height = 21
        DataField = 'CODIGOCONTRATO'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
    end
    inherited tbsLista: TTabSheet
      ExplicitWidth = 699
      ExplicitHeight = 334
      inherited grdListaCadastro: TDBGrid
        Width = 699
        Height = 334
      end
    end
  end
  inherited dtsCadastro: TDataSource
    OnDataChange = dtsCadastroDataChange
  end
  object dtsProdutos: TDataSource
    Left = 392
    Top = 224
  end
  object dtsProdutor: TDataSource
    Left = 568
    Top = 128
  end
  object dtsDistribuidor: TDataSource
    Left = 456
    Top = 136
  end
end
