public with sharing class OpportunityService_Exercise3 {

    public static final String NEEDS_ANALYSIS_OPP_STAGE = 'Needs Analysis';
       
    public Decimal calculateAmount(Opportunity firstOpportunity, Opportunity secondOpportunity) {
        if(
            firstOpportunity == null || 
            secondOpportunity == null || 
            firstOpportunity.Amount == null || 
            secondOpportunity.Amount == null
        ) {
            return 0.0;
        }
        
        return firstOpportunity.Amount + secondOpportunity.Amount;
    }

    public void insertOpportunity(Opportunity opportunity) {
        if(opportunity == null) {
            return;
        }
        
        insert opportunity;
    }

    public Opportunity softMerge(Opportunity firstOpportunity, Opportunity secondOpportunity) {
        Opportunity returnOpportunity = new Opportunity();
        
        returnOpportunity.AccountId = firstOpportunity.AccountId;
        returnOpportunity.Amount = firstOpportunity.Amount;
        returnOpportunity.CloseDate = firstOpportunity.CloseDate;
        
        returnOpportunity.Name = secondOpportunity.Name;
        returnOpportunity.Probability = secondOpportunity.Probability;
        returnOpportunity.StageName = secondOpportunity.StageName;
        
        return returnOpportunity;
    }
    
    public Opportunity createOpportunityWithAccount(Account account) {
        Opportunity opportunity = new Opportunity();
        
        opportunity.AccountId = account.Id;
        opportunity.Amount = 2500;
        opportunity.CloseDate = System.today().addDays(14);
        opportunity.Name = account.Name + ' Installations';
        opportunity.Probability = 20;
        opportunity.StageName = NEEDS_ANALYSIS_OPP_STAGE;
        
        return opportunity;
    }
}