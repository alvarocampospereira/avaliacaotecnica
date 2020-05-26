object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 472
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 312
    Top = 192
    object mniCadastro: TMenuItem
      Caption = 'Cadastro'
      object mniProdutor: TMenuItem
        Caption = 'Produtor'
        OnClick = mniProdutorClick
      end
      object mniDistribuidor: TMenuItem
        Caption = 'Distribuidor'
        OnClick = mniDistribuidorClick
      end
      object mniProduto: TMenuItem
        Caption = 'Produto'
        OnClick = mniProdutoClick
      end
    end
    object mniMovimentao: TMenuItem
      Caption = 'Negocia'#231#227'o'
      object mniCadastroNegociacao: TMenuItem
        Caption = 'Cadastro'
        OnClick = mniCadastroNegociacaoClick
      end
      object mniManutencaoNegociacao: TMenuItem
        Caption = 'Manuten'#231#227'o'
        OnClick = mniManutencaoNegociacaoClick
      end
    end
    object mniConsulta: TMenuItem
      Caption = 'Consulta'
      object mnConsultaiNegociacao: TMenuItem
        Caption = 'Negocia'#231#227'o'
        OnClick = mnConsultaiNegociacaoClick
      end
    end
  end
end
