public with sharing class DemonstraEstrutura {
  
  //CONSTANTES
  private static final Double TAXA_IFO = 0.5;
  private static Double TAXA_IFO_VARIANTE = 0.5;
  eNum DiaDaSemana{
    SEGUNDA,
    TERCA,
    QUARTA,
    QUINTA,
    SEXTA,
    SABADO,
    DOMINGO
  }

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
  
  public static void variavesDeColecao(){

    //Lista
    List<String> listNames = new List<String>();
    
    //adicionando o nome da Ana
    listNames.add('Ana');
    
    //adicionando o nome da Maria
    listNames.add('Maria');
    
    //adiconando o nome do Carlos
    listNames.add('Carlos');

    listNames.add('30');

    system.debug('listNames '+listNames);

    system.debug('recuperando o segundo valor da lista listNames: '+listNames[1]);

    List<Integer> listDeInteiros = new List<Integer>{10,20};
    listDeInteiros.add(30);
    system.debug('listDeInteiros '+listDeInteiros);


    Account acc1 = new Account();
    acc1.Name = 'Conta 1';
    acc1.Phone = '1111111111111';

    Account acc2 =  new Account();
    acc2.Name = 'Conta 2';
    acc2.Phone = '22222222222';

    List<Account> accountList = new List<Account>{acc1, acc2};

    Account acc3 = new Account();
    acc3.Name = 'Conta 3';
    acc3.Phone = '3333333333';

    accountList.add(acc3);

    Account acc4 = new Account();
    acc4.Name = 'Conta 4';

    accountList.add(acc4);

    system.debug('accountList '+accountList);

    system.debug('recuperando o nome da segunda posição da variável accountList:'+accountList[1].Name);

    system.debug('recuperando o phone posição 4:'+accountList[3].Phone);

    //Sets
    List<String> listNames2 = new List<String>{'João','Maria','José','João','Maria'};
    system.debug('listNames2 '+ listNames2);

    Set<String> setNames =  new Set<String>{'João','Maria','José','João','Maria'};
    system.debug('setNames '+setNames);

    //Maps
    Map<String,Integer> nomeIdadeMap = new Map<String,Integer>();
    nomeIdadeMap.put('Maria',30);
    nomeIdadeMap.put('João',19);
    nomeIdadeMap.put('José',63);
    system.debug('nomeIdadeMap '+nomeIdadeMap);

    system.debug('Idade do João: '+nomeIdadeMap.get('João'));

    nomeIdadeMap.put('André',99);
    if(nomeIdadeMap.containsKey('André')){
        system.debug('Idade do André: '+nomeIdadeMap.get('André'));
    }else{
        system.debug('Não existe a chave André na variável nomeIdadeMap');
    }

    //Recuprando as informações de uma conta pelo CNPJ
    Map<String,Account> contaPorCnpjMap = new Map<String,Account>();

    Account accEx1 = new Account();
    accEx1.Name = 'Conta 1 ';
    accEx1.Phone = '11111111';

    contaPorCnpjMap.put('15151516616', accEx1);
    contaPorCnpjMap.put('12334556660', new Account(Name = 'Conta 2', Phone = '11111111'));

    Account accEx3 = new Account(Name = 'Conta 3 ', Phone = '333333');

    Account accEx2 = contaPorCnpjMap.get('12334556660');
    accEx2.Phone = '2222222';
    accEx2.NumberofLocations__c = 20;
    system.debug('accEx2 '+accEx2);

    system.debug('contaPorCnpjMap '+contaPorCnpjMap);

    //Criar uma variável mapa, que recebe um nome de uma pessoa, e armazena a idade, criar 4 registros, e recuperar a idade do terceiro registro mostrando em um system.debug
    Map<String, Integer> nomesIdadesMap = new Map<String,Integer>{'Maria' => 30, 'José' => 50, 'Tatiane' => 20, 'André' => 35};
    system.debug('A idade da terceira pessoa é: ' + nomesIdadesMap.get('Tatiane'));
    
    //ENUM - Enumeração
    DiaDaSemana hoje = DiaDaSemana.SEGUNDA;

  }

  public static void condicionais(){
  
    //IF == Se
    Integer num = 5;

    if(num > 2){
      system.debug('O número é maior que 2');
    }

    //ELSE IF + ELSE
    Integer idade = 61;
    //Se a idade for menor que 18, escrve que é criança
    // se a idade for maior ou igual que 18 e menor do que 30 escrever você é jovem
    // se não escrever você é adulto
    if(idade < 18){
      system.debug('Você é uma criança');  
    } else if(idade >= 18 && idade < 30){
      system.debug('Você é jovem');
    } else {
      if(idade > 60){
        system.debug('Você é idoso');
      }else{
        system.debug('Você é adulto');
      }
    }

    //SWITCH
    // 0 = Domingo, 1 = Segunda, 2 = Terça, 3 = Quarta, 4 = Quinta, 5 = Sexta, 6 = Sábado
    Integer dayWeek = 3;

    switch on dayWeek{
      when 0{
        system.debug('Domingo');
      }
      when 1{
        system.debug('Segunda');
      }
      when 2{
        system.debug('Terça');
      }
      when 3{
        system.debug('Quarta');
      }
      when 4{
        system.debug('Quinta');
      }
      when 5{
        system.debug('Sexta');
      }
      when 6{
        system.debug('Sábado');
      }
      when else{
        system.debug('Dia inválido');
      }
    }

    //IF TERNÁRIO
    Integer numero = 30;
    String result = numero > 5 ? 'O número é maior que 5' : 'O número é menor que 5';

    //TERNARIO CONDICÃO IDADE ACIMA
    String textoIdade = idade < 18 ? 'Você é uma criança' : idade >= 18 && idade < 30 ? 'Você é jovem' : idade > 60 ? 'Você é idoso' : 'Você é adulto'; 
    System.debug('textoIdade '+textoIdade);
  }

  //LOOPS
  public static void loops(){
    //FOR
    for(Integer i = 0; i < 10; i++){
      system.debug('O valor de i é: '+i);
    }
    //WHILE
    Integer count = 1;
    while(count <= 10){
      system.debug('O valor de count é: '+count);
      count++;
    }
    //DO WHILE
    Integer counter = 0;
    do{
      system.debug('O valor de counter é: '+counter);
      counter++;
    }while(counter < 5);
    //FOR EACH
    for(Account acc : [SELECT Name FROM Account LIMIT 10]){
      system.debug('O valor de acc é: '+acc.Name);
    }

    List<Integer> integerList = new List<Integer>{1,2,3,4,5,6,7,8,9,10};
    for(Integer intList : integerList){
      system.debug('O valor de int é: '+intList);
    }
  }

  //OPERADORES
  public static void operadores(){
    //ARITMÉTICOS + - * / 
    Integer exSoma = 10 + 10;
    Integer exSubtracao = 10 - 5;
    Integer exMultiplicacao = 10 * 10;
    Integer exDivisao = 10 / 2;
    
    //ATRIBUIÇÃO =
    Integer exAtribuicao = 10;

    //COMPARAÇÃO == != > < >= <=
    Integer exComparacao = 10;
    if(exComparacao == 10){
      system.debug('O valor de exComparacao é igual a 10');
    }
    if(exComparacao != 5){
      system.debug('O valor de exComparacao é diferente de 5');
    }
    if(exComparacao > 5){
      system.debug('O valor de exComparacao é maior que 5');
    }
    if(exComparacao < 15){
      system.debug('O valor de exComparacao é menor que 15');
    }
    if(exComparacao >= 10){
      system.debug('O valor de exComparacao é maior ou igual a 10');
    }
    if(exComparacao <= 10){
      system.debug('O valor de exComparacao é menor ou igual a 10');
    }
    //LÓGICOS && || !
    Integer exLogico = 10;
    if(exLogico == 10 && exLogico > 5){
      system.debug('O valor de exLogico é igual a 10 e maior que 5');
    }
    if(exLogico == 10 || exLogico < 5){
      system.debug('O valor de exLogico é igual a 10 ou menor que 5');
    }
    //CONDICIONAIS ? :
    Integer exCondicionais = 10;
    String exCondicionaisString = exCondicionais > 5 ? 'O valor de exCondicionais é maior que 5' : 'O valor de exCondicionais é menor que 5';
  }

  //OPERADORES DE ATRIBUIÇÃO
  // =
  // +=
  // -=
  // *=
  // /=
  // %= pega o resto de um número de uma divisão


  //FUNÇÕES E MÉTODOS

  //Função para calcular a média de uma lista de números
  //Anonymous
  /* List<Double> doubleList = new List<Double>{10, 20, 5, 50};
  Double num = DemonstraEstrutura.calculaMedia(doubleList);
  System.debug('O Valor de num é: ' + num); */
  public static Double calculaMedia(List<Double> numeros){
    Double soma = 0;
    for(Double num : numeros){
      soma += num;
    }
    return soma / numeros.size();
  }
  /* 
  modificador_de_acesso(public|private) tipo_de_retorno nome_do_metodo(parametros){
    //lógica da função código
    return igual_ao_tipo_de_retorno;
  } */
  
  //Desafio: Fazer uma função, que recebe dois inteiros e retorna a soma deles.
  public static Integer somaDoisNumeros(Integer num1, Integer num2){
    return num1 + num2;
  }
}