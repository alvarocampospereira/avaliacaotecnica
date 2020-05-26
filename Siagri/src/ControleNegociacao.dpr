program ControleNegociacao;

uses
  Forms,
  UfrmMenuPrincipal in 'UfrmMenuPrincipal.pas' {frmMenuPrincipal},
  ufrmBaseChild in 'Base\ufrmBaseChild.pas' {frmBaseChild},
  UfrmCadastroBase in 'Base\UfrmCadastroBase.pas' {frmCadastroBase},
  UfrmCadastroProduto in 'Cadastro\UfrmCadastroProduto.pas' {frmCadastroProduto},
  UfrmCadastroDistribuidor in 'Cadastro\UfrmCadastroDistribuidor.pas' {frmCadastroDistribuidor},
  UdtmPrincipal in 'DM\UdtmPrincipal.pas' {dtmPrincipal: TDataModule},
  UdtmProduto in 'DM\UdtmProduto.pas' {dtmProduto: TDataModule},
  UfrmCadastroProdutor in 'Cadastro\UfrmCadastroProdutor.pas' {frmCadastroProdutor},
  UdtmProdutor in 'DM\UdtmProdutor.pas' {dtmProdutor: TDataModule},
  UdtmDistribuidor in 'DM\UdtmDistribuidor.pas' {dtmDistribuidor: TDataModule},
  UdtmNegociacao in 'DM\UdtmNegociacao.pas' {dtmNegociacao: TDataModule},
  UdtmProdutorDistribuidorLimite in 'DM\UdtmProdutorDistribuidorLimite.pas' {dtmProdutorDistribuidorLimite: TDataModule},
  UfrmBaseModal in 'Base\UfrmBaseModal.pas' {frmBaseModal},
  UfrmInformarLimiteDistribuidor in 'Cadastro\UfrmInformarLimiteDistribuidor.pas' {frmInformarLimiteDistribuidor},
  UfrmPesquisaBase in 'Base\UfrmPesquisaBase.pas' {frmPesquisaBase},
  UfrmPesquisaDistribuidor in 'Pesquisa\UfrmPesquisaDistribuidor.pas' {frmPesquisaDistribuidor},
  UfrmCadastroNegociacao in 'Cadastro\UfrmCadastroNegociacao.pas' {frmCadastroNegociacao},
  UdtmNegociacaoProduto in 'DM\UdtmNegociacaoProduto.pas' {dtmNegociacaoProduto: TDataModule},
  UfrmPesquisaProdutor in 'Pesquisa\UfrmPesquisaProdutor.pas' {frmPesquisaProdutor},
  UfrmPesquisaProduto in 'Pesquisa\UfrmPesquisaProduto.pas' {frmPesquisaProduto},
  UfrmInformarProdutoNegociacao in 'Cadastro\UfrmInformarProdutoNegociacao.pas' {frmInformarProdutoNegociacao},
  UfrmManutencaoNegociacao in 'Cadastro\UfrmManutencaoNegociacao.pas' {frmManutencaoNegociacao},
  UfrmConsultaNegociacao in 'Consulta\UfrmConsultaNegociacao.pas' {frmConsultaNegociacao},
  UfrmRelatorioNegociacao in 'Relatorio\UfrmRelatorioNegociacao.pas' {frmRelatorioNegociacao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.Run;
end.
