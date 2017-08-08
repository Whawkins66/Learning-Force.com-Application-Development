public with sharing class LeaveStatusUpdateController {
    public List<Leave__c> Leaves{get;set;}
   
    public LeaveStatusUpdateController(){
        Leaves = new List<Leave__c>();
        Employee__c loggedEmp = new Employee__c();
        loggedEmp = [SELECT Id, Name FROM Employee__c WHERE User__c =: UserInfo.getUserId()];
        Leaves = [Select Id, Name,From_Date__c,To_Date__c,Leave_Type__c,Number_of_Days__c,Status__c, Employee__r.Name FROM Leave__c WHERE Employee__r.Manager__c =: loggedEmp.id AND Status__c ='New'];
    }

}