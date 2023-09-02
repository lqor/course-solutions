@isTest
public with sharing class OpportunityService_Exercise12_Test {

    @TestSetup
    static void setup() {
        Account account = new Account();
        account.Name = 'Test Account';
        account.Type = 'Other';

        insert account;

        Opportunity opportunity = new Opportunity();

        opportunity.Name = 'Test Opportunity';
        opportunity.AccountId = account.Id;
        opportunity.Amount = 64000;
        opportunity.CloseDate = System.today().addMonths(2);
        opportunity.Probability = 50;
        opportunity.StageName = 'Closed Won';

        insert opportunity;
    }

    @isTest
    static void updateObject_UnitTest1() {
        Opportunity opportunity = [
            SELECT Name, StageName, Amount, Closedate 
            FROM Opportunity 
            WHERE Name = 'Test Opportunity' 
            LIMIT 1
        ];

        OpportunityService_Exercise12 opportunityService = new OpportunityService_Exercise12();
        
        Test.startTest();
        opportunity.Amount = 15000;
        opportunityService.updateObject(opportunity);
        Test.stopTest();

        Opportunity potentiallyUpdatedOpportunity = [
            SELECT Name, StageName, Amount, CloseDate 
            FROM Opportunity 
            WHERE Name = 'Test Opportunity' 
            LIMIT 1
        ];

        Assert.areNotEqual(64000, potentiallyUpdatedOpportunity.Amount);
        Assert.areEqual(15000, potentiallyUpdatedOpportunity.Amount);
    }

    @isTest
    static void updateObject_UnitTest2() {
        Account account = [SELECT Name FROM Account WHERE Type = 'Other' LIMIT 1];

        OpportunityService_Exercise12 opportunityService = new OpportunityService_Exercise12();
        
        Test.startTest();
        account.Name = 'Super Test Account';
        opportunityService.updateObject(account);
        Test.stopTest();

        Account potentiallyUpdatedAccount = [SELECT Name FROM Account WHERE Type = 'Other' LIMIT 1];

        Assert.areNotEqual('Super Test Account', potentiallyUpdatedAccount.Name);
        Assert.areEqual('Test Account', potentiallyUpdatedAccount.Name);
    }

    @isTest
    static void validateObject_UnitTest1() {
        Opportunity opportunity = [
            SELECT Name, StageName, Amount, Closedate 
            FROM Opportunity 
            WHERE Name = 'Test Opportunity' 
            LIMIT 1
        ];

        OpportunityService_Exercise12 opportunityService= new OpportunityService_Exercise12();

        Test.startTest();
        Boolean isValid = opportunityService.validateObject(opportunity);
        Test.stopTest();

        Assert.isTrue(isValid);
    }

    @isTest
    static void validateObject_UnitTest2() {
        Account account = [SELECT Name FROM Account WHERE Type = 'Other' LIMIT 1];

        OpportunityService_Exercise12 opportunityService= new OpportunityService_Exercise12();

        Test.startTest();
        Boolean isValid = opportunityService.validateObject(account);
        Test.stopTest();

        Assert.isFalse(isValid);
    }

    @isTest
    static void formatRecord_UnitTest1() {
        Opportunity opportunity = new Opportunity();
        opportunity.Name = 'john doe'; 
        opportunity.StageName = 'Prospecting'; 
        opportunity.CloseDate = System.today();

        OpportunityService_Exercise12 opportunityService= new OpportunityService_Exercise12();

        Test.startTest();
        opportunityService.formatRecord(opportunity);
        Test.stopTest();

        Assert.areEqual('John Doe', opportunity.Name);
    }

    @isTest
    static void formatRecord_UnitTest2() {
        Opportunity opportunity = new Opportunity();
        opportunity.Name = 'John doe'; 
        opportunity.StageName = 'Prospecting'; 
        opportunity.CloseDate = System.today();

        OpportunityService_Exercise12 opportunityService= new OpportunityService_Exercise12();

        Test.startTest();
        opportunityService.formatRecord(opportunity);
        Test.stopTest();

        Assert.areEqual('John Doe', opportunity.Name);
    }

    @isTest
    static void formatRecord_UnitTest3() {
        Opportunity opportunity = new Opportunity();
        opportunity.Name = 'j'; 
        opportunity.StageName = 'Prospecting'; 
        opportunity.CloseDate = System.today();

        OpportunityService_Exercise12 opportunityService= new OpportunityService_Exercise12();

        Test.startTest();
        opportunityService.formatRecord(opportunity);
        Test.stopTest();

        Assert.areEqual('J', opportunity.Name);
    }

    @isTest
    static void formatRecord_UnitTest4() {
        Opportunity opportunity = new Opportunity();
        opportunity.Name = ''; 
        opportunity.StageName = 'Prospecting'; 
        opportunity.CloseDate = System.today();

        OpportunityService_Exercise12 opportunityService= new OpportunityService_Exercise12();

        Test.startTest();
        opportunityService.formatRecord(opportunity);
        Test.stopTest();

        Assert.areEqual('', opportunity.Name);
    }
}