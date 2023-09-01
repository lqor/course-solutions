@isTest
public with sharing class OpportunityService_Exercise3_Test {

    @TestSetup
    static void setup() {
        List<Account> testAccounts = new List<Account>();

        Account acc1 = new Account();
        acc1.Name = 'Test Account 1';

        testAccounts.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name = 'Test Account 2';

        testAccounts.add(acc2);

        insert testAccounts;

        List<Opportunity> testOpportunities = new List<Opportunity>();

        Opportunity opp1 = new Opportunity();
        opp1.AccountId = acc1.Id;
        opp1.Amount = 15000;
        opp1.CloseDate = System.today().addDays(30);
        opp1.Name = 'Test Opportunity 1';
        opp1.Probability = 75;
        opp1.StageName = 'Negotiation/Review';

        testOpportunities.add(opp1);

        Opportunity opp2 = new Opportunity();
        opp2.AccountId = acc2.Id;
        opp2.Amount = 200000;
        opp2.CloseDate = System.today().addDays(90);
        opp2.Name = 'Test Opportunity 2';
        opp2.Probability = 55;
        opp2.StageName = 'Perception Analysis';

        testOpportunities.add(opp2);

        insert testOpportunities;
    }

    @isTest
    static void calculateAmount_UnitTest() {
        Opportunity opp1 = [SELECT Amount FROM Opportunity WHERE Name = 'Test Opportunity 1' LIMIT 1];
        Opportunity opp2 = [SELECT Amount FROM Opportunity WHERE Name = 'Test Opportunity 2' LIMIT 1];

        OpportunityService_Exercise3 opportunityService = new OpportunityService_Exercise3();
        
        Test.startTest();
        Decimal actualAmount = opportunityService.calculateAmount(opp1, opp2);
        Test.stopTest();

        Assert.areEqual(215000, actualAmount);
    }

    @isTest
    static void softMerge_UnitTest() {
        Opportunity opp1 = [
            SELECT AccountId, Amount, CloseDate, Name, Probability, StageName 
            FROM Opportunity 
            WHERE Name = 'Test Opportunity 1' LIMIT 1
        ];
        
        Opportunity opp2 = [
            SELECT AccountId, Amount, CloseDate, Name, Probability, StageName 
            FROM Opportunity 
            WHERE Name = 'Test Opportunity 2' LIMIT 1
        ];
        
        OpportunityService_Exercise3 opportunityService = new OpportunityService_Exercise3();

        Test.startTest();
        Opportunity mergedOpportunity = opportunityService.softMerge(opp1, opp2);
        Test.stopTest();
        
        Assert.areEqual(opp1.AccountId, mergedOpportunity.AccountId);
        Assert.areEqual(opp1.Amount, mergedOpportunity.Amount);
        Assert.areEqual(opp1.CloseDate, mergedOpportunity.CloseDate);
        Assert.areEqual(opp2.Name, mergedOpportunity.Name);
        Assert.areEqual(opp2.Probability, mergedOpportunity.Probability);
        Assert.areEqual(opp2.StageName, mergedOpportunity.StageName);
    }

    @isTest
    static void createOpportunityWithAccount_UnitTest() {
        Account testAccount = [SELECT Name FROM Account WHERE Name = 'Test Account 1' LIMIT 1];
        
        OpportunityService_Exercise3 opportunityService = new OpportunityService_Exercise3();

        Test.startTest();
        Opportunity newOpportunity = opportunityService.createOpportunityWithAccount(testAccount);
        Test.stopTest();
        
        Assert.areEqual(testAccount.Id, newOpportunity.AccountId);
        Assert.areEqual(10000, newOpportunity.Amount);
        Assert.areEqual(System.today().addDays(30), newOpportunity.CloseDate);
        Assert.areEqual(testAccount.Name + ' Opportunity', newOpportunity.Name);
        Assert.areEqual(50, newOpportunity.Probability);
        Assert.areEqual('Prospecting', newOpportunity.StageName);
    }

    @isTest
    static void insertOpportunity_UnitTest() {
        Opportunity testOpportunity = new Opportunity();
        testOpportunity.Name = 'Test Opportunity 3';
        testOpportunity.Amount = 5000;
        testOpportunity.CloseDate = Date.today();
        testOpportunity.StageName = 'Closed Won';
        
        
        OpportunityService_Exercise3 opportunityService = new OpportunityService_Exercise3();

        Test.startTest();
        opportunityService.insertOpportunity(testOpportunity);
        Test.stopTest();
        
        List<Opportunity> insertedOpps = [
            SELECT Id, Name, Amount, CloseDate, StageName 
            FROM Opportunity 
            WHERE Id = :testOpportunity.Id
        ];

        Assert.areNotEqual(null, insertedOpps);
        Assert.areEqual(1, insertedOpps.size());
        Assert.areEqual('Test Opportunity 3', insertedOpps.get(0).Name);
        Assert.areEqual(5000, insertedOpps.get(0).Amount);
        Assert.areEqual(Date.today(), insertedOpps.get(0).CloseDate);
        Assert.areEqual('Closed Won', insertedOpps.get(0).StageName);
    }
}