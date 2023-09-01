public with sharing class OpportunityService_Exercise12 extends SObjectService implements SObjectServiceInterface {
    
    public void updateObject(SObject record) {
        if(record == null || !(record instanceof Opportunity)) {
            return;
        }
        
        if(validateObject(record)) {
            update record;
        }
    }

    public override Boolean validateObject(SObject record) {
        if(record instanceof Opportunity) {
            Opportunity opportunity = (Opportunity) record;
            
            return opportunity.Name != null && opportunity.StageName != null && opportunity.CloseDate != null;
        }
        
        return false;
    }

    public void formatRecord(SObject record) {
        if(record instanceof Opportunity) {
            Opportunity opportunity = (Opportunity) record;
            
            List<String> splitNames = new List<String>(opportunity.Name.split(' '));
            String formattedName = '';
            String firstLetter = '';
            String trimmedName = '';
            
            for(String name : splitNames) {
                trimmedName = name.trim();
                
                if(trimmedName.length() > 1) {
                    firstLetter = trimmedName.substring(0,1);
                } else if(trimmedName.length() == 1) {
                    firstLetter = trimmedName;
                } else {
                    continue;
                }
                
                if(firstLetter.isAllLowerCase()) {
                    formattedName += trimmedName.capitalize() + ' ';
                } else {
                    formattedName += trimmedName + ' ';
                }
            }
            
            opportunity.Name = formattedName.trim();
        }
    }
}