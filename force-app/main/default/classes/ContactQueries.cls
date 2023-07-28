public with sharing class ContactQueries {

    public static List<Contact> queryContactsByAccountId(Id accountId) {
        return [SELECT AccountId, Phone FROM Contact WHERE AccountId = :accountId];
    }

    public static List<Contact> queryContactsBySetOfAccountIds(Set<Id> accountIds) {
        return [SELECT Name, AccountId, Account.Name FROM Contact WHERE AccountId IN :accountIds];
    }
}