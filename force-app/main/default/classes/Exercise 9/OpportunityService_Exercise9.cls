public with sharing class OpportunityService_Exercise9 {
    
    public void changeProbabilityBasedOnAmount(Integer amount) {
        List<Opportunity> opportunities = OpportunityQueries.queryOpportunitiesByAmount(amount);
        
        for(Opportunity opportunity : opportunities) {
            opportunity.Probability *= 0.5;
        }
        
        if (!opportunities.isEmpty()) {
            update opportunities;
        }
    }   
}