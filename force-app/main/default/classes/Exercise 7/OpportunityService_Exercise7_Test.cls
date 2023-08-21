@isTest
public with sharing class OpportunityService_Exercise7_Test {

    @TestSetup
    static void setup() {
        List<Opportunity> opportunities = new List<Opportunity>();

        Opportunity opp1 = new Opportunity();
        opp1.Name = 'Test Opportunity 1';
        opp1.Amount = 15000;
        opp1.StageName = 'Closed Won';
        opp1.CloseDate = System.today();

        opportunities.add(opp1);

        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity 2';
        opp2.Amount = 19000;
        opp2.StageName = 'Perception Analysis';
        opp2.CloseDate = System.today().addDays(30);

        opportunities.add(opp2);

        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity 3';
        opp3.Amount = 30000;
        opp3.StageName = 'Perception Analysis';
        opp3.CloseDate = System.today().addDays(45);

        opportunities.add(opp3);

        insert opportunities;
    }

    @isTest
    static void createOpportunities_UnitTest() {
        OpportunityService_Exercise7 opportunityService = new OpportunityService_Exercise7();

        Integer n = 5;

        Test.startTest();
        List<Opportunity> opportunities = opportunityService.createOpportunities(n);
        Test.stopTest();

        Assert.areEqual(n, opportunities.size());

        for (Opportunity opportunity : opportunities) {
            Assert.areEqual('Default Opportunity ' + String.valueOf(n + 1), opportunity.Name);
        }
    }

    @isTest
    static void createNewOpportunity_UnitTest() {
        OpportunityService_Exercise7 opportunityService = new OpportunityService_Exercise7();

        Test.startTest();
        Opportunity opp = opportunityService.createNewOpportunity();
        Test.stopTest();

        Assert.areEqual('Default Opportunity', opp.Name);
        Assert.areEqual('Prospecting', opp.StageName);
        Assert.areEqual(System.today().addDays(14), opp.CloseDate);
    }

    @isTest
    static void getRandomStageName_UnitTest() {
        List<String> existingStageNames = new List<String>();
        
        existingStageNames.add('Prospecting');
        existingStageNames.add('Qualification');
        existingStageNames.add('Needs Analysis');
        existingStageNames.add('Value Proposition');
        existingStageNames.add('Id. Decision Makers');
        existingStageNames.add('Perception Analysis');
        existingStageNames.add('Proposal/Price Quote');
        existingStageNames.add('Negotiation/Review');
        existingStageNames.add('Closed Won');
        existingStageNames.add('Closed Lost');

        OpportunityService_Exercise7 opportunityService = new OpportunityService_Exercise7();

        List<String> randomStageNames = new List<String>();

        Test.startTest();
        for (Integer index = 0; index < 10; index++) {
            String randomStageName = opportunityService.getRandomStageName();
            randomStageNames.add(randomStageName);
        }
        Test.stopTest();

        for (String randomStageName : randomStageNames) {
            Assert.isTrue(existingStageNames.contains(randomStageName));
        }
    }

    @isTest
    static void calculateTotalRevenue_UnitTest() {
        List<Opportunity> opportunities = [SELECT Amount FROM Opportunity WHERE Name LIKE 'Test Opportunity%'];

        OpportunityService_Exercise7 opportunityService = new OpportunityService_Exercise7();

        Test.startTest();
        Double totalRevenue = opportunityService.calculateTotalRevenue(opportunities);
        Test.stopTest();

        Assert.areEqual(64000, totalRevenue);
    }

    @isTest
    static void filterOpportunitiesByStage_UnitTest() {
        List<Opportunity> opportunities = [SELECT StageName FROM Opportunity WHERE Name LIKE 'Test Opportunity%'];
        
        OpportunityService_Exercise7 opportunityService = new OpportunityService_Exercise7();
        
        Test.startTest();
        List<Opportunity> perceptionAnalysisOpportunities = opportunityService.filterOpportunitiesByStage(opportunities, 'Perception Analysis');
        Test.stopTest();

        Assert.areEqual(2, perceptionAnalysisOpportunities.size());

        for (Opportunity opportunity : perceptionAnalysisOpportunities) {
            Assert.areEqual('Perception Analysis', opportunity.StageName);
        }
    }

    @isTest
    static void filterClosedWonOpportunities_UnitTest() {
        List<Opportunity> opportunities = [SELECT StageName FROM Opportunity WHERE Name LIKE 'Test Opportunity%'];
        
        OpportunityService_Exercise7 opportunityService = new OpportunityService_Exercise7();
        
        Test.startTest();
        List<Opportunity> closedWonOpportunities = opportunityService.filterClosedWonOpportunities(opportunities);
        Test.stopTest();

        Assert.areEqual(1, closedWonOpportunities.size());

        for (Opportunity opportunity : closedWonOpportunities) {
            Assert.areEqual('Closed Won', opportunity.StageName);
        }
    }
}