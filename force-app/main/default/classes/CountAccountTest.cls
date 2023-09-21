@isTest
public class CountAccountTest {
    
    @isTest
    static void testCount(){
        List<Account> accountList = new List<Account>();
        accountList = [SELECT Id, Name FROM Account];
        Test.startTest();
        System.assertEquals(0, accountList.size());
        Test.stopTest();
    }
}