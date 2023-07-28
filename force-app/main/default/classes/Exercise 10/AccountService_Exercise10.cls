public with sharing class AccountService_Exercise10 {
    
    public Map<String, List<Account>> createIndustryMap(List<Account> accounts) {
        Map<String, List<Account>> accountsByIndustry = new Map<String, List<Account>>();
        
        for(Account account : accounts) {
            List<Account> updatedAccounts = new List<Account>();
            
            if(accountsByIndustry.containsKey(account.Industry)) {
                updatedAccounts = accountsByIndustry.get(account.Industry);
            }
            updatedAccounts.add(account);
            accountsByIndustry.put(account.Industry, updatedAccounts);
        }
        
        return accountsByIndustry;
    } 
    
    public void fillDescriptionWithContacts(List<Account> accounts, Map<String, List<Contact>> contactMap) {
        Set<Id> accountIds = (new Map<Id, Account> (accounts)).keySet();
        Map<Id, Account> accountsById = new Map<Id, Account> (accounts);
        String label = ' - Associated Contact: ';
        
        for(Id accountId : accountIds) { 
            if(contactMap.containsKey(accountId) && accountsById.containsKey(accountId)) {
                List<Contact> contactValues = new List<Contact>();
                Account currentAccount = new Account();
                
                contactValues = contactMap.get(accountId);
                currentAccount = accountsById.get(accountId);
                
                for(Contact contact : contactValues) {
                    if(currentAccount.Description != null) {
                        currentAccount.Description += label + contact.Name;
                    } else {
                        currentAccount.Description = label + contact.Name;
                    }
                }
            }
        }
    }

    public void updateAccountsWithContacts() {
        List<Account> accounts = AccountQueries.queryAllAccounts();
        Set<Id> accountIds = (new Map<Id, Account> (accounts)).keySet();
        
        List<Contact> relatedContacts = ContactQueries.queryContactsBySetOfAccountIds(accountIds);
        
        Map<String, List<Contact>> contactMap = new Map<String, List<Contact>>();
        
        for(Contact relatedContact : relatedContacts) {
            List<Contact> updatedContacts = new List<Contact>();
            
            if(contactMap.containsKey(relatedContact.AccountId)) {
                updatedContacts = contactMap.get(relatedContact.AccountId);
            } 
            updatedContacts.add(relatedContact);
            contactMap.put(relatedContact.AccountId, updatedContacts);
        }
        
        fillDescriptionWithContacts(accounts, contactMap);

        if (!accounts.isEmpty()) {
            update accounts;
        }
    }
}