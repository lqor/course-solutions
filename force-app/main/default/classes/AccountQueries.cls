public with sharing class AccountQueries {
    
    public static List<Account> queryAllAccounts() {
        return [SELECT Id, Name, Description FROM Account];
    }
}