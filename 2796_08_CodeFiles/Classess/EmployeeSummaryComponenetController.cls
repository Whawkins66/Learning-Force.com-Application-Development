public class EmployeeSummaryComponenetController{
    public String EmpID{get;set;}
    public Integer RecentNo{get;set;}
    public Employee__c CurrentEmployee{
        get{
            CurrentEmployee = new Employee__c();
            CurrentEmployee = [SELECT Id, 
                                      Name, 
                                      Leave_Category__c, 
                                      Email__c, 
                                      Manager__c 
                               FROM Employee__c 
                               WHERE Id =: EmpID];
            return CurrentEmployee;
        }
        set;
    }     
    public List<Leave__c> RecentLeaveList{
     get{
            RecentLeaveList = new List<Leave__c>();
            RecentLeaveList = [Select Id, Name,From_Date__c,To_Date__c,Leave_Type__c,Number_of_Days__c,Status__c FROM Leave__c WHERE Employee__c =: EmpID ORDER BY CreatedDate DESC LIMIT :RecentNo];
            return RecentLeaveList;
        }
        set;       
    }
}