@isTest
public with sharing class ContactService_Exercise6_Test {

    @TestSetup
    static void setup() {
        List<Account> testAccounts = new List<Account>();

        for (Integer i = 0; i < 2; i++) {
            Account acc = new Account(Name = 'Test Account ' + i + 1);
            testAccounts.add(acc);
        }

        insert testAccounts;
    }
    
    @isTest
    static void createTwoContactObjects_UnitTest1() {
        List<Account> twoAccounts = [SELECT Id, Name FROM Account WHERE Name LIKE 'Test Account%'];

        ContactService_Exercise6 contactService = new ContactService_Exercise6();
        
        Test.startTest();
        List<Contact> contacts = contactService.createTwoContactObjects(twoAccounts);
        Test.stopTest();
        
        Assert.areEqual(2, contacts.size());
        Assert.areEqual('Miyazaki', contacts.get(0).LastName);
        Assert.areEqual('Miyamoto', contacts.get(1).LastName);
        Assert.areEqual(twoAccounts.get(0).Id, contacts.get(0).AccountId);
        Assert.areEqual(twoAccounts.get(1).Id, contacts.get(1).AccountId);
    }

    @isTest
    static void createTwoContactObjects_UnitTest2() {
        List<Account> account = [SELECT Id, Name FROM Account WHERE Name = 'Test Account 1'];

        ContactService_Exercise6 contactService = new ContactService_Exercise6();
        
        Test.startTest();
        List<Contact> contacts = contactService.createTwoContactObjects(account);
        Test.stopTest();
        
        Assert.areEqual(null, contacts);
    }
    
    @isTest
    static void insertTwoContactsWithAccounts_UnitTest() {
        ContactService_Exercise6 contactService = new ContactService_Exercise6();
        
        Test.startTest();
        List<Contact> contacts = contactService.insertTwoContactsWithAccounts();
        Test.stopTest();

        Account firstAccount = [SELECT Id FROM Account WHERE BillingCity = 'Tokyo' LIMIT 1];
        Account secondAccount = [SELECT Id FROM Account WHERE BillingCity = 'Osaka' LIMIT 1];

        Assert.areEqual(2, contacts.size());
        Assert.areEqual('Miyazaki', contacts.get(0).LastName);
        Assert.areEqual('Miyamoto', contacts.get(1).LastName);
        Assert.areEqual(firstAccount.Id, contacts.get(0).AccountId);
        Assert.areEqual(secondAccount.Id, contacts.get(1).AccountId);
    }
}