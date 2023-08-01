public with sharing class Company {

    public String name;
    public Employee CEO;
    public Department salesDepartment;
    public Department developmentDepartment;
    public Department humanResourcesDepartment;

    public Company(String name, Employee CEO, Department salesDepartment, Department developmentDepartment, Department humanResourcesDepartment){
        this.name = name;
        this.CEO = CEO;
        this.salesDepartment = salesDepartment;
        this.developmentDepartment = developmentDepartment;
        this.humanResourcesDepartment = humanResourcesDepartment;
    }

    public String getCEOInfo(){
        return CEO.getFullName();
    }

    public String getDepartmentInfo(){
        String departmentName = salesDepartment.name;
        String managerInfo = salesdepartment.getDepartmentInfo();
        
        return departmentName + ' ' + managerInfo;
    }

    public String getCompanyDetails(){
        String line1 = 'Company: ' + name + '\n';
        String line2 = 'CEO: ' + CEO.getFullName() + '\n\n';
        String line3 = 'Department: ' + salesDepartment.name + '\n';
        String line4 = 'Manager: ' + salesDepartment.manager.getFullName() + '\n';
        String line5 = 'Supervisor: ' + salesDepartment.supervisor.getFullName() + '\n';
        String line6 = 'Contact Person: ' + salesDepartment.contactPerson.getFullName() + '\n\n';
        String line7 = 'Department: ' + developmentDepartment.name + '\n';
        String line8 = 'Manager: ' + developmentDepartment.manager.getFullName() + '\n';
        String line9 = 'Supervisor: ' + developmentDepartment.supervisor.getFullName() + '\n';
        String line10 = 'Contact Person: ' + developmentDepartment.contactPerson.getFullName() + '\n\n';
        String line11 = 'Department: ' + humanResourcesDepartment.name + '\n';
        String line12 = 'Manager: ' + humanResourcesDepartment.manager.getFullName() + '\n';
        String line13 = 'Supervisor: ' + humanResourcesDepartment.supervisor.getFullName() + '\n';
        String line14 = 'Contact Person: ' + humanResourcesDepartment.contactPerson.getFullName() + '\n';
        String finalLine = line1 + line2 + line3 + line4 + line5 + line6 + line7 + line8 + line9 + line10 + line11 + line12 + line13 + line14;

        return finalLine;
    }
}