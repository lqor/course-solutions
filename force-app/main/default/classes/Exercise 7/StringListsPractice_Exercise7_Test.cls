@isTest
public with sharing class StringListsPractice_Exercise7_Test {

    @isTest
    static void concatenateList_UnitTest() {
        StringListsPractice_Exercise7 obj = new StringListsPractice_Exercise7();

        List<String> words = new List<String>{'Hello', ' ', 'world', '!'};

        Test.startTest();
        String concatenatedResult = obj.concatenateList(words);
        Test.stopTest();

        Assert.areEqual('Hello world!', concatenatedResult);
    }

    @isTest
    static void reverseWordsAndOrder_v1_UnitTest() {
        List<String> words = new List<String>{'Hello', 'world'};

        StringListsPractice_Exercise7 obj = new StringListsPractice_Exercise7();

        Test.startTest();
        List<String> reversedResult = obj.reverseWordsAndOrder_v1(words);
        Test.stopTest();

        Assert.areEqual('dlrow', reversedResult.get(0));
        Assert.areEqual('olleH', reversedResult.get(1));
    }

    @isTest
    static void reverseWordsAndOrder_v2_UnitTest() {
        List<String> words = new List<String>{'Hello', 'world'};
        
        StringListsPractice_Exercise7 obj = new StringListsPractice_Exercise7();

        Test.startTest();
        List<String> reversedResult = obj.reverseWordsAndOrder_v2(words);
        Test.stopTest();

        List<String> expected = new List<String>{'dlrow', 'olleH'};

        Assert.areEqual('dlrow', reversedResult.get(0));
        Assert.areEqual('olleH', reversedResult.get(1));
    }
}