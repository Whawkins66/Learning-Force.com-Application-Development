public with sharing class SearchEmployeeController {

    public List<Employee__c> ExistingEmployees { get; set; }
    public String Keyword { get; set; }
    
    public SearchEmployeeController(){
        ExistingEmployees = new List<Employee__c>();
    }
    

    public void SearchEmployees() {
        ExistingEmployees = [SELECT Id, Name, First_Name__c, Email__c FROM Employee__c WHERE Name LIKE: ('%'+Keyword+'%')];       
    }


    
}