public with sharing class OpportunityService_Exercise10 {

    public Map<String, Integer> summarizeOpportunityStages(List<Opportunity> opportunities) {
        Map<String, Integer> opportunitiesByStage = new Map<String, Integer>();
        
        for(Opportunity opportunity : opportunities) {
            if(opportunitiesByStage.containsKey(opportunity.StageName)) {
                opportunitiesByStage.put(opportunity.StageName, opportunitiesByStage.get(opportunity.StageName) + 1);
            } else {
                opportunitiesByStage.put(opportunity.StageName, 1);
            }
        }
        
        return opportunitiesByStage;
    }

    public Map<Id, Integer> countOpportunitiesPerAccount(List<Opportunity> opportunities) {
        Map<Id, Integer> opportunitiesPerAccount = new Map<Id, Integer>();
        
        for(Opportunity opportunity : opportunities) {
            if(opportunitiesPerAccount.containsKey(opportunity.AccountId)) {
                opportunitiesPerAccount.put(opportunity.AccountId, opportunitiesPerAccount.get(opportunity.AccountId) + 1);
            } else {
                opportunitiesPerAccount.put(opportunity.AccountId, 1);
            }
        }
        
        return opportunitiesPerAccount;
    }  
}