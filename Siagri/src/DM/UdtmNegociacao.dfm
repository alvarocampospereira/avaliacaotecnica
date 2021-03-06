object dtmNegociacao: TdtmNegociacao
  OldCreateOrder = False
  Height = 319
  Width = 367
  object sdsNegociacao: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM NEGOCIACAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmPrincipal.cntConexao
    Left = 40
    Top = 32
    object sdsNegociacaoID_NEGOCIACAO: TIntegerField
      FieldName = 'ID_NEGOCIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsNegociacaoID_PRODUTOR: TIntegerField
      FieldName = 'ID_PRODUTOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsNegociacaoID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsNegociacaoSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object sdsNegociacaoDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNegociacaoDATAAPROVACAO: TDateField
      FieldName = 'DATAAPROVACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNegociacaoDATACONCLUSAO: TDateField
      FieldName = 'DATACONCLUSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNegociacaoDATACANCELAMENTO: TDateField
      FieldName = 'DATACANCELAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNegociacaoVALORTOTAL: TFMTBCDField
      FieldName = 'VALORTOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object sdsNegociacaoCODIGOCONTRATO: TIntegerField
      FieldName = 'CODIGOCONTRATO'
    end
  end
  object dspNegociacao: TDataSetProvider
    DataSet = sdsNegociacao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 104
  end
  object cdsNegociacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNegociacao'
    AfterInsert = cdsNegociacaoAfterInsert
    BeforePost = cdsNegociacaoBeforePost
    OnCalcFields = cdsNegociacaoCalcFields
    Left = 40
    Top = 168
    object cdsNegociacaoID_NEGOCIACAO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_NEGOCIACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsNegociacaoID_PRODUTOR: TIntegerField
      DisplayLabel = 'C'#243'd Produtor'
      FieldName = 'ID_PRODUTOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNegociacaoID_DISTRIBUIDOR: TIntegerField
      DisplayLabel = 'C'#243'd Distribuidor'
      FieldName = 'ID_DISTRIBUIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNegociacaoSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsNegociacaoDescricaoStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkCalculated
      FieldName = 'DescricaoStatus'
      Calculated = True
    end
    object cdsNegociacaoDATACADASTRO: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNegociacaoDATAAPROVACAO: TDateField
      DisplayLabel = 'Data Aprova'#231#227'o'
      FieldName = 'DATAAPROVACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNegociacaoDATACONCLUSAO: TDateField
      DisplayLabel = 'Data Conclus'#227'o'
      FieldName = 'DATACONCLUSAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNegociacaoDATACANCELAMENTO: TDateField
      DisplayLabel = 'Data Cancelamento'
      FieldName = 'DATACANCELAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNegociacaoVALORTOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALORTOTAL'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsNegociacaoVALORTOTALGetText
      Precision = 15
      Size = 2
    end
    object cdsNegociacaoCODIGOCONTRATO: TIntegerField
      DisplayLabel = 'C'#243'd Contrato'
      FieldName = 'CODIGOCONTRATO'
    end
  end
  object sdsConsultaNeg: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT NEGOCIACAO.status, NEGOCIACAO.id_produtor, PRODUTOR.nomep' +
      'rodutor,'#13#10' NEGOCIACAO.id_distribuidor, DISTRIBUIDOR.nomedistribu' +
      'idor,'#13#10' NEGOCIACAO.datacadastro, NEGOCIACAO.valortotal, NEGOCIAC' +
      'AO.dataaprovacao,'#13#10' NEGOCIACAO.dataconclusao, NEGOCIACAO.datacan' +
      'celamento, negociacao.codigocontrato'#13#10'FROM NEGOCIACAO, DISTRIBUI' +
      'DOR, PRODUTOR'#13#10'WHERE NEGOCIACAO.id_distribuidor = DISTRIBUIDOR.i' +
      'd_distribuidor'#13#10'  AND NEGOCIACAO.id_produtor = PRODUTOR.id_produ' +
      'tor'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmPrincipal.cntConexao
    Left = 160
    Top = 32
    object sdsConsultaNegSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object sdsConsultaNegID_PRODUTOR: TIntegerField
      FieldName = 'ID_PRODUTOR'
      Required = True
    end
    object sdsConsultaNegNOMEPRODUTOR: TStringField
      FieldName = 'NOMEPRODUTOR'
      Size = 50
    end
    object sdsConsultaNegID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      Required = True
    end
    object sdsConsultaNegNOMEDISTRIBUIDOR: TStringField
      FieldName = 'NOMEDISTRIBUIDOR'
      Size = 50
    end
    object sdsConsultaNegDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
    end
    object sdsConsultaNegVALORTOTAL: TFMTBCDField
      FieldName = 'VALORTOTAL'
      Precision = 15
      Size = 2
    end
    object sdsConsultaNegDATAAPROVACAO: TDateField
      FieldName = 'DATAAPROVACAO'
    end
    object sdsConsultaNegDATACONCLUSAO: TDateField
      FieldName = 'DATACONCLUSAO'
    end
    object sdsConsultaNegDATACANCELAMENTO: TDateField
      FieldName = 'DATACANCELAMENTO'
    end
    object sdsConsultaNegCODIGOCONTRATO: TIntegerField
      FieldName = 'CODIGOCONTRATO'
    end
  end
  object dspConsultaNeg: TDataSetProvider
    DataSet = sdsConsultaNeg
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 104
  end
  object cdsConsultaNeg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaNeg'
    OnCalcFields = cdsConsultaNegCalcFields
    Left = 160
    Top = 168
    object cdsConsultaNegID_PRODUTOR: TIntegerField
      DisplayLabel = 'C'#243'd Produtor'
      FieldName = 'ID_PRODUTOR'
      Required = True
    end
    object cdsConsultaNegNOMEPRODUTOR: TStringField
      DisplayLabel = 'Nome Produtor'
      FieldName = 'NOMEPRODUTOR'
      Size = 50
    end
    object cdsConsultaNegID_DISTRIBUIDOR: TIntegerField
      DisplayLabel = 'C'#243'd Distribuidor'
      FieldName = 'ID_DISTRIBUIDOR'
      Required = True
    end
    object cdsConsultaNegNOMEDISTRIBUIDOR: TStringField
      DisplayLabel = 'Nome Distribuidor'
      FieldName = 'NOMEDISTRIBUIDOR'
      Size = 50
    end
    object cdsConsultaNegCODIGOCONTRATO: TIntegerField
      DisplayLabel = 'C'#243'd Contrato'
      FieldName = 'CODIGOCONTRATO'
    end
    object cdsConsultaNegDescricaoStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkCalculated
      FieldName = 'DescricaoStatus'
      Calculated = True
    end
    object cdsConsultaNegDATACADASTRO: TDateField
      DisplayLabel = 'Data Cadatro'
      FieldName = 'DATACADASTRO'
    end
    object cdsConsultaNegVALORTOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALORTOTAL'
      OnGetText = cdsConsultaNegVALORTOTALGetText
      Precision = 15
      Size = 2
    end
    object cdsConsultaNegDATAAPROVACAO: TDateField
      DisplayLabel = 'Data Aprova'#231#227'o'
      FieldName = 'DATAAPROVACAO'
    end
    object cdsConsultaNegDATACONCLUSAO: TDateField
      DisplayLabel = 'Data Conclus'#227'o'
      FieldName = 'DATACONCLUSAO'
    end
    object cdsConsultaNegDATACANCELAMENTO: TDateField
      DisplayLabel = 'Data Cancelamento'
      FieldName = 'DATACANCELAMENTO'
    end
    object cdsConsultaNegSTATUS: TStringField
      FieldName = 'STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
