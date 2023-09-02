@isTest
public with sharing class ContactService_Exercise12_Test {

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
        Contact contact = [SELECT FirstName, LastName, Phone FROM Contact WHERE FirstName = 'Test' LIMIT 1];

        ContactService_Exercise12 contactService = new ContactService_Exercise12();

        Test.startTest();
        contact.Phone = '911';
        contactService.updateObject(contact);
        Test.stopTest();

        Contact potentiallyUpdatedContact = [
            SELECT FirstName, LastName, Phone 
            FROM Contact 
            WHERE FirstName = 'Test' 
            LIMIT 1
        ];

        Assert.areNotEqual('123-456-789', potentiallyUpdatedContact.Phone);
        Assert.areEqual('911', potentiallyUpdatedContact.Phone);
    }

    @isTest
    static void updateObject_UnitTest2() {
        Account account = [SELECT Name FROM Account WHERE Type = 'Other' LIMIT 1];

        ContactService_Exercise12 contactService = new ContactService_Exercise12();

        Test.startTest();
        account.Name = 'Super Test Account';
        contactService.updateObject(account);
        Test.stopTest();

        Account potentiallyUpdatedAccount = [SELECT Name FROM Account WHERE Type = 'Other' LIMIT 1];

        Assert.areNotEqual('Super Test Account', potentiallyUpdatedAccount.Name);
        Assert.areEqual('Test Account', potentiallyUpdatedAccount.Name);
    }

    @isTest
    static void validateObject_UnitTest1() {
        Contact contact = [SELECT Name, LastName, Phone FROM Contact WHERE FirstName = 'Test' LIMIT 1];
        
        ContactService_Exercise12 contactService = new ContactService_Exercise12();
        
        Test.startTest();
        Boolean isValidContact = contactService.validateObject(contact);
        Test.stopTest();

        Assert.isTrue(isValidContact);      
    }

    @isTest
    static void validateObject_UnitTest2() {
        Account account = [SELECT Name FROM Account WHERE Type = 'Other' LIMIT 1];
        
        ContactService_Exercise12 contactService = new ContactService_Exercise12();
        
        Test.startTest();
        Boolean isValidContact = contactService.validateObject(account);
        Test.stopTest();

        Assert.isFalse(isValidContact);
    }

    @isTest
    static void formatRecord_UnitTest1() {
        Contact contact = new Contact(FirstName = 'john', LastName = 'doe');
        insert contact;

        ContactService_Exercise12 contactService = new ContactService_Exercise12();
        
        Test.startTest();
        contactService.formatRecord(contact);
        Test.stopTest();

        Assert.areEqual('John', contact.FirstName);
        Assert.areEqual('Doe', contact.LastName);   
    }

    @isTest
    static void formatRecord_UnitTest2() {
        Contact contact = new Contact(FirstName = 'j', LastName = 'd');
        insert contact;

        ContactService_Exercise12 contactService = new ContactService_Exercise12();
        
        Test.startTest();
        contactService.formatRecord(contact);
        Test.stopTest();

        Assert.areEqual('J', contact.FirstName);
        Assert.areEqual('D', contact.LastName);   
    }

    @isTest
    static void formatRecord_UnitTest3() {
        Contact contact = new Contact(FirstName = 'John', LastName = 'Doe');
        insert contact;

        ContactService_Exercise12 contactService = new ContactService_Exercise12();
        
        Test.startTest();
        contactService.formatRecord(contact);
        Test.stopTest();

        Assert.areEqual('John', contact.FirstName);
        Assert.areEqual('Doe', contact.LastName);   
    }

    @isTest
    static void formatRecord_UnitTest4() {
        Contact contact = new Contact(FirstName = '', LastName = 'o');
        insert contact;

        ContactService_Exercise12 contactService = new ContactService_Exercise12();
        
        Test.startTest();
        contactService.formatRecord(contact);
        Test.stopTest();

        Assert.areEqual('', contact.FirstName);
        Assert.areEqual('O', contact.LastName);   
    }
}