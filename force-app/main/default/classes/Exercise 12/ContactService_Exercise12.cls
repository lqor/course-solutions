public with sharing class ContactService_Exercise12 extends SObjectService implements SObjectServiceInterface {
    
    public override void updateObject(SObject record) {
        if(record == null || !(record instanceof Contact)) {
            return;
        }
        
        if(validateObject(record)) {
            update record;
        }
    }

    public override void insertObject(SObject record) {
        if(record == null || !(record instanceof Contact)) {
            return;
        }
        
        if(validateObject(record)) {
            insert record;
        }
    }

    public Boolean validateObject(SObject record) {
        if(record instanceof Contact) {
            Contact contact = (Contact) record;
            return contact.LastName != null;
        }
        
        return false;
    }

    public void formatRecord(SObject record) {
        if(record instanceof Contact) {
            Contact contact = (Contact) record;
            
            List<String> splitFirstNames = new List<String>(contact.FirstName.split(' '));
            List<String> splitLastNames = new List<String>(contact.LastName.split(' '));
            
            String formattedFirstName = '';
            String formattedLastName = '';
            String firstLetterFirstName = '';
            String firstLetterLastName = '';
            String trimmedFirstName = '';
            String trimmedLastName = '';
            
            for(String firstName : splitFirstNames) {
                trimmedFirstName = firstName.trim();
                
                if(trimmedFirstName.length() > 1) {
                    firstLetterFirstName = trimmedFirstName.substring(0,1);
                } else if(trimmedFirstName.length() == 1) {
                    firstLetterFirstName = trimmedFirstName;
                } else {
                    continue;
                }
                
                if(firstLetterFirstName.isAllLowerCase()) {
                    formattedFirstName += trimmedFirstName.capitalize() + ' ';
                } else {
                    formattedFirstName += trimmedFirstName + ' ';
                }
            }
            
            for(String lastName : splitLastNames) {
                trimmedLastName = lastName.trim();
                
                if(trimmedLastName.length() > 1) {
                    firstLetterLastName = trimmedLastName.substring(0,1);
                } else if(trimmedLastName.length() == 1) {
                    firstLetterLastName = trimmedLastName;
                } else {
                    continue;
                }
                
                if(firstLetterLastName.isAllLowerCase()) {
                    formattedLastName += trimmedLastName.capitalize() + ' ';
                } else {
                    formattedLastName += trimmedLastName + ' ';
                }
            }
            
            contact.FirstName = formattedFirstName.trim();
            contact.LastName = formattedLastName.trim();
        }
    }
}