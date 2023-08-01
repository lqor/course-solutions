public with sharing class AccountService_Exercise12 extends SObjectService implements SObjectServiceInterface {
    
    public override void updateObject(SObject record) {
        if(record == null || !(record instanceof Account)) {
            return;
        }
        
        if(validateObject(record)) {
            update record;
        }
    }

    public override void insertObject(SObject record) {
        if(record == null || !(record instanceof Account)) {
            return;
        }
        
        if(validateObject(record)) {
            insert record;
        }
    }

    public Boolean validateObject(SObject record) {
        if(record instanceof Account) {
            Account account = (Account) record;
            return account.Name != null;
        }
        
        return false;
    }

    public void formatRecord(SObject record) {
        if(!(record instanceof Account) || record == null || record.get('Name') == null) {
           return;
        }
        
        Account account = (Account) record;
            
        List<String> splitNames = account.Name.split(' ');
        
        String formattedName = '';
        
        for(String name : splitNames) {
            if(name != '') {
                formattedName += name.trim().capitalize() + ' ';
            }
        }
        
        account.Name = formattedName.trim();
    }
}