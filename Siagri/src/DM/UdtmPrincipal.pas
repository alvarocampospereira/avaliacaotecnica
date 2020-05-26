unit UdtmPrincipal;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, inifiles, FMTBcd;

type
  TdtmPrincipal = class(TDataModule)
    cntConexao: TSQLConnection;
    qryObterGen: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CnpjValido(sCnpj: String): Boolean;
    function CpfValido(sCpf: String): Boolean;
    function ObterGenID(sGenerator: String): Integer;
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{$R *.dfm}

function TdtmPrincipal.CnpjValido(sCnpj: String): Boolean;
var   dig13, dig14: string;
    sm, i, r, peso: integer;
begin
  // função obtica em: https://www.devmedia.com.br/validando-o-cnpj-em-uma-aplicacao-delphi/22372
  if ((sCnpj = '00000000000000') or (sCnpj = '11111111111111') or
      (sCnpj = '22222222222222') or (sCnpj = '33333333333333') or
      (sCnpj = '44444444444444') or (sCnpj = '55555555555555') or
      (sCnpj = '66666666666666') or (sCnpj = '77777777777777') or
      (sCnpj = '88888888888888') or (sCnpj = '99999999999999') or
      (length(sCnpj) <> 14))
     then begin
            CnpjValido := false;
            exit;
          end;
  try
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
// StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(sCnpj[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig13 := '0'
    else str((11-r):1, dig13); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(sCnpj[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig14 := '0'
    else str((11-r):1, dig14);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = sCnpj[13]) and (dig14 = sCnpj[14]))
       then CnpjValido := true
    else CnpjValido := false;
  except
    CnpjValido := false
  end;
end;

function TdtmPrincipal.CpfValido(sCpf: String): Boolean;
var  dig10, dig11: string;
    s, i, r, peso: integer;
begin
  // função obtida em : https://www.devmedia.com.br/validando-o-cpf-em-uma-aplicacao-delphi/22180
  // length - retorna o tamanho da string (CPF é um número formado por 11 dígitos)
  if ((sCpf = '00000000000') or (sCpf = '11111111111') or
      (sCpf = '22222222222') or (sCpf = '33333333333') or
      (sCpf = '44444444444') or (sCpf = '55555555555') or
      (sCpf = '66666666666') or (sCpf = '77777777777') or
      (sCpf = '88888888888') or (sCpf = '99999999999') or
      (length(sCpf) <> 11))
     then begin
              CpfValido := false;
              exit;
            end;
 
// try - protege o código para eventuais erros de conversão de tipo na função StrToInt
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
// StrToInt converte o i-ésimo caractere do CPF em um número
      s := s + (StrToInt(sCpf[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig10 := '0'
    else str(r:1, dig10); // converte um número no respectivo caractere numérico
 
{ *-- Cálculo do 2o. Digito Verificador --* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(sCpf[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig11 := '0'
    else str(r:1, dig11);
 
{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = sCpf[10]) and (dig11 = sCpf[11]))
       then CpfValido := true
    else CpfValido := false;
  except
    CpfValido := false
  end;
end;

procedure TdtmPrincipal.DataModuleCreate(Sender: TObject);
var ini: TIniFile;
begin
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  cntConexao.Params.Values['Database'] := ini.ReadString('controlenegociacao','CaminhoBD','');
  ini.Free;
end;

function TdtmPrincipal.ObterGenID(sGenerator: String): Integer;
begin
  with qryObterGen do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT GEN_ID(' + sGenerator + ', 1) AS ID FROM RDB$DATABASE');
      Open;
      Result := FieldByName('ID').AsInteger;
    end;
end;

end.
