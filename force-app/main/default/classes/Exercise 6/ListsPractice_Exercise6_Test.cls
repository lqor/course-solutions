@isTest
public with sharing class ListsPractice_Exercise6_Test {

    @isTest
    static void getRandomNumberInRange_UnitTest() {
        ListsPractice_Exercise6 obj = new ListsPractice_Exercise6();
        
        Test.startTest();
        Integer randomNumber = obj.getRandomNumberInRange(5, 10);
        Test.stopTest();
        
        Assert.areEqual(true, randomNumber >= 5 && randomNumber <= 10);
    }

    @isTest
    static void getAllColors_UnitTest() {
        ListsPractice_Exercise6 obj = new ListsPractice_Exercise6();
        
        Test.startTest();
        List<String> allColors = obj.getAllColors();
        Test.stopTest();
        
        Assert.areEqual(7, allColors.size());
        Assert.isTrue(allColors.contains('red'));
        Assert.isTrue(allColors.contains('orange'));
        Assert.isTrue(allColors.contains('yellow'));
        Assert.isTrue(allColors.contains('green'));
        Assert.isTrue(allColors.contains('blue'));
        Assert.isTrue(allColors.contains('indigo'));
        Assert.isTrue(allColors.contains('violet'));
    }

    @isTest
    static void getRandomStringFromList_UnitTest() {
        List<String> words = new List<String>{'apple', 'banana', 'cherry', 'date'};

        ListsPractice_Exercise6 obj = new ListsPractice_Exercise6();
        
        Test.startTest();
        String randomString = obj.getRandomStringFromList(words);
        Test.stopTest();
        
        Assert.isTrue(words.contains(randomString));
    }

    @isTest
    static void mergeTwoStringListsAndSort_UnitTest() {
        ListsPractice_Exercise6 obj = new ListsPractice_Exercise6();

        List<String> wordsOne = new List<String>{'apple', 'banana'};
        List<String> wordsTwo = new List<String>{'cherry', 'date'};
        
        Test.startTest();
        List<String> mergedAndSorted = obj.mergeTwoStringListsAndSort(wordsOne, wordsTwo);
        Test.stopTest();

        List<String> expected = new List<String>{'apple', 'banana', 'cherry', 'date'};
        Assert.areEqual(expected, mergedAndSorted);
    }

    @isTest
    static void getFirstNCharacters_UnitTest() {
        ListsPractice_Exercise6 obj = new ListsPractice_Exercise6();
        
        Test.startTest();
        List<String> firstNChars = obj.getFirstNCharacters('hello', 3);
        Test.stopTest();
        
        List<String> expected = new List<String>{'h', 'e', 'l'};

        Assert.areEqual(expected, firstNChars);
    }

    @isTest
    static void getListWithFiveRandomNumbers_UnitTest() {
        ListsPractice_Exercise6 obj = new ListsPractice_Exercise6();
        
        Test.startTest();
        List<Integer> numbers = obj.getListWithFiveRandomNumbers();
        Test.stopTest();
   
        Assert.areEqual(5, numbers.size());

        for (Integer num : numbers) {
            Assert.isTrue(num >= 0 && num <= 100);
        }
    }

    @isTest
    static void isListSizeInRange_UnitTest() {
        List<Integer> numbers = new List<Integer>{10, 20, 30};

        ListsPractice_Exercise6 obj = new ListsPractice_Exercise6();
        Test.startTest();
        Boolean result = obj.isListSizeInRange(numbers, 1, 5);
        Test.stopTest();
        
        Assert.areEqual(true, result);
    }
}