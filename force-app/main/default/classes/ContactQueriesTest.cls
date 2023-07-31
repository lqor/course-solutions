@isTest
public with sharing class ContactQueriesTest {

    @TestSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();

        for (Integer i = 0; i < 5; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i;
            
            accounts.add(acc);

            for (Integer j = 0; j < 2; j++) {
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.Phone = '123-456-789' + j;
                con.LastName = 'Test Contact ' + j;

                contacts.add(con);
            }
        }

        insert accounts;
        insert contacts;
    }

    @isTest
    static void queryContactsByAccountId_UnitTest() {
        List<Account> accounts = [SELECT Id FROM Account LIMIT 5];

        for (Account acc : accounts) {
            List<Contact> queriedContacts = ContactQueries.queryContactsByAccountId(acc.Id);

            for (Contact con : queriedContacts) {
                Assert.areEqual(acc.Id, con.AccountId, 'Contact with incorrect AccountId found.');
            }
        }
    }

    @isTest
    static void queryContactsBySetOfAccountIds_UnitTest() {
        List<Account> accounts = [SELECT Id FROM Account LIMIT 5];

        Set<Id> accountIds = new Set<Id>();
        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }

        List<Contact> queriedContacts = new List<Contact>();

        Test.startTest();
        queriedContacts = ContactQueries.queryContactsBySetOfAccountIds(accountIds);
        Test.stopTest();
        
        for (Contact con : queriedContacts) {
            Assert.areEqual(accountIds.contains(con.AccountId), 'Contact with incorrect AccountId found.');
        }
    }
}
