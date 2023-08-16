@isTest
public with sharing class Loops_Exercise5_Test {

    @isTest
    static void isPrime_UnitTest() {
        Loops_Exercise5 loopsExercise = new Loops_Exercise5();

        Test.startTest();
        Boolean primeNumberTest1 = loopsExercise.isPrime(2);
        Boolean primeNumberTest2 = loopsExercise.isPrime(67);
        Boolean noPrimeNumberTest1 = loopsExercise.isPrime(0);
        Boolean noPrimeNumberTest2 = loopsExercise.isPrime(1);
        Boolean noPrimeNumberTest3 = loopsExercise.isPrime(-2);
        Boolean noPrimeNumberTest4 = loopsExercise.isPrime(52);
        Test.stopTest();

        Assert.areEqual(true, primeNumberTest1);
        Assert.areEqual(true, primeNumberTest2);
        Assert.areEqual(false, noPrimeNumberTest1);
        Assert.areEqual(false, noPrimeNumberTest2);
        Assert.areEqual(false, noPrimeNumberTest3);
        Assert.areEqual(false, noPrimeNumberTest4);
    }

    @isTest
    static void calculateFactorialNumber_UnitTest() {
        Loops_Exercise5 loopsExercise = new Loops_Exercise5();

        Test.startTest();
        Integer factorial0 = loopsExercise.calculateFactorialNumber(0);
        Integer factorial1 = loopsExercise.calculateFactorialNumber(1);
        Integer factorial2 = loopsExercise.calculateFactorialNumber(2);
        Integer factorial8 = loopsExercise.calculateFactorialNumber(8);
        Integer factorial12 = loopsExercise.calculateFactorialNumber(12);
        Test.stopTest();

        Assert.areEqual(1, factorial0);
        Assert.areEqual(1, factorial1);
        Assert.areEqual(2, factorial2);
        Assert.areEqual(40320, factorial8);
        Assert.areEqual(479001600, factorial12);
    }

    @isTest
    static void calculateSumAllNumbers_UnitTest() {
        Loops_Exercise5 loopsExercise = new Loops_Exercise5();

        Test.startTest();
        Integer sum0 = loopsExercise.calculateSumAllNumbers(0);
        Integer sum1 = loopsExercise.calculateSumAllNumbers(1);
        Integer sum10 = loopsExercise.calculateSumAllNumbers(10);
        Integer sum100 = loopsExercise.calculateSumAllNumbers(100);
        Test.stopTest();

        Assert.areEqual(0, sum0);
        Assert.areEqual(1, sum1);
        Assert.areEqual(55, sum10);
        Assert.areEqual(5050, sum100);
    }

    @isTest
    static void multiplicationDividedByAddition_UnitTest() {
        Loops_Exercise5 loopsExercise = new Loops_Exercise5();

        Test.startTest();
        Decimal resultOf1  = loopsExercise.multiplicationDividedByAddition(1);
        Decimal resultOf3  = loopsExercise.multiplicationDividedByAddition(3);
        Decimal resultOf5  = loopsExercise.multiplicationDividedByAddition(5);
        Test.stopTest();
        
        Assert.areEqual(1.0, resultOf1);
        Assert.areEqual(1.0, resultOf3);
        Assert.areEqual(8.0, resultOf5);
    }

    @isTest
    static void calculateRange_UnitTest() {
        Loops_Exercise5 loopsExercise = new Loops_Exercise5();

        Test.startTest();
        Integer rangeFor1and2 = loopsExercise.calculateRange(1, 2);
        Integer rangeFor1and5 = loopsExercise.calculateRange(1, 5);
        Integer rangeFor5and10 = loopsExercise.calculateRange(5, 10);
        Test.stopTest();

        Assert.areEqual(3, rangeFor1and2);
        Assert.areEqual(15, rangeFor1and5);
        Assert.areEqual(45, rangeFor5and10);
    }

    @isTest
    static void reverseString_UnitTest() {
        Loops_Exercise5 loopsExercise = new Loops_Exercise5();

        Test.startTest();
        String word1 = loopsExercise.reverseString('word');
        String word2 = loopsExercise.reverseString('reverse');
        Test.stopTest();

        Assert.areEqual('drow', word1);
        Assert.areEqual('esrever', word2);
    }

    @isTest
    static void isPalindrome_UnitTest() {
        Loops_Exercise5 loopsExercise = new Loops_Exercise5();

        Test.startTest();
        Boolean nonPalindrometest = loopsExercise.isPalindrome('word');
        Boolean palindromeTest = loopsExercise.isPalindrome('racecar');
        Test.stopTest();

        Assert.areEqual(false, nonPalindrometest);
        Assert.areEqual(true, palindromeTest);
    }

    @isTest
    static void findLetter_UnitTest() {
        Loops_Exercise5 loopsExercise = new Loops_Exercise5();

        Test.startTest();
        Integer index1 = loopsExercise.findLetter('word', 'a');
        Integer index2 = loopsExercise.findLetter('word', 'w');
        Integer index3 = loopsExercise.findLetter('word', 'r');
        Test.stopTest();

        Assert.areEqual(-1, index1);
        Assert.areEqual(0, index2);
        Assert.areEqual(2, index3);
    }
}