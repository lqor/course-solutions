@isTest
public with sharing class AccountService_Exercise4_Test {

    @TestSetup
    static void setup() {
        List<Account> accounts = new List<Account>();

        Account testAccount = new Account();
        testAccount.Name = 'Test Account';
        testAccount.Type = 'No Tier';
        testAccount.AnnualRevenue = 0;
        accounts.add(testAccount);
        
        Account regularAccount1 = new Account();
        regularAccount1.Name = 'Regular Account 1';
        regularAccount1.Type = 'Silver Tier';
        regularAccount1.AnnualRevenue = 45000;
        accounts.add(regularAccount1);

        Account regularAccount2 = new Account();
        regularAccount2.Name = 'Regular Account 2';
        regularAccount2.Type = 'Golden Tier';
        regularAccount2.AnnualRevenue = 150000;
        accounts.add(regularAccount2);

        Account regularAccount3 = new Account();
        regularAccount3.Name = 'Regular Account 3';
        regularAccount3.Type = 'VIP Tier';
        regularAccount3.AnnualRevenue = 350000;
        accounts.add(regularAccount3);

        insert accounts;
    }

    @isTest
    static void testGetAccountSummary_UnitTest() {
        Account testAccount = [SELECT Name, Type, AnnualRevenue FROM Account WHERE Name = 'Test Account'];
        Account regularAccount = [SELECT Name, Type, AnnualRevenue FROM Account WHERE Name = 'Regular Account 1'];

        AccountService_Exercise4 accountService = new AccountService_Exercise4();

        Test.startTest();
        String testAccoutSummary = accountService.getAccountSummary(testAccount);
        String regularAccoutSummary = accountService.getAccountSummary(testAccount);
        Test.stopTest();    
        
        String expectedTestAccoutSummary = 'The account name is: Test Account. The account type is: No Tier. The account annual revenue is: $0.';
        String expectedRegularAccoutSummary = 'The account name is: Regular Account 1. The account type is: Silver Tier. The account annual revenue is: $45000.';

        Assert.areEqual(expectedTestAccoutSummary, testAccoutSummary);
        Assert.areEqual(expectedRegularAccoutSummary , expectedRegularAccoutSummary);
    }

    @isTest
    static void testIsTestAccount_UnitTest() {
        Account testAccount = [SELECT Name, Type, AnnualRevenue FROM Account WHERE Name = 'Test Account'];
        Account regularAccount = [SELECT Name, Type, AnnualRevenue FROM Account WHERE Name = 'Regular Account 1'];

        AccountService_Exercise4 accountService = new AccountService_Exercise4();

        Test.startTest();
        Boolean isTestForTest = accountService.isTestAccount(testAccount);
        Boolean isTestForRegular = accountService.isTestAccount(regularAccount);
        Test.stopTest();  

        Assert.areEqual(true, isTestForTest);
        Assert.areEqual(false, isTestForRegular);
    }

    @isTest
    static void testPrintAccountTier_UnitTest() {
        Account noTierAccount = [
            SELECT Name, Type, AnnualRevenue 
            FROM Account 
            WHERE AnnualRevenue <= 0 
            LIMIT 1
        ];

        Account silverTierAccount = [
            SELECT Name, Type, AnnualRevenue 
            FROM Account 
            WHERE AnnualRevenue > 0 AND AnnualRevenue < 50000 
            LIMIT 1
        ];

        Account goldenTierAccount = [
            SELECT Name, Type, AnnualRevenue 
            FROM Account 
            WHERE AnnualRevenue >= 50000 AND AnnualRevenue < 300000 
            LIMIT 1
        ];

        Account vipTierAccount = [
            SELECT Name, Type, AnnualRevenue 
            FROM Account 
            WHERE AnnualRevenue >= 300000 
            LIMIT 1
        ];

        AccountService_Exercise4 accountService = new AccountService_Exercise4();

        Test.startTest();
        String noTier = accountService.printAccountTier(noTierAccount);
        String silverTier = accountService.printAccountTier(silverTierAccount);
        String goldenTier = accountService.printAccountTier(goldenTierAccount);
        String vipTier = accountService.printAccountTier(vipTierAccount);
        Test.stopTest();  

        Assert.areEqual('No Tier', noTier);
        Assert.areEqual('Silver Tier', silverTier);
        Assert.areEqual('Golden Tier', goldenTier);
        Assert.areEqual('VIP Tier', vipTier);
    }

    @isTest
    static void testCreateNewAccount_UnitTest() {
        AccountService_Exercise4 accountService = new AccountService_Exercise4();

        Test.startTest();
        Account newAccount = accountService.createNewAccount('New Account', 'Regular', '12345');
        Test.stopTest();

        Assert.areEqual('New Account', newAccount.Name);
        Assert.areEqual('Regular', newAccount.Type);
        Assert.areEqual('12345', newAccount.AccountNumber);
    }
}