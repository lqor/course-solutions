public with sharing class AccountService_Exercise6 {

    public List<Account> createTwoAccounts() {
        List<Account> twoAccounts = new List<Account>();

        twoAccounts.add(new Account(
            Name = 'Tokyo Disneyland',
            Industry = 'Entertainment',
            BillingCity = 'Tokyo'
        ));

        twoAccounts.add(new Account(
            Name = 'Universal Studios Japan',
            Industry = 'Entertainment',
            BillingCity = 'Osaka'
        ));
        
        return twoAccounts;
    }
}