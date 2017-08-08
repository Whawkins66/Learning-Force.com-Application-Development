public with sharing class EmployeeWithLeaveExtension {
    public Employee__c Employee{get;set;}
    public List<Leave__c> Leaves{get;set;}

    public EmployeeWithLeaveExtension(ApexPages.StandardController controller) {
        Employee = new Employee__c();
        Employee = (Employee__c)controller.getRecord();
        fetchLeaves();
    }
    
    public void fetchLeaves(){
        Leaves = new List<Leave__c>([Select Id, Name,From_Date__c,To_Date__c,Leave_Type__c,Number_of_Days__c,Status__c FROM Leave__c WHERE Employee__c =: Employee.Id ]);
        
    }

}