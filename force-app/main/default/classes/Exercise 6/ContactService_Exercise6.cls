public with sharing class ContactService_Exercise6 {
      
    public List<Contact> createTwoContactObjects(List<Account> twoAccounts) {
        if(twoAccounts.size() != 2) {
            return null;
        }
        
        List<Contact> twoContacts = new List<Contact>();

        Contact firstContact = new Contact();
        firstContact.LastName = 'Miyazaki';
        firstContact.AccountId = twoAccounts.get(0).Id;

        twoContacts.add(firstContact);

        Contact secondContact = new Contact();
        secondContact.LastName = 'Miyamoto';
        secondContact.AccountId = twoAccounts.get(1).Id;
        
        twoContacts.add(secondContact);
        
        return twoContacts;
    }
   
    public List<Contact> insertTwoContactsWithAccounts() {
        AccountService_Exercise6 accountService = new AccountService_Exercise6();

        List<Account> twoAccounts = accountService.createTwoAccounts();
        insert twoAccounts;
        
        List<Contact> twoContacts = createTwoContactObjects(twoAccounts);
        insert twoContacts;
        
        return twoContacts;
    }
}