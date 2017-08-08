trigger LeaveTrigger on Leave__c (before insert, before update) {

    if(Trigger.isBefore){ //Trigger Execution context: before
        if(Trigger.isInsert || Trigger.isUpdate){//Trigger Execution context: insert/update
            
            for(Leave__c tempLeave : Trigger.new){//Use new record context variable
                if(tempLeave.From_Date__c > tempLeave.To_Date__c){//Validation 1
                    tempLeave.From_Date__c.addError('To date must be greater than From Date.'); 
					//use adderror method
                    tempLeave.To_Date__c.addError('To date must be greater than From Date.');
                }                
                else if(tempLeave.From_Date__c < tempLeave.To_Date__c && tempLeave.From_Date__c.daysBetween(tempLeave.To_Date__c) < tempLeave.Number_of_Days__c){ //Validation 2
                    tempLeave.Number_of_Days__c.addError('Cannot exceed the number of days than the days between from & to dates');                    
                }
            }       
        }
    }
}
