@isTest
public with sharing class OpportunityService_Exercise4_Test {

    @TestSetup
    static void setup() {
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'Test Opportunity 1';
        opp1.Amount = 50000;
        opp1.StageName = 'Qualification';
        opp1.Probability = 50;
        opp1.CloseDate = System.today().addDays(14);

        insert opp1;

        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity 2';
        opp2.Amount = 75000;
        opp2.StageName = 'Closed Won';
        opp2.Probability = 100;
        opp2.CloseDate = System.today().addDays(-7);

        insert opp2;

        Account acc = new Account();
        acc.Name = 'Test Account';

        insert acc;
    }

    @isTest
    static void isOpen_UnitTest() {
        Opportunity openOpportunity = [SELECT Name, Amount, StageName, Probability FROM Opportunity WHERE StageName = 'Qualification' LIMIT 1];
        Opportunity closedOpportunity = [SELECT Name, Amount, StageName, Probability FROM Opportunity WHERE StageName = 'Closed Won' LIMIT 1];

        OpportunityService_Exercise4 opportunityService = new OpportunityService_Exercise4();

        Test.startTest();
        Boolean checkOpenOpportunity = opportunityService.isOpen(openOpportunity);
        Boolean checkClosedOpportunity = opportunityService.isOpen(closedOpportunity);
        Test.stopTest();
        

        Assert.areEqual(true, checkOpenOpportunity);
        Assert.areEqual(false, checkClosedOpportunity);
    }

    @isTest
    static void calculateProbability_UnitTest() {
        Opportunity opportunity1 = [SELECT Name, Amount, StageName, Probability FROM Opportunity WHERE StageName = 'Qualification' LIMIT 1];
        Opportunity opportunity2 = [SELECT Name, Amount, StageName, Probability FROM Opportunity WHERE StageName = 'Closed Won' LIMIT 1];

        OpportunityService_Exercise4 opportunityService = new OpportunityService_Exercise4();

        Test.startTest();
        Decimal probability = opportunityService.calculateProbability(opportunity1, opportunity2);
        Test.stopTest();

        Assert.areEqual(75, probability);
    }

    @isTest
    static void getOpportunityDetails_UnitTest() {
        Opportunity openOpportunity = [SELECT Name, Amount, StageName, Probability FROM Opportunity WHERE StageName = 'Qualification' LIMIT 1];
        Opportunity closedOpportunity = [SELECT Name, Amount, StageName, Probability FROM Opportunity WHERE StageName = 'Closed Won' LIMIT 1];

        OpportunityService_Exercise4 opportunityService = new OpportunityService_Exercise4();

        Test.startTest();
        String actualOpenOpportunityDetails = opportunityService.getOpportunityDetails(openOpportunity);
        String actualClosedOpportunityDetails = opportunityService.getOpportunityDetails(closedOpportunity);
        Test.stopTest();

        String expectedOpenOpportunityDetails = 'The opportunity name is: Test Opportunity 1. The opportunity amount is: 50000.00. The opportunity stage is: Qualification.';
        String expectedClosedOpportunityDetails = 'The opportunity name is: Test Opportunity 2. The opportunity amount is: 75000.00. The opportunity stage is: Closed Won.';

        Assert.areEqual(expectedOpenOpportunityDetails, actualOpenOpportunityDetails);
        Assert.areEqual(expectedClosedOpportunityDetails, actualClosedOpportunityDetails);
    }

    @isTest
    static void doubleAmount_UnitTest() {
        Opportunity opportunity = [SELECT Amount FROM Opportunity WHERE StageName = 'Qualification' LIMIT 1];

        Decimal oldAmount = opportunity.Amount;

        OpportunityService_Exercise4 opportunityService = new OpportunityService_Exercise4();

        Test.startTest();
        opportunityService.doubleAmount(opportunity);
        Test.stopTest();

        Decimal expectedNewAmount = oldAmount * 2;

        Assert.areNotEqual(oldAmount, opportunity.Amount);
        Assert.areEqual(expectedNewAmount, opportunity.Amount);
    }

    @isTest
    static void createNewOpportunity_UnitTest1() {
        Account account = [SELECT Name FROM Account WHERE Name = 'Test Account' LIMIT 1];

        Id expectedAccountId = account.Id;

        OpportunityService_Exercise4 opportunityService = new OpportunityService_Exercise4();

        Test.startTest();
        Opportunity opportunity = opportunityService.createNewOpportunity(
            'Test Opportunity 3', 
            'Needs Analysis', 
            System.today().addDays(20), 
            9999, 
            account.Id
        );
        Test.stopTest();

        Assert.areNotEqual(null, opportunity);
        Assert.areEqual('Test Opportunity 3', opportunity.Name);
        Assert.areEqual('Needs Analysis', opportunity.StageName);
        Assert.areEqual(System.today().addDays(20), opportunity.CloseDate);
        Assert.areEqual(9999, opportunity.Amount);
        Assert.areEqual(expectedAccountId, opportunity.AccountId);
    }

    @isTest
    static void createNewOpportunity_UnitTest2() {
        Account account = [SELECT Name FROM Account WHERE Name = 'Test Account' LIMIT 1];

        Id expectedAccountId = account.Id;

        OpportunityService_Exercise4 opportunityService = new OpportunityService_Exercise4();

        Test.startTest();
        Opportunity opportunity = opportunityService.createNewOpportunity(null, null, null, null, account.Id);
        Test.stopTest();

        Assert.areNotEqual(null, opportunity);
        Assert.areNotEqual(null, opportunity.Name);
        Assert.areNotEqual(null, opportunity.StageName);
        Assert.areNotEqual(null, opportunity.CloseDate);
        Assert.areNotEqual(null, opportunity.Amount);

        Assert.areEqual('Default Opportunity', opportunity.Name);
        Assert.areEqual('Prospecting', opportunity.StageName);
        Assert.areEqual(System.today().addDays(14), opportunity.CloseDate);
        Assert.areEqual(250000, opportunity.Amount);
        Assert.areEqual(expectedAccountId, opportunity.AccountId);
    }

    @isTest
    static void createNewOpportunity_UnitTest3() {
        OpportunityService_Exercise4 opportunityService = new OpportunityService_Exercise4();

        Test.startTest();
        Opportunity opportunity = opportunityService.createNewOpportunity();
        Test.stopTest();

        Assert.areNotEqual(null, opportunity);
        Assert.areEqual('Default Opportunity', opportunity.Name);
        Assert.areEqual('Prospecting', opportunity.StageName);
        Assert.areEqual(System.today().addDays(14), opportunity.CloseDate);
    }
}