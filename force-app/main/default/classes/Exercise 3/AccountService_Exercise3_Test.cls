@isTest
public with sharing class AccountService_Exercise3_Test {

    @isTest
    static void createAccount_UnitTest() {
        AccountService_Exercise3 accountService = new AccountService_Exercise3();

        Test.startTest();
        Account createdAccount = accountService.createAccount();
        Test.stopTest();
        
        Assert.areEqual('Metropolitan Museum of Art', createdAccount.Name);
        Assert.areEqual('Not For Profit', createdAccount.Industry);
        Assert.areEqual('New York', createdAccount.BillingCity);
    }

    @isTest
    static void insertAccount_UnitTest() {
        AccountService_Exercise3 accountService = new AccountService_Exercise3();

        Account testAccount = new Account();
        testAccount.Name = 'Pergamont Museum';
        testAccount.Industry = 'Not For Profit';
        testAccount.BillingCity = 'New York';

        Test.startTest();
        accountService.insertAccount(testAccount);
        Test.stopTest();
        
        Account insertedAccount = [SELECT Name, Industry, BillingCity FROM Account WHERE Id = :testAccount.Id];

        Assert.areEqual('Pergamont Museum', insertedAccount.Name);
        Assert.areEqual('Not For Profit', insertedAccount.Industry);
        Assert.areEqual('New York', insertedAccount.BillingCity);
    }
}