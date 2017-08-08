public with sharing class NavigationController {

    Employee__c newEmployee;
    
    public Employee__c getNewEmployee(){
        if(newEmployee == null)newEmployee = new Employee__c();
        return newEmployee;
    }
    

    public PageReference cancel() {
        return null;
    }


    public PageReference save() {
    
        try{
            insert newEmployee;
            PageReference empPage = new PageReference('/'+newEmployee.Id);
            empPage.setRedirect(true);
            return empPage;
        }catch(Exception ex){
            
            return null;
        }
    }

}