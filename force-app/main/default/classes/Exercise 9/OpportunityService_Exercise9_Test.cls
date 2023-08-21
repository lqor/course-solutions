@isTest
public with sharing class OpportunityService_Exercise9_Test {

    @TestSetup
    static void setup() {
        List<Opportunity> testOpportunities = new List<Opportunity>();

        for (Integer i = 1; i <= 5; i++) {
            Opportunity opp = new Opportunity();

            opp.Name = 'Test Opportunity ' + i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today();
            opp.Amount = 1000 * i;
            opp.Probability = 100;

            testOpportunities.add(opp);
        }

        insert testOpportunities;
    }
    
    @isTest
    static void changeProbabilityBasedOnAmount_UnitTest() {
        
        OpportunityService_Exercise9 opportunityService = new OpportunityService_Exercise9();

        Test.startTest();
        opportunityService.changeProbabilityBasedOnAmount(3000);
        Test.stopTest();

        List<Opportunity> opportunitiesExpectedToBeUpdated = [SELECT Probability, Amount FROM Opportunity WHERE Amount >= 3000];
        
        Assert.areEqual(3, opportunitiesExpectedToBeUpdated.size());

        for (Opportunity opp : opportunitiesExpectedToBeUpdated) {
            Assert.areEqual(50, opp.Probability);
        }
    }
}