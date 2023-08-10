@isTest
public with sharing class Department_Test {

    @isTest
    static void getDepartmentInfo_UnitTest() {
        Department dep = new Department();
        dep.name = 'Sales';
        dep.manager = new Employee('John', 'Doe', 100000);

        String expectedDepartmentInfo = 'The manager of ' + dep.name + ' is ' + dep.manager.getFullName() + ' with the salary ' + dep.manager.salary;

        Test.startTest();
        String actualDepartmentInfo = dep.getDepartmentInfo();
        Test.stopTest();
        
        Assert.areEqual(expectedDepartmentInfo, actualDepartmentInfo);
    }

    @isTest
    static void getSalaryExpenses_UnitTest() {
        Department dep = new Department();
        dep.manager = new Employee('John', 'Doe', 100000);
        dep.supervisor = new Employee('Jane', 'Smith', 75000);
        dep.contactPerson = new Employee('Alice', 'Johnson', 60000);

        Decimal expectedDepartmentExpenses = dep.manager.salary + dep.supervisor.salary + dep.contactPerson.salary;

        Test.startTest();
        Decimal actualDepartmentExpenses = dep.getSalaryExpenses();
        Test.stopTest();
        
        Assert.areEqual(expectedDepartmentExpenses, actualDepartmentExpenses);
    }

    @isTest
    static void getBudgetDifference_UnitTest() {
        Department dep = new Department();
        dep.budget = 250000;
        dep.manager = new Employee('John', 'Doe', 100000);
        dep.supervisor = new Employee('Jane', 'Smith', 75000);
        dep.contactPerson = new Employee('Alice', 'Johnson', 60000);

        Decimal expectedBudgetDifference = dep.getSalaryExpenses() - Decimal.valueOf(dep.budget);

        Test.startTest();
        Decimal actualBudgetDifference = dep.getBudgetDifference();
        Test.stopTest();
        
        Assert.areEqual(expectedBudgetDifference, actualBudgetDifference);
    }
}