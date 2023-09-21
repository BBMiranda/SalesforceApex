public with sharing class CountAccount {
    //teste
    public CountAccount(){
      List<Account> accountList = new List<Account>();
      accountList = [SELECT Id FROM Account];
      System.debug('Count of accounts: ' + accountList.size());
    }
}