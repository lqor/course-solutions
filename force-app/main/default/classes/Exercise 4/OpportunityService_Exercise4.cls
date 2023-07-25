public with sharing class OpportunityService_Exercise4 {

    public Boolean isOpen(Opportunity opportunity) {
        return !opportunity.StageName.contains('Closed');
    }

    public Decimal calculateProbability(Opportunity firstOpportunity, Opportunity secondOpportunity) {     
        return (firstOpportunity.Probability + secondOpportunity.Probability) / 2.0;
    }

    public String getOpportunityDetails(Opportunity opportunity) {       
        String name = 'The opportunity name is: ' + opportunity.Name;
        String amount = '. The opportunity amount is: ' + opportunity.Amount;
        String stage = '. The opportunity stage is: ' + opportunity.StageName + '.';
        String opportunityValues = name + amount + stage;
        
        return opportunityValues;
    } 

    public void doubleAmount(Opportunity opportunity) {
        opportunity.Amount *= 2;
    }
    
    public Opportunity createNewOpportunity(String name, String stageName, Date closeDate, Decimal amount, Id accountId) {
        Opportunity opportunity = new Opportunity();
        
        if(name == null) {
            name = 'Default Opportunity';
        }
        
        if(stageName == null) {
            stageName = 'Prospecting';
        }
        
        if(closeDate == null) {
            closeDate = System.today().addDays(14);
        }
        
        if(amount == null) {
            amount = 250000;
        }
        
        opportunity.Name = name;
        opportunity.StageName = stageName;
        opportunity.CloseDate = closeDate;
        opportunity.Amount = amount;
        opportunity.AccountId = accountId;
        
        return opportunity;
    }

    public Opportunity createNewOpportunity() {
        Opportunity opportunity = new Opportunity();
        
        opportunity.Name = 'Default Opportunity';
        opportunity.StageName = 'Prospecting';
        opportunity.CloseDate = System.today().addDays(14);
        
        return opportunity;
    }
}