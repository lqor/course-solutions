public with sharing class AccountQueries {
    
    public static List<Account> getAllAccounts() {
        return [SELECT Id, Name, Description FROM Account];
    }
}