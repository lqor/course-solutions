@isTest
public with sharing class OpportunityQueriesTest {

    @TestSetup
    static void setup() {  
        List<Account> accounts = new List<Account>();

        Account acc1 = new Account();
        acc1.Name ='Test Account 1';
        accounts.add(acc1);

        Account acc2 = new Account();
        acc2.Name ='Test Account 2';
        accounts.add(acc2);

        insert accounts;
        
        List<Opportunity> opportunities = new List<Opportunity>();
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'Opportunity 1';
        opp1.Amount = 5000;
        opp1.StageName = 'Prospecting';
        opp1.CloseDate = Date.today().addDays(30);
        opp1.AccountId = acc1.Id;
        opportunities.add(opp1);

        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Opportunity 2';
        opp2.Amount = 7500;
        opp2.StageName = 'Closed Lost';
        opp2.CloseDate = Date.today().addDays(15);
        opp2.AccountId = acc2.Id;
        opportunities.add(opp2);

        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Opportunity 3';
        opp3.Amount = 10000;
        opp3.StageName = 'Closed Won';
        opp3.CloseDate = Date.today().addDays(45);
        opportunities.add(opp3);
        
        insert opportunities;
    }

    @IsTest
    static void queryOpportunitiesByStage_UnitTest() {
        List<Opportunity> results;

        Test.startTest();
        results = OpportunityQueries.queryOpportunitiesByStage('Prospecting');
        Test.stopTest();

        Assert.areEqual(1, results.size(), 'Should return 1 opportunity with Prospecting stage');
    }

    @IsTest
    static void queryOpportunitiesByAmountAndStage_UnitTest() {
        List<Opportunity> results;

        Test.startTest();
        results = OpportunityQueries.queryOpportunitiesByAmountAndStage(10000, 'Closed Won');
        Test.stopTest();

        Assert.areEqual(1, results.size(), 'Should return 1 opportunity with Amount >= 10000 and Closed Won stage');
    }

    @IsTest
    static void queryOpportunitiesByCreatedDate_UnitTest() {
        Date startDate = Date.today().addDays(-30);
        Date endDate = Date.today().addDays(10);

        Test.startTest();
        List<Opportunity> results = OpportunityQueries.queryOpportunitiesByCreatedDate(startDate, endDate);
        Test.stopTest();

        Assert.areEqual(3, results.size(), 'Should return 3 opportunities created in the last 30 days');
    }

    @IsTest
    static void queryOpportunitiesByAmount_UnitTest() {
        List<Opportunity> results; 

        Test.startTest();
        results = OpportunityQueries.queryOpportunitiesByAmount(7500);
        Test.stopTest();
        
        Assert.areEqual(2, results.size(), 'Should return 2 opportunities with Amount >= 7500');
    }

    @IsTest
    static void queryOpportunitiesByCloseDate_UnitTest() {
        Date closeDate = Date.today().addDays(15);

        Test.startTest();
        List<Opportunity> results = OpportunityQueries.queryOpportunitiesByCloseDate(closeDate);
        Test.stopTest();

        Assert.areEqual(1, results.size(), 'Should return 1 opportunity with Close Date = Today + 15 days');
    }

    @IsTest
    static void queryOpportunitiesByCloseDateAndNotClosedLost_UnitTest() {
        Date pastDate = Date.today().addDays(15);
        
        Test.startTest();
        List<Opportunity> results = OpportunityQueries.queryOpportunitiesByCloseDateAndNotClosedLost(pastDate);
        Test.stopTest();

        Assert.areEqual(2, results.size(), 'Should return 1 opportunity with Close Date > Today - 15 days and not Closed Lost stage');
    }

    @IsTest
    static void queryOpportunitiesByAccountId_UnitTest() {
        List<Account> accounts = [SELECT Id FROM Account WHERE Name LIKE '%Test Account%'];

        Set<Id> accountIds = new Set<Id>();

        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }

        Test.startTest();
        List<Opportunity> results = OpportunityQueries.queryOpportunitiesByAccountId(accountIds);
        Test.stopTest();
    
        Assert.areEqual(2, results.size(), 'Should return at 2 opportunity associated with 2 test accounts');
    }
}