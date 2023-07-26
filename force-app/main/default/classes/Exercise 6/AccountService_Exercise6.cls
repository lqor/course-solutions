public with sharing class AccountService_Exercise6 {

    public List<Account> createTwoAccounts() {
        List<Account> twoAccounts = new List<Account>();

        Account firstAccount = new Account();   
        firstAccount.Name = 'Tokyo Disneyland';
        firstAccount.Industry = 'Entertainment';
        firstAccount.BillingCity = 'Tokyo';

        twoAccounts.add(firstAccount);
        
        Account secondAccount = new Account();
        secondAccount.Name = 'Universal Studios Japan';
        secondAccount.Industry = 'Entertainment';
        secondAccount.BillingCity = 'Osaka';

        twoAccounts.add(secondAccount);
        
        return twoAccounts;
    }
}