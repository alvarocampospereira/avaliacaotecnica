object dtmProdutor: TdtmProdutor
  OldCreateOrder = False
  Height = 250
  Width = 279
  object sdsProdutor: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM PRODUTOR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmPrincipal.cntConexao
    Left = 40
    Top = 32
    object sdsProdutorID_PRODUTOR: TIntegerField
      FieldName = 'ID_PRODUTOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsProdutorNOMEPRODUTOR: TStringField
      FieldName = 'NOMEPRODUTOR'
      Size = 50
    end
    object sdsProdutorCPFCNPJPRODUTOR: TStringField
      FieldName = 'CPFCNPJPRODUTOR'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
  end
  object dspProdutor: TDataSetProvider
    DataSet = sdsProdutor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 40
    Top = 104
  end
  object cdsProdutor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutor'
    BeforePost = cdsProdutorBeforePost
    Left = 40
    Top = 168
    object cdsProdutorID_PRODUTOR: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_PRODUTOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsProdutorNOMEPRODUTOR: TStringField
      DisplayLabel = 'Nome Produtor'
      FieldName = 'NOMEPRODUTOR'
      Size = 50
    end
    object cdsProdutorCPFCNPJPRODUTOR: TStringField
      DisplayLabel = 'Cnpj/Cpf'
      FieldName = 'CPFCNPJPRODUTOR'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
  end
end
