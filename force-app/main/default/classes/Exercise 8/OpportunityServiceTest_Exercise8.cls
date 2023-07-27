@isTest
public with sharing class OpportunityServiceTest_Exercise8 {

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
    static void updateOpportunityCloseDates_UnitTest() {
        String stage = 'Qualification';
        Integer daysToAdd = 5;

        OpportunityService_Exercise8 opportunityService = new OpportunityService_Exercise8();

        Test.startTest();
        opportunityService.updateOpportunityCloseDates(stage, daysToAdd);
        Test.stopTest();

        Opportunity changedOpp = [SELECT CloseDate FROM Opportunity WHERE StageName = 'Qualification' LIMIT 1];

        Assert.areEqual(System.today().addDays(20), changedOpp.CloseDate);
    }

    @IsTest 
    static void closeOldOpportunities_UnitTest() {
        Integer amountOfMonths = 5;
        Date pastDate = System.today().addMonths(amountOfMonths * -1);

        OpportunityService_Exercise8 service = new OpportunityService_Exercise8();

        Test.startTest();
        service.closeOldOpportunities(amountOfMonths);
        Test.stopTest();
        
        List<Opportunity> opportunities = [SELECT StageName FROM Opportunity WHERE CloseDate > :pastDate]; 

        Assert.areEqual(OpportunityService_Exercise8.CLOSED_LOST_OPP_STAGE, opportunities.get(0).StageName);
    }

    @IsTest 
    static void addTimeToOpportunities_UnitTest() {
        List<Account> existingAccounts = [SELECT Name FROM Account WHERE Name = 'Magic Mountain' OR Name = 'Lego Land'];

        Set<Id> accountIds = new Set<Id>();
        for (Account account : existingAccounts) {
            accountIds.add(account.Id);
            System.debug(account.Id);
        }

        Opportunity oldOpportunity1 = fetchOpportunityByName('Test Opportunity One');
        Opportunity oldOpportunity2 = fetchOpportunityByName('Test Opportunity Two');
        Opportunity oldOpportunity3 = fetchOpportunityByName('Test Opportunity Three');
        Opportunity oldOpportunity4 = fetchOpportunityByName('Test Opportunity Four');

        OpportunityService_Exercise8 service = new OpportunityService_Exercise8();

        Test.startTest();
        service.addTimeToOpportunities(accountIds, 7);
        Test.stopTest();

        Opportunity updatedOpportunity1 = fetchOpportunityByName('Test Opportunity One');
        Opportunity updatedOpportunity2 = fetchOpportunityByName('Test Opportunity Two');
        Opportunity updatedOpportunity3 = fetchOpportunityByName('Test Opportunity Three');
        Opportunity updatedOpportunity4 = fetchOpportunityByName('Test Opportunity Four');

        Assert.areEqual(7, oldOpportunity1.CloseDate.daysBetween(updatedOpportunity1.CloseDate));
        Assert.areEqual(7, oldOpportunity2.CloseDate.daysBetween(updatedOpportunity2.CloseDate));
        Assert.areEqual(7, oldOpportunity3.CloseDate.daysBetween(updatedOpportunity3.CloseDate));
        Assert.areEqual(7, oldOpportunity4.CloseDate.daysBetween(updatedOpportunity4.CloseDate));
    } 

    public static Opportunity fetchOpportunityByName(String opportunityName) {
        return [
            SELECT Id, Name, StageName, CloseDate, Amount 
            FROM Opportunity
            WHERE Name = :opportunityName LIMIT 1
        ].get(0);
    }
}