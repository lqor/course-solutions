public with sharing class ContactService_Exercise8 {

    public void updateContactsPhoneByAccount(Id accountId, String newPhoneNumber) {
        List<Contact> contacts = ContactQueries.queryContactsByAccountId(accountId);
        
        for(Contact contact : contacts) {
            contact.Phone = newPhoneNumber;
        }

        if (!contacts.isEmpty()) {
            update contacts;
        }
    }
}