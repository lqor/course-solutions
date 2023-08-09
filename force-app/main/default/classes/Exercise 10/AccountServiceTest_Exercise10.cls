@isTest
public with sharing class AccountServiceTest_Exercise10 {

    @isTest
    static void createIndustryMap_UnitTest() {
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(
            new Account(
                Name='Test Account 1', 
                Industry='Industry A'
            )
        );
        testAccounts.add(
            new Account(
                Name='Test Account 2', 
                Industry='Industry B'
            )
        );
        testAccounts.add(
            new Account(
                Name='Test Account 3', 
                Industry='Industry A'
            )
        );

        AccountService_Exercise10 accountService = new AccountService_Exercise10();

        Test.startTest();
        Map<String, List<Account>> resultIndustryMap = accountService.createIndustryMap(testAccounts);
        Test.stopTest();

        Assert.areEqual(2, resultIndustryMap.size());
        Assert.areEqual(2, resultIndustryMap.get('Industry A').size());
        Assert.areEqual(1, resultIndustryMap.get('Industry B').size());
    }

    @isTest
    static void updateAccountsWithContacts_UnitTest() {
        Account acc1 = new Account(
            Name='Account 1'
        );
        Account acc2 = new Account(
            Name='Account 2'
        );

        insert new List<Account>{acc1, acc2};

        Contact con1 = new Contact(
            AccountId=acc1.Id, 
            LastName='Contact 1'
        );
        Contact con2 = new Contact(
            AccountId=acc2.Id, 
            LastName='Contact 2'
        );

        insert new List<Contact>{con1, con2};

        AccountService_Exercise10 accountService = new AccountService_Exercise10();

        Test.startTest();
        accountService.updateAccountsWithContacts();
        Test.stopTest();

        Account updatedAcc1 = [SELECT Id, Name, Description FROM Account WHERE Id = :acc1.Id];
        Account updatedAcc2 = [SELECT Id, Name, Description FROM Account WHERE Id = :acc2.Id];

        Assert.areEqual(true, updatedAcc1.Description.contains('Contact 1'));
        Assert.areEqual(true, updatedAcc2.Description.contains('Contact 2'));
    }
}

