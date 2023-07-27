@isTest
public with sharing class ContactServiceTest_Exercise8 {
    @TestSetup
    static void setup() {
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        List<Contact> testContacts = new List<Contact>();
        for (Integer i = 0; i < 5; i++) {
            testContacts.add(new Contact(
                AccountId = testAccount.Id,
                FirstName = 'Test Contact ' + i,
                LastName = 'Lastname ' + i,
                Phone = '123-456-789' + i
            ));
        }
        insert testContacts;
    }

    @isTest
    static void testUpdateContactsPhoneByAccount_UnitTest() {
        Id accountId = fetchAccountId('Test Account');
        String newPhoneNumber = '987-654-3210';

        ContactService_Exercise8 contactService = new ContactService_Exercise8();

        Test.startTest();
        contactService.updateContactsPhoneByAccount(accountId, newPhoneNumber);
        Test.stopTest();

        List<Contact> updatedContacts = fetchContacts(accountId);
        
        System.assertEquals(5, updatedContacts.size(), 'Number of updated Contacts should be 5');

        for (Contact updatedContact : updatedContacts) {
            System.assertEquals(newPhoneNumber, updatedContact.Phone, 'Phone number should be updated');
        }
    }

    public static Id fetchAccountId(String accountName) {
        return [
            SELECT Id 
            FROM Account
            WHERE Name = :accountName LIMIT 1
        ].get(0).Id;
    }

    public static List<Contact> fetchContacts(String accountId) {
        return [
            SELECT Phone
            FROM Contact
            WHERE AccountId = :accountId
        ];
    }
}
