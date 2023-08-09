@isTest
public with sharing class Car_Exercise1_Test {

    @isTest
    static void constructor_UnitTest1() {
        Test.startTest();
        Car_Exercise1 car = new Car_Exercise1();
        Test.stopTest();
        
        Assert.areEqual(0, car.maximumSpeed);
        Assert.areEqual(true, car.motorIsOn);
    }
    
    @isTest
    static void constructor_UnitTest2() {
        Test.startTest();
        Car_Exercise1 car = new Car_Exercise1('V8', 200, 4, 'Blue');
        Test.stopTest();
        
        Assert.areEqual('V8', car.motor);
        Assert.areEqual(200, car.maximumSpeed);
        Assert.areEqual(4, car.passengers);
        Assert.areEqual('Blue', car.color);
        Assert.areEqual(true, car.motorIsOn);
    }
    
    @isTest
    static void addSpeed_UnitTest1() {
        Car_Exercise1 car = new Car_Exercise1();

        Integer expectedMaximumSpeed = car.maximumSpeed + 30;
        
        Test.startTest();
        car.addSpeed(30);
        Test.stopTest();
        
        Assert.areEqual(expectedMaximumSpeed, car.maximumSpeed);
    }

    @isTest
    static void addSpeed_UnitTest2() {
        Car_Exercise1 car = new Car_Exercise1('BMW V5', 250, 2, 'White');

        Integer expectedMaximumSpeed = car.maximumSpeed + 50;

        Test.startTest();
        car.addSpeed(50);
        Test.stopTest();
        
        Assert.areEqual(expectedMaximumSpeed , car.maximumSpeed);
    }

    @isTest
    static void repaint_UnitTest1() {
        Car_Exercise1 car = new Car_Exercise1();

        Test.startTest();
        car.repaint('White');
        Test.stopTest();
        
        Assert.areEqual('White', car.color);
    }
    
    @isTest
    static void repaint_UnitTest2() {
        Car_Exercise1 car = new Car_Exercise1('Electric', 150, 2, 'Red');

        Test.startTest();
        car.repaint('Green');
        Test.stopTest();
        
        Assert.areEqual('Green', car.color);
    }
    
    @isTest
    static void toggleMotor_UnitTest() {
        Car_Exercise1 car = new Car_Exercise1();

        Test.startTest();
        car.toggleMotor();
        Test.stopTest();

        Assert.areEqual(false, car.motorIsOn);
    }

    @isTest
    static void assignRadio_UnitTest1() {
        Car_Exercise1 car = new Car_Exercise1();

        Radio_Exercise1 radio = new Radio_Exercise1();
        Decimal expectedFrequency = radio.frequency;
        String expectedRadioType = radio.radioType;
        Boolean expectedIsOn = radio.isOn;

        Test.startTest();
        car.assignRadio(radio);
        Test.stopTest();
        
        Assert.areEqual(expectedFrequency, car.radio.frequency);
        Assert.areEqual(expectedRadioType, car.radio.radioType);
        Assert.areEqual(expectedIsOn, car.radio.isOn);
    }
    
    @isTest
    static void assignRadio_UnitTest2() {
        Car_Exercise1 car = new Car_Exercise1();

        Radio_Exercise1 radio = new Radio_Exercise1('FM');
        Decimal expectedFrequency = radio.frequency;
        Boolean expectedIsOn = radio.isOn;

        Test.startTest();
        car.assignRadio(radio);
        Test.stopTest();
        
        Assert.areEqual(expectedFrequency, car.radio.frequency);
        Assert.areEqual('FM', car.radio.radioType);
        Assert.areEqual(expectedIsOn, car.radio.isOn);
    }
}
