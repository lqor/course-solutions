@isTest
public with sharing class Employee_Test {
    
    @isTest
    static void constructor_UnitTest1() {

        Test.startTest();
        Employee emp = new Employee('John', 'Doe', 80000, 3);
        Test.stopTest();

        Assert.areEqual('John', emp.firstName);
        Assert.areEqual('Doe', emp.lastName);
        Assert.areEqual(80000, emp.salary);
        Assert.areEqual(3, emp.yearsOfService);
    }

    @isTest
    static void constructor_UnitTest2() {

        Test.startTest();
        Employee emp = new Employee('John', 'Doe', 80000);
        Test.stopTest();

        Assert.areEqual('John', emp.firstName);
        Assert.areEqual('Doe', emp.lastName);
        Assert.areEqual(80000, emp.salary);
        Assert.areEqual(5, emp.yearsOfService);
    }

    @isTest
    static void constructor_UnitTest3() {

        Test.startTest();
        Employee emp = new Employee('John', 'Doe');
        Test.stopTest();

        Assert.areEqual('John', emp.firstName);
        Assert.areEqual('Doe', emp.lastName);
        Assert.areEqual(100000, emp.salary);
        Assert.areEqual(6, emp.yearsOfService);
    }
    
    @isTest
    static void constructor_UnitTest4() {

        Test.startTest();
        Employee emp = new Employee();
        Test.stopTest();
        
        Assert.areEqual('Frank', emp.firstName);
        Assert.areEqual('Gillen', emp.lastName);
        Assert.areEqual(1000000000, emp.salary);
        Assert.areEqual(2, emp.yearsOfService);
    }

    @isTest   
    static void setFirstName_UnitTest(){
        Employee emp = new Employee('John', 'Doe');

        Test.startTest();
        emp.setFirstName('Steve');
        Test.stopTest();

        Assert.areNotEqual('John', emp.firstName);
        Assert.areEqual('Steve', emp.firstName);
    }

    @isTest
    static void setLastName_UnitTest(){
        Employee emp = new Employee('John', 'Doe');

        Test.startTest();
        emp.setLastName('Biden');
        Test.stopTest();

        Assert.areNotEqual('Doe', emp.lastName);
        Assert.areEqual('Biden', emp.lastName);
    }

    @isTest
    static void setSalary_UnitTest(){
        Employee emp = new Employee('John', 'Doe', 80000);

        Test.startTest();
        emp.setSalary(85000);
        Test.stopTest();

        Assert.areNotEqual(80000, emp.salary);
        Assert.areEqual(85000, emp.salary);
    }

    @isTest
    static void setYearsOfService_UnitTest(){
        Employee emp = new Employee('John', 'Doe', 80000, 3);

        Test.startTest();
        emp.setYearsOfService(9);
        Test.stopTest();

        Assert.areNotEqual(3, emp.yearsOfService);
        Assert.areEqual(9, emp.yearsOfService);
    }

    @isTest
    static void getFullName_UnitTest(){
        Employee emp = new Employee('John', 'Doe');

        Test.startTest();
        String fullName = emp.getFullName();
        Test.stopTest();

        Assert.areEqual('John Doe', fullName);
    }

    @isTest
    static void calculateBonus_UnitTest(){

        Employee emp = new Employee('John', 'Doe', 80000, 3);
        Decimal expectedBonus = 80000 * 0.10 * 3;

        Test.startTest();
        Decimal bonus = emp.calculateBonus();
        Test.stopTest();

        Assert.areEqual(expectedBonus, bonus);
    }

    @isTest
    static void increaseSalary_UnitTest(){
        Employee emp = new Employee('John', 'Doe', 80000);

        Test.startTest();
        emp.increaseSalary(20000);
        Test.stopTest();

        Assert.areNotEqual(80000, emp.salary);
        Assert.areEqual(100000, emp.salary);
    }
}