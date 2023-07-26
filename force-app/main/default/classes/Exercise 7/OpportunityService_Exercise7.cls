public with sharing class OpportunityService_Exercise7 {

    public List<Opportunity> createOpportunities(Integer n) {
        ListsPractice_Exercise7 listsPractice = new ListsPractice_Exercise7();
        List<Opportunity> opportunities = new List<Opportunity>();
        
        for(Integer i = 0; i < n; i++) {
            Opportunity opportunity = createNewOpportunity();
            opportunity.Name = 'Default Opportunity ' + String.valueOf(n + 1);
            opportunity.Amount = listsPractice.getRandomNumberInRange(1000, 300000);
            opportunity.StageName = getRandomStageName();
            opportunities.add(opportunity);
        }
        
        return opportunities;
    }

    public Opportunity createNewOpportunity() {
        Opportunity opportunity = new Opportunity();
        
        opportunity.Name = 'Default Opportunity';
        opportunity.StageName = 'Prospecting';
        opportunity.CloseDate = System.today().addDays(14);
        
        return opportunity;
    }

    public String getRandomStageName() {
        ListsPractice_Exercise7 listsPractice = new  ListsPractice_Exercise7();
        List<String> stageNames = new List<String>();
        
        stageNames.add('Prospecting');
        stageNames.add('Qualification');
        stageNames.add('Needs Analysis');
        stageNames.add('Value Proposition');
        stageNames.add('Id. Decision Makers');
        stageNames.add('Perception Analysis');
        stageNames.add('Proposal/Price Quote');
        stageNames.add('Negotiation/Review');
        stageNames.add('Closed Won');
        stageNames.add('Closed Lost');
        
        return listsPractice.getRandomStringFromList(stageNames);
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
        return filterOpportunitiesByStage(opportunities, 'Closed Won');
    }
}