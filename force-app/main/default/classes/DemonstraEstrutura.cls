public with sharing class DemonstraEstrutura {
    public DemonstraEstrutura() {

    }

    public static void variaveis(){
      
      //Aqui é um exemplo de declaração de variável
      Boolean ehGremista = true;
      System.debug('A variável ehGremista tem valor de: ' + ehGremista);

      //Declaração de uma variável
      //TIPO + NOME DA VARIÁVEL = VALOR 
      String nomeAluno = 'Bruno';

      //Transformando uma variável booleana em String
      String ehGremistaString = String.valueOf(ehGremista);

      //Exemplo com varias variáveis
      Integer idade = 5;
      String nome = 'Gael';
      Boolean ehMenino = true;
      System.debug('O Valor definido para a variável idade é = ' + idade);
      System.debug('O Valor definido para a variável nome é = ' + nome);
      System.debug('O Valor definido para a variável ehMenino é = ' + ehMenino);

      //Outro Exemplo
      Integer valorContaDoGian;
      System.debug('O Valor definido para a variável valorContaDoGian é = ' + valorContaDoGian);

      valorContadoGian = 10000000;
      System.debug('O Valor definido para a variável valorContaDoGian é = ' + valorContaDoGian);

      //Double pode ter casas decimais
      Double valorComCasasDecimais = 10.02550505;
      Decimal valorDecimal = 15.05;

      //Date trabalha com datas
      Date today = system.Today();
      system.debug('O dia de hoje é = '+today);

      DateTime dataEHora = system.Now();
      system.debug('O dia e a hora atual é = '+dataEHora);

      Integer diasASomar = 7;

      dataEHora = dataEHora.addDays(diasASomar);
      system.debug('O dia e a hora daqui a '+diasASomar+' dias é = '+dataEHora);

      Id idValido = '001D000000I8mUOIAZ';

      //Variaveis do tipo sObject
      Account acc = new Account();
      acc.Name = 'Lucas';
      acc.Phone = '55555555';
      system.debug('O valor do objeto acc é = '+acc);
      //insert acc;

      Opportunity opp = new Opportunity();
      opp.Name = 'Teste opp';
      opp.Description = 'Oportunidade criada para testes';
      system.debug('O valor do objeto opp é = '+opp);

      //Exemplos de utilização de sObject
      Account recuperaDadosAccount = (Account)DemonstraEstrutura.loadObjectInfoById('001Hp00002dTNuTIAW');
      system.debug('recuperaDadosAccount = '+recuperaDadosAccount);

      Opportunity oppRecupera = (Opportunity)DemonstraEstrutura.loadObjectInfoById('006Hp000014eEtBIAU');
      system.debug('oppRecupera = '+oppRecupera);

  }

  public static sObject loadObjectInfoById(Id recordId) {
      DescribeSObjectResult objectType = recordId.getSobjectType().getDescribe();
      List<String> objectFields = new List<String>(objectType.fields.getMap().keySet());
      String query = 'SELECT ' + String.join(objectFields, ',') + ' FROM ' + objectType.getName() + ' WHERE Id = \'' + String.escapeSingleQuotes(recordId) + '\' LIMIT 1';
      return Database.query(query);
  }
}