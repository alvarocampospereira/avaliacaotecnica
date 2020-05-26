inherited frmCadastroProduto: TfrmCadastroProduto
  Caption = 'Cadastro de Produto'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMenu: TPanel
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = -15
      ExplicitTop = -8
      ExplicitWidth = 569
      ExplicitHeight = 268
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
        Width = 80
        Height = 13
        Caption = 'Nome Produto'
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
        Width = 67
        Height = 13
        Caption = 'Valor Venda'
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
        DataField = 'ID_PRODUTO'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edtNomeProduto: TDBEdit
        Left = 20
        Top = 68
        Width = 301
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOMEPRODUTO'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edtValorVenda: TDBEdit
        Left = 20
        Top = 114
        Width = 101
        Height = 21
        DataField = 'VALORVENDA'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    inherited tbsLista: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 569
      ExplicitHeight = 268
    end
  end
  inherited dtsCadastro: TDataSource
    DataSet = dtmProduto.cdsProduto
  end
end
