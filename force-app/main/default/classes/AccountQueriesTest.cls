@isTest
public with sharing class AccountQueriesTest {

    @TestSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i;
            acc.Description = 'Test Description ' + i;

            accounts.add(acc);
        }

        insert accounts;
    }

    @isTest
    static void queryAllAccounts_UnitTest() {
        List<Account> queriedAccounts = new List<Account>();
        
        Test.startTest();
        queriedAccounts = AccountQueries.queryAllAccounts();
        Test.stopTest();

        Assert.areEqual(5, queriedAccounts.size(), 'Number of queried accounts is not as expected.');

        for (Integer i = 0; i < 5; i++) {
            Assert.areEqual('Test Account ' + i, queriedAccounts[i].Name, 'Account Name mismatch for index ' + i);
            Assert.areEqual('Test Description ' + i, queriedAccounts[i].Description, 'Account Description mismatch for index ' + i);
        }
    }
}
