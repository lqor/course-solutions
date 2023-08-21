@isTest
public with sharing class Loops_Exercise7_Test {

    @isTest
    static void reverseString_UnitTest1() {
        Loops_Exercise7 obj = new Loops_Exercise7();

        String input = 'hello';

        Test.startTest();
        String output = obj.reverseString(input);
        Test.stopTest();

        Assert.areEqual('olleh', output);
    }

    @isTest
    static void reverseString_UnitTest2() {
        Loops_Exercise7 obj = new Loops_Exercise7();

        String input = '';
   
        Test.startTest();
        String output = obj.reverseString(input);
        Test.stopTest();
        
        Assert.areEqual('', output);
    }

    @isTest
    static void reverseString_UnitTest3() {
        Loops_Exercise7 obj = new Loops_Exercise7();

        String input = 'a';
 
        Test.startTest();
        String output = obj.reverseString(input);
        Test.stopTest();

        Assert.areEqual('a', output);
    }
}