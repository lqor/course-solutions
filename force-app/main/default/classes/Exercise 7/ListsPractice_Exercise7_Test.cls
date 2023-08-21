@isTest
public with sharing class ListsPractice_Exercise7_Test {

    @isTest
    static void sumList_UnitTest1() {
        List<Integer> numbers = new List<Integer>{1, 2, 3, 4, 5};

        ListsPractice_Exercise7 obj = new ListsPractice_Exercise7();

        Test.startTest();
        Integer sum = obj.sumList(numbers);
        Test.stopTest();    
        
        Assert.areEqual(15, sum);
    }

    static void sumList_UnitTest2() {
        List<Integer> numbers = new List<Integer>{-1, 2, 0, 4, -15};

        ListsPractice_Exercise7 obj = new ListsPractice_Exercise7();

        Test.startTest();
        Integer sum = obj.sumList(numbers);
        Test.stopTest();    
        
        Assert.areEqual(-10, sum);
    }

    @isTest
    static void getSmallest_UnitTest1() {
        List<Integer> numbers = new List<Integer>{5, 3, 7, 1, 9};

        ListsPractice_Exercise7 obj = new ListsPractice_Exercise7();

        Test.startTest();
        Integer smallest = obj.getSmallest(numbers);
        Test.stopTest();

        Assert.areEqual(1, smallest);
    }

    @isTest
    static void getSmallest_UnitTest2() {
        List<Integer> numbers = new List<Integer>{5, 3, 0, 1, 9};

        ListsPractice_Exercise7 obj = new ListsPractice_Exercise7();

        Test.startTest();
        Integer smallest = obj.getSmallest(numbers);
        Test.stopTest();

        Assert.areEqual(0, smallest);
    }
    @isTest
    static void getSmallest_UnitTest3() {
        List<Integer> numbers = new List<Integer>{-5, -4, 0, 1, 9};

        ListsPractice_Exercise7 obj = new ListsPractice_Exercise7();

        Test.startTest();
        Integer smallest = obj.getSmallest(numbers);
        Test.stopTest();

        Assert.areEqual(-5, smallest);
    }

    @isTest
    static void createNIntegers_UnitTest() {
        Integer n = 5;

        ListsPractice_Exercise7 obj = new ListsPractice_Exercise7();

        Test.startTest();
        List<Integer> numbers = obj.createNIntegers(n);
        Test.stopTest();

        Assert.areEqual(n, numbers.size());

        for (Integer num : numbers) {
            Assert.isTrue(num >= 0 && num <= 100);
        }
    }

    
    @isTest
    static void getRandomNumberInRange_UnitTest() {
        ListsPractice_Exercise7 obj = new ListsPractice_Exercise7();
        
        Test.startTest();
        Integer randomNumber = obj.getRandomNumberInRange(5, 10);
        Test.stopTest();
        
        Assert.areEqual(true, randomNumber >= 5 && randomNumber <= 10);
    }

    @isTest
    static void getRandomStringFromList_UnitTest() {
        List<String> words = new List<String>{'apple', 'banana', 'cherry', 'date'};
        
        ListsPractice_Exercise7 obj = new ListsPractice_Exercise7();

        Test.startTest();
        String randomWord = obj.getRandomStringFromList(words);
        Test.stopTest();

        Assert.areNotEqual(null, randomWord);
        Assert.isTrue(words.contains(randomWord));
    }
}