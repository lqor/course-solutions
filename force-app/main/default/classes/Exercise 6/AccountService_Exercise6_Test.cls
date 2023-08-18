@isTest
public with sharing class AccountService_Exercise6_Test {

    @isTest
    static void createTwoAccounts_UnitTest() {
        AccountService_Exercise6 accountService = new AccountService_Exercise6();

        Test.startTest();
        List<Account> accounts = accountService.createTwoAccounts();
        Test.stopTest();
       
        Assert.areEqual(2, accounts.size());
        Assert.areEqual('Tokyo Disneyland', accounts.get(0).Name);
        Assert.areEqual('Entertainment', accounts.get(0).Industry);
        Assert.areEqual('Tokyo', accounts.get(0).BillingCity);
        Assert.areEqual('Universal Studios Japan',  accounts.get(1).Name);
        Assert.areEqual('Entertainment',  accounts.get(1).Industry);
        Assert.areEqual('Osaka',  accounts.get(1).BillingCity);
    }
}