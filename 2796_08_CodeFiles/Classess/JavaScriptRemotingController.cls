global with sharing class JavaScriptRemotingController {
  
    public List<Leave__c> Leaves{
        get{
         Leaves = new List<Leave__c>();
        Leaves = [Select Id, Name,From_Date__c,To_Date__c,Leave_Type__c,Number_of_Days__c,Status__c FROM Leave__c LIMIT 1000];
        return Leaves;
        }
        set;
    }
   
    public JavaScriptRemotingController(){
      
    } 
    
@RemoteAction
global static Leave__c processLeave(String para){
    Leave__c updateLeave;       
    try{
       updateLeave=[Select Id, Name,From_Date__c,To_Date__c,Leave_Type__c,Number_of_Days__c,Status__c FROM Leave__c WHERE Id =: para];       
       updateLeave.Status__c = 'Approved by Direct Manager';
           update updateLeave;  
        //return updateLeave;
    }catch(DMLException e){
         ApexPages.addMessages(e);
         return null;  
    }       
return null;  
}
}