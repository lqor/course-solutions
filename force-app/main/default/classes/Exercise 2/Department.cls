public with sharing class Department {
    
    public String name;
    public Integer budget;
    public Employee manager;
    public Employee supervisor;
    public Employee contactPerson;
  
    public String getDepartmentInfo() {
        String nameDepartmentPart = 'The manager of ' + name;
        String firstAndLastNamePart = ' is ' + manager.getFullName();
        String salaryPart = ' with the salary ' + manager.salary;

        return nameDepartmentPart + firstAndLastNamePart + salaryPart;
    }

    public Decimal getSalaryExpenses() {
        Decimal managerSalary = manager.salary;
        Decimal supervisorSalary = supervisor.salary;
        Decimal contactPersonSalary = contactPerson.salary;

        return managerSalary + supervisorSalary + contactPersonSalary;
    }
    
    public Decimal getBudgetDifference() {
        return getSalaryExpenses() - Decimal.valueOf(budget);
    }
}