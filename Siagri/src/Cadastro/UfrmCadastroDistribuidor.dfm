inherited frmCadastroDistribuidor: TfrmCadastroDistribuidor
  Caption = 'Cadastro de Distribuidor'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
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
      object lblNomeDistribuidor: TLabel
        Left = 20
        Top = 52
        Width = 101
        Height = 13
        Caption = 'Nome Distribuidor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCnpj: TLabel
        Left = 20
        Top = 97
        Width = 25
        Height = 13
        Caption = 'Cnpj'
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
        DataField = 'ID_DISTRIBUIDOR'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edtNomeDistribuidor: TDBEdit
        Left = 20
        Top = 68
        Width = 301
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOMEDISTRIBUIDOR'
        DataSource = dtsCadastro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edtCnpjDistribuidor: TDBEdit
        Left = 20
        Top = 114
        Width = 141
        Height = 21
        DataField = 'CNPJDISTRUIBUIDOR'
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
    DataSet = dtmDistribuidor.cdsDistribuidor
  end
end
