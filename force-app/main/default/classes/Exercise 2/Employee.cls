public with sharing class Employee {
    
    public String firstName;  
    public String lastName;  
    public Decimal salary;  
    public Integer yearsOfService; 

    public Employee(String firstName, String lastName, Decimal salary, Integer yearsOfService) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.salary = salary;
        this.yearsOfService = yearsOfService;
    }

    public Employee(String firstName, String lastName, Decimal salary){
        this.firstName = firstName;
        this.lastName = lastName;
        this.salary = salary;
        yearsOfService = 5;
    }

    public Employee(String firstName, String lastName){
        this.firstName = firstName;
        this.lastName = lastName;
        salary = 100000;
        yearsOfService = 6;
    } 

    public Employee(){
        firstName = 'Frank';
        lastName = 'Gillen';
        salary = 1000000000;
        yearsOfService = 2;
    }

    public void setFirstName(String firstName){
        this.firstName = firstName;
    }

    public void setLastName(String lastName){
        this.lastName = lastName;
    }

    public void setSalary(Decimal salary){
        this.salary = salary;
    }

    public void setYearsOfService(Integer yearsOfService){
        this.yearsOfService = yearsOfService;
    }

    public String getFullName(){
        return firstName + ' ' + lastName;
    }

    public Decimal calculateBonus(){
        Decimal bonusPercent = 0.10;

        return salary * bonusPercent * yearsOfService;
    }

    public Decimal increaseSalary(Integer salaryAdd){
        this.salary = salary + salaryAdd;

        return salary;
    }
}
