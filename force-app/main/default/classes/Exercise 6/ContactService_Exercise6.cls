public with sharing class ContactService_Exercise6 {
    
    public List<Contact> createTwoContactObjects(List<Account> twoAccounts) {
        if(twoAccounts.size() != 2) {
            return null;
        }
        
        List<Contact> twoContacts = new List<Contact>();

        twoContacts.add(new Contact(
            LastName = 'Miyazaki',
            AccountId = twoAccounts.get(0).Id
        ));

        twoContacts.add(new Contact(
            LastName = 'Miyamoto',
            AccountId = twoAccounts.get(1).Id
        ));
        
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