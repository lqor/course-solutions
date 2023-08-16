@isTest
public with sharing class IfElsePractice_Exercise4_Test {

    @isTest
    static void hasExactLength_UnitTest() {
        IfElsePractice_Exercise4 exercise4 = new IfElsePractice_Exercise4();
        
        Test.startTest();
        Boolean exactLengthTest = exercise4.hasExactLength('abcd', 4);
        Boolean notExactLengthTest = exercise4.hasExactLength('abc', 4);
        Test.stopTest();

        Assert.areEqual(true, exactLengthTest);
        Assert.areEqual(false, notExactLengthTest);
    }

    @isTest
    static void maximumNumber_UnitTest1() {
        IfElsePractice_Exercise4 exercise4 = new IfElsePractice_Exercise4();
        
        Test.startTest();
        Integer maximumOf3And5 = exercise4.maximumNumber(3, 5);
        Integer maximumOf5And4 = exercise4.maximumNumber(5, 4);
        Integer maximumOf5And5 = exercise4.maximumNumber(5, 5);
        Integer maximumOf0AndMinus5 = exercise4.maximumNumber(0, -5);
        Integer maximumOfMinus2AndMinus5 = exercise4.maximumNumber(-2, -5);
        Test.stopTest();

        Assert.areEqual(5, maximumOf3And5);  
        Assert.areEqual(5, maximumOf5And4); 
        Assert.areEqual(5, maximumOf5And5); 
        Assert.areEqual(0, maximumOf0AndMinus5); 
        Assert.areEqual(-2, maximumOfMinus2AndMinus5); 
    }

    @isTest
    static void maximumNumber_UnitTest2() {
        IfElsePractice_Exercise4 exercise4 = new IfElsePractice_Exercise4();
        
        Test.startTest();
        Integer maximumOf3And5And7 = exercise4.maximumNumber(3, 5, 7);
        Integer maximumOf7And2And1 = exercise4.maximumNumber(7, 2, 1);
        Integer maximumOf9And9And9 = exercise4.maximumNumber(9, 9, 9);
        Integer maximumOf0AndMinus5AndMinus1 = exercise4.maximumNumber(0, -5, -1);
        Integer maximumOfMinus4AndMinus5AndMinus6 = exercise4.maximumNumber(-4, -5, -6);
        Test.stopTest();

        Assert.areEqual(7, maximumOf3And5And7);  
        Assert.areEqual(7, maximumOf7And2And1); 
        Assert.areEqual(9, maximumOf9And9And9); 
        Assert.areEqual(0, maximumOf0AndMinus5AndMinus1); 
        Assert.areEqual(-4, maximumOfMinus4AndMinus5AndMinus6); 
    }

    @isTest
    static void isEven_UnitTest() {
        IfElsePractice_Exercise4 exercise4 = new IfElsePractice_Exercise4();
        
        Test.startTest();
        Boolean evenTest = exercise4.isEven(4);
        Boolean oddTest = exercise4.isEven(7);
        Test.stopTest();

        Assert.areEqual(true, evenTest);
        Assert.areEqual(false, oddTest);
    }

    @isTest
    static void convertTemperature_UnitTest() {
        IfElsePractice_Exercise4 exercise4 = new IfElsePractice_Exercise4();

        Test.startTest();
        Decimal celsiusToFahrenheitResult = exercise4.convertTemperature(12.56, 'C');
        Decimal fahrenheitToCelsiusResult = exercise4.convertTemperature(86.0, 'F');
        Decimal invalidFormatResult = exercise4.convertTemperature(0.0, 'K');
        Test.stopTest();

        Decimal expectedCelsiusToFahrenheitResult = 54.608;
        Decimal expectedFahrenheitToCelsiusResult = 30.0;
        Decimal expectedInvalidFormatResult = 0.0;
        
        Assert.areEqual(expectedCelsiusToFahrenheitResult, celsiusToFahrenheitResult);
        Assert.areEqual(expectedFahrenheitToCelsiusResult, fahrenheitToCelsiusResult);
        Assert.areEqual(expectedInvalidFormatResult, invalidFormatResult);
    }
}