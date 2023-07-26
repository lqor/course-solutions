public with sharing class OpportunityService_Exercise7 {

    public List<Opportunity> createOpportunities(Integer n) {
        List<Opportunity> opportunities = new List<Opportunity>();
        
        for(Integer i = 0; i < n; i++) {
            Opportunity opportunity = new Opportunity(
                Name = 'Default Opportunity ' + String.valueOf(i + 1),
                Amount = new ListsPractice_Exercise7().getRandomNumberInRange(1000, 300000),
                StageName = 'Prospecting',
                CloseDate = System.today().addDays(14)
            );
            
            opportunities.add(opportunity);
        }

        return opportunities;
    }

    public Double calculateTotalRevenue(List<Opportunity> opportunities) {
        Double totalRevenue = 0.0;
        
        for(Opportunity opportunity : opportunities) {
            totalRevenue += opportunity.Amount;
        }
        
        return totalRevenue;
    }

    public List<Opportunity> filterOpportunitiesByStage(List<Opportunity> opportunities, String stageName) {
        List<Opportunity> filteredOpportunities = new List<Opportunity>();
        
        for(Opportunity opportunity : opportunities) {
            if(opportunity.StageName == stageName) {
                filteredOpportunities.add(opportunity);
            }
        }
        
        return filteredOpportunities;
    }
   
    public List<Opportunity> filterClosedWonOpportunities(List<Opportunity> opportunities) {
        List<Opportunity> closedWonOpportunities = new List<Opportunity>();
        
        for(Opportunity opportunity : opportunities) {
            if(opportunity.StageName == 'Closed Won') {
                closedWonOpportunities.add(opportunity);
            }
        }
        
        return closedWonOpportunities;
    }
}