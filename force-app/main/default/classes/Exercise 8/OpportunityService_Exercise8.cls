public with sharing class OpportunityService_Exercise8 {

    public static final String CLOSED_WON_OPP_STAGE = 'Closed Won';
    public static final String CLOSED_LOST_OPP_STAGE = 'Closed Lost';

    public void updateOpportunityCloseDates(String stageName, Integer daysToAdd) {
        List<Opportunity> opportunities = OpportunityQueries.queryOpportunitiesByStage(stageName);
        
        for(Opportunity opportunity : opportunities) {
            opportunity.CloseDate = opportunity.CloseDate.addDays(daysToAdd);
        }

        if (!opportunities.isEmpty()) {
            update opportunities;
        }
    }

    public void closeOldOpportunities(Integer amountOfMonths) {
        Date pastDate = System.today().addMonths(amountOfMonths * -1);
        List<Opportunity> opportunities = OpportunityQueries.queryOpportunitiesByCloseDateAndNotClosedLost(pastDate);
        
        for(Opportunity opportunity : opportunities) {
            opportunity.StageName = CLOSED_LOST_OPP_STAGE;
        }
        
        if (!opportunities.isEmpty()) {
            update opportunities;
        }
    }   

    public void addTimeToOpportunities(Set<Id> accountIds, Integer amountOfDays) {
        List<Opportunity> opportunities = OpportunityQueries.queryOpportunitiesByAccountId(accountIds);

        for (Opportunity opportunity : opportunities) {
            Date newCloseDate = opportunity.CloseDate.addDays(amountOfDays);
            opportunity.CloseDate = newCloseDate;
        }

        if (!opportunities.isEmpty()) {
            update opportunities;
        }
    }
}