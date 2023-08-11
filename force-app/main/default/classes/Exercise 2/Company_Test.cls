@isTest
public class Company_Test {

    @isTest
    static void constructor_UnitTest() {
        Department salesDep = new Department();
        salesDep .name = 'Sales';

        Department devDep = new Department();
        devDep.name = 'Development';

        Department hrDep = new Department();
        hrDep.name = 'Human Resources';

        Employee ceo = new Employee('John', 'Doe', 100000);

        Test.startTest();
        Company company = new Company('Coca-Cola', ceo, salesDep, devDep, hrDep);
        Test.stopTest();
        
        Assert.areEqual('Coca-Cola', company.name);
        Assert.areEqual('John Doe', ceo.getFullName());
        Assert.areEqual('Sales', salesDep.name);
        Assert.areEqual('Development', devDep.name);
        Assert.areEqual('Human Resources', hrDep.name);
    }

    @isTest
    static void getCEOInfo_UnitTest() {
        Employee ceo = new Employee('Annie', 'Cochran', 200000);

        Company company = new Company('Test Company', ceo, null, null, null);

        Test.startTest();
        String actualCEOInfo = company.getCEOInfo();
        Test.stopTest();
        
        Assert.areEqual('Annie Cochran', actualCEOInfo);
    }

    @isTest
    static void getDepartmentInfo_UnitTest() {
        Employee ceo = new Employee('John', 'CEO', 200000);

        Department salesDep = new Department();
        salesDep.name = 'Sales';
        salesDep.budget = 100000;
        salesDep.manager = ceo;
        salesDep.supervisor = null;
        salesDep.contactPerson = null;

        Company company = new Company('Google', ceo, salesDep, null, null);

        String expectedDeptInfo = salesDep.name + ' ' + salesDep.getDepartmentInfo();

        Test.startTest();
        String actualDeptInfo = company.getDepartmentInfo();
        Test.stopTest();
        
        Assert.areEqual(expectedDeptInfo, actualDeptInfo);
    }

    @isTest
    static void getCompanyDetails_UnitTest() {
        Employee salesManager = new Employee('Katalina', 'Owens', 250000);
        Employee salesSupervisor = new Employee('Ares', 'Briggs', 180000);
        Employee salesContactPerson = new Employee('Maxwell', 'Stokes', 150000);

        Department salesDep = new Department();
        salesDep.name = 'Sales';
        salesDep.budget = 100000;
        salesDep.manager = salesManager;
        salesDep.supervisor = salesSupervisor;
        salesDep.contactPerson = salesContactPerson;

        Employee devManager = new Employee('Joe', 'Curtis', 300000);
        Employee devSupervisor = new Employee('Rey', 'Tate', 275000);
        Employee devContactPerson = new Employee('Miley', 'Chen', 175000);

        Department devDep = new Department();
        devDep.name = 'Development';
        devDep.budget = 150000;
        devDep.manager = devManager;
        devDep.supervisor = devSupervisor;
        devDep.contactPerson = devContactPerson;

        Employee hrManager = new Employee('Luella', 'Bowman', 225000);
        Employee hrSupervisor = new Employee('Trinity', 'Drake', 200000);
        Employee hrContactPerson = new Employee('Lily', 'Gomez', 150000);

        Department hrDep = new Department();
        hrDep.name = 'Human Resources';
        hrDep.budget = 80000;
        hrDep.manager = hrManager;
        hrDep.supervisor = hrSupervisor;
        hrDep.contactPerson = hrContactPerson;

        Employee ceo = new Employee('Bill', 'Wood', 500000);

        Company company = new Company('Amazon', ceo, salesDep, devDep, hrDep);
        
        String expectedDetails = 'Company: Amazon\n' +
            'CEO: Bill Wood\n\n' +
            'Department: Sales\n' +
            'Manager: Katalina Owens\n' +
            'Supervisor: Ares Briggs\n' +
            'Contact Person: Maxwell Stokes\n\n' +
            'Department: Development\n' +
            'Manager: Joe Curtis\n' +
            'Supervisor: Rey Tate\n' +
            'Contact Person: Miley Chen\n\n' +
            'Department: Human Resources\n' +
            'Manager: Luella Bowman\n' +
            'Supervisor: Trinity Drake\n' +
            'Contact Person: Lily Gomez\n';
       
        Test.startTest();
        String actualDetails = company.getCompanyDetails();
        Test.stopTest();
        
        Assert.areEqual(expectedDetails, actualDetails);
    }
}