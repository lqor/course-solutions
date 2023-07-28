@isTest
public with sharing class OpportunityServiceTest_Exercise10 {
    
    @TestSetup
    static void setup() {
        Account account1 = new Account(Name = 'Magic Mountain');
        Account account2 = new Account(Name = 'Lego Land');
        insert new List<Account> {account1, account2};

        Opportunity opportunity1 = new Opportunity();
        Opportunity opportunity2 = new Opportunity();
        Opportunity opportunity3 = new Opportunity();
        Opportunity opportunity4 = new Opportunity();
        
        opportunity1.AccountId = account1.Id;
        opportunity1.Amount = 64000;
        opportunity1.CloseDate = System.today().addMonths(2);
        opportunity1.Name = 'Test Opportunity One';
        opportunity1.Probability = 50;
        opportunity1.StageName = 'Closed Won';

        opportunity2.AccountId = account2.Id;
        opportunity2.Amount = 100000;
        opportunity2.CloseDate = System.today().addDays(15);
        opportunity2.Name = 'Test Opportunity Two';
        opportunity2.Probability = 15;
        opportunity2.StageName = 'Qualification';

        opportunity3.AccountId = account1.Id;
        opportunity3.Amount = 3000;
        opportunity3.CloseDate = System.today().addDays(7);
        opportunity3.Name = 'Test Opportunity Three';
        opportunity3.Probability = 100;
        opportunity3.StageName = 'Closed Won';

        opportunity4.AccountId = account1.Id;
        opportunity4.Amount = 17500;
        opportunity4.CloseDate = System.today().addMonths(-6);
        opportunity4.Name = 'Test Opportunity Four';
        opportunity4.Probability = 75;
        opportunity4.StageName = 'Proposal/Price Quote';

        insert new List<Opportunity>{opportunity1, opportunity2, opportunity3, opportunity4};
    }

    @IsTest 
    static void summarizeOpportunityStages_UnitTest() {
        List<Opportunity> opportunities = [SELECT StageName FROM Opportunity WHERE StageName != null];

        OpportunityService_Exercise10 opportunityService = new OpportunityService_Exercise10();

        Test.startTest();
        Map<String, Integer> opportunitiesByStage = opportunityService.summarizeOpportunityStages(opportunities);
        Test.stopTest();

        Assert.areEqual(2, opportunitiesByStage.get('Closed Won'));
        Assert.areEqual(1, opportunitiesByStage.get('Qualification'));
        Assert.areEqual(1, opportunitiesByStage.get('Proposal/Price Quote'));
    }

    @IsTest 
    static void countOpportunitiesPerAccount_UnitTest() {
        List<Opportunity> opportunities = [SELECT AccountId, Name FROM Opportunity ];

        OpportunityService_Exercise10 opportunityService = new OpportunityService_Exercise10();

        Test.startTest();
        Map<Id, Integer> opportunitiesPerAccount = opportunityService.countOpportunitiesPerAccount(opportunities);
        Test.stopTest();

        List<Account> accounts = [SELECT Id, Name FROM Account];

        for(Account account : accounts) {
            if(account.Name == 'Magic Mountain') {
                Assert.areEqual(3, opportunitiesPerAccount.get(account.Id));
            } else if(account.Name == 'Lego Land') {
                Assert.areEqual(1, opportunitiesPerAccount.get(account.Id));
            }
        }
    }
}