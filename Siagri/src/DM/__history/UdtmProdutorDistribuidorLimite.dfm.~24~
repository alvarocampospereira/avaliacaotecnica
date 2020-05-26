object dtmProdutorDistribuidorLimite: TdtmProdutorDistribuidorLimite
  OldCreateOrder = False
  Height = 262
  Width = 307
  object sdsLimite: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM PRODUTORDISTRIBUIDORLIMITE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmPrincipal.cntConexao
    Left = 40
    Top = 32
    object sdsLimiteID_LIMITE: TIntegerField
      FieldName = 'ID_LIMITE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsLimiteID_PRODUTOR: TIntegerField
      FieldName = 'ID_PRODUTOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsLimiteID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsLimiteVALORLIMITE: TFMTBCDField
      FieldName = 'VALORLIMITE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
  end
  object dspLimite: TDataSetProvider
    DataSet = sdsLimite
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 104
  end
  object cdsLimite: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLimite'
    BeforePost = cdsLimiteBeforePost
    Left = 40
    Top = 168
    object cdsLimiteID_LIMITE: TIntegerField
      FieldName = 'ID_LIMITE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsLimiteID_PRODUTOR: TIntegerField
      FieldName = 'ID_PRODUTOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLimiteID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLimiteVALORLIMITE: TFMTBCDField
      FieldName = 'VALORLIMITE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
  end
  object cdsLimiteDistr: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPRODUTOR'
        ParamType = ptInput
      end>
    ProviderName = 'dspLimiteDistr'
    Left = 136
    Top = 168
    object cdsLimiteDistrID_DISTRIBUIDOR: TIntegerField
      DisplayLabel = 'C'#243'd Distribuidor'
      FieldName = 'ID_DISTRIBUIDOR'
      Required = True
    end
    object cdsLimiteDistrNOMEDISTRIBUIDOR: TStringField
      DisplayLabel = 'Nome Distribuidor'
      FieldName = 'NOMEDISTRIBUIDOR'
      Size = 50
    end
    object cdsLimiteDistrID_LIMITE: TIntegerField
      FieldName = 'ID_LIMITE'
      Required = True
      Visible = False
    end
    object cdsLimiteDistrVALORLIMITE: TFMTBCDField
      DisplayLabel = 'Valor Limite'
      DisplayWidth = 13
      FieldName = 'VALORLIMITE'
      OnGetText = cdsLimiteDistrVALORLIMITEGetText
      Precision = 15
      Size = 2
    end
  end
  object sdsLimiteDistr: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select PRODUTORDISTRIBUIDORLIMITE.id_distribuidor, PRODUTORDISTR' +
      'IBUIDORLIMITE.VALORLIMITE, DISTRIBUIDOR.NOMEDISTRIBUIDOR, PRODUT' +
      'ORDISTRIBUIDORLIMITE.id_limite from DISTRIBUIDOR,PRODUTORDISTRIB' +
      'UIDORLIMITE WHERE DISTRIBUIDOR.id_distribuidor = PRODUTORDISTRIB' +
      'UIDORLIMITE.id_distribuidor AND PRODUTORDISTRIBUIDORLIMITE.id_pr' +
      'odutor = :IDPRODUTOR ORDER BY DISTRIBUIDOR.NOMEDISTRIBUIDOR'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPRODUTOR'
        ParamType = ptInput
      end>
    SQLConnection = dtmPrincipal.cntConexao
    Left = 136
    Top = 31
    object sdsLimiteDistrID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      Required = True
    end
    object sdsLimiteDistrNOMEDISTRIBUIDOR: TStringField
      FieldName = 'NOMEDISTRIBUIDOR'
      Size = 50
    end
    object sdsLimiteDistrVALORLIMITE: TFMTBCDField
      FieldName = 'VALORLIMITE'
      DisplayFormat = '#,##0.00'
      Precision = 15
      Size = 2
    end
    object sdsLimiteDistrID_LIMITE: TIntegerField
      FieldName = 'ID_LIMITE'
      Required = True
    end
  end
  object dspLimiteDistr: TDataSetProvider
    DataSet = sdsLimiteDistr
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 136
    Top = 107
  end
  object sdsObterLimite: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT PRODUTORDISTRIBUIDORLIMITE.valorlimite - (SELECT COALESCE' +
      '(SUM(NEGOCIACAO.valortotal),0) FROM NEGOCIACAO WHERE negociacao.' +
      'id_produtor = :IDPRODUTOR AND negociacao.id_distribuidor = :IDDI' +
      'STRIBUIDOR AND NEGOCIACAO.STATUS = '#39'A'#39') as VALORLIMITECALC'#13#10'FROM' +
      ' PRODUTORDISTRIBUIDORLIMITE WHERE PRODUTORDISTRIBUIDORLIMITE.id_' +
      'produtor = :IDPRODUTOR AND PRODUTORDISTRIBUIDORLIMITE.id_distrib' +
      'uidor = :IDDISTRIBUIDOR'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPRODUTOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDDISTRIBUIDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPRODUTOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDDISTRIBUIDOR'
        ParamType = ptInput
      end>
    SQLConnection = dtmPrincipal.cntConexao
    Left = 224
    Top = 32
    object sdsObterLimiteVALORLIMITECALC: TFMTBCDField
      FieldName = 'VALORLIMITECALC'
      Precision = 15
      Size = 2
    end
  end
  object dspObterLimite: TDataSetProvider
    DataSet = sdsObterLimite
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 225
    Top = 109
  end
  object cdsObterLimite: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPRODUTOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDDISTRIBUIDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPRODUTOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDDISTRIBUIDOR'
        ParamType = ptInput
      end>
    ProviderName = 'dspObterLimite'
    Left = 226
    Top = 168
    object cdsObterLimiteVALORLIMITECALC: TFMTBCDField
      FieldName = 'VALORLIMITECALC'
      Precision = 15
      Size = 2
    end
  end
end
