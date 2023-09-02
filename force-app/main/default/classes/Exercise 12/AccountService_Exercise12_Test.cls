@isTest
public with sharing class AccountService_Exercise12_Test {

    @TestSetup
    static void setup() {
        Account account = new Account();
        account.Name = 'Test Account';
        account.Type = 'Other';

        insert account;

        Contact contact = new Contact();
        contact.AccountId = account.Id;
        contact.FirstName = 'Test';
        contact.LastName = 'Contact';
        contact.Phone = '123-456-789';
          
        insert contact;
    }
    
    @isTest
    static void updateObject_UnitTest1() {
        Account account = [SELECT Name FROM Account WHERE Type = 'Other' LIMIT 1];
        
        AccountService_Exercise12 accountService = new AccountService_Exercise12();

        Test.startTest();
        account.Name = 'Super Test Account';
        accountService.updateObject(account);
        Test.stopTest();

        Account potentiallyUpdatedAccount = [SELECT Name FROM Account WHERE Type = 'Other' LIMIT 1];
        
        Assert.areNotEqual('Test Account', potentiallyUpdatedAccount.Name);
        Assert.areEqual('Super Test Account', potentiallyUpdatedAccount.Name);
    }  

    @isTest
    static void updateObject_UnitTest2() {
        Contact contact = [SELECT Name, Phone FROM Contact WHERE FirstName = 'Test' LIMIT 1];
        
        AccountService_Exercise12 accountService = new AccountService_Exercise12();

        Test.startTest();
        contact.Phone = '911';
        accountService.updateObject(contact);
        Test.stopTest();

        Contact potentiallyUpdatedContact = [SELECT Name, Phone FROM Contact WHERE FirstName = 'Test' LIMIT 1];
        
        Assert.areNotEqual('911', potentiallyUpdatedContact.Phone);
        Assert.areEqual('123-456-789', potentiallyUpdatedContact.Phone);
    }  
    
   
    @isTest
    static void validateObject_UnitTest1() {
        Account account = [SELECT Name FROM Account WHERE Type = 'Other' LIMIT 1];
        
        AccountService_Exercise12 accountService = new AccountService_Exercise12();
        
        Test.startTest();
        Boolean isValidAccount = accountService.validateObject(account);
        Test.stopTest();

        Assert.isTrue(isValidAccount);
    }

    @isTest
    static void validateObject_UnitTest2() {
        Contact contact = [SELECT Name, Phone FROM Contact WHERE FirstName = 'Test' LIMIT 1];
        
        AccountService_Exercise12 accountService = new AccountService_Exercise12();
        
        Test.startTest();
        Boolean isValidAccount = accountService.validateObject(contact);
        Test.stopTest();

        Assert.isFalse(isValidAccount);
    }
    
    @isTest
    static void formatRecord_UnitTest() {
        Account testAccount = new Account();
        testAccount.Name = 'john  doe';
        
        AccountService_Exercise12 accountService = new AccountService_Exercise12();
        
        Test.startTest();
        accountService.formatRecord(testAccount);
        Test.stopTest();
       
        Assert.areEqual('John Doe', testAccount.Name);
    }
}