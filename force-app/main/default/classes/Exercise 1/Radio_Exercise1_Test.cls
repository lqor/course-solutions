@isTest
public with sharing class Radio_Exercise1_Test {

    @isTest
    static void constructor_UnitTest1() {
        Test.startTest();
        Radio_Exercise1 radio = new Radio_Exercise1();
        Test.stopTest();
        
        Assert.areEqual(135.5, radio.frequency);
        Assert.areEqual('Sony DSX-A110U', radio.radioType);
        Assert.areEqual(true, radio.isOn);
    }

    @isTest
    static void constructor_UnitTest2() {
        String customRadioType = 'Custom Radio';

        Test.startTest();
        Radio_Exercise1 radio = new Radio_Exercise1(customRadioType);
        Test.stopTest();
        
        Assert.areEqual(135.5, radio.frequency);
        Assert.areEqual(customRadioType, radio.radioType);
        Assert.areEqual(true, radio.isOn);
    }

    @isTest
    static void nextChannel_UnitTest() {
        Radio_Exercise1 radio = new Radio_Exercise1();
        Decimal expectedFrequency = radio.frequency + 10;

        Test.startTest();
        Decimal actualFrequency = radio.nextChannel();
        Test.stopTest();
        
        Assert.areEqual(expectedFrequency, actualFrequency);
    }
}