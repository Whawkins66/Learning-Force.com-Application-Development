trigger LeaveTrigger on Leave__c (before insert, before update, after update) {

    

    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            
            for(Leave__c tempLeave : Trigger.new){
                if(tempLeave.From_Date__c > tempLeave.To_Date__c){
                    tempLeave.From_Date__c.addError('To date must be greater than From Date.');
                    tempLeave.To_Date__c.addError('To date must be greater than From Date.');
                }                
                else if(tempLeave.From_Date__c < tempLeave.To_Date__c && tempLeave.From_Date__c.daysBetween(tempLeave.To_Date__c) < tempLeave.Number_of_Days__c){
                    tempLeave.Number_of_Days__c.addError('Cannot exceed the number of days than the days between from & to dates');                    
                }
            }
            
        
        }
    }
    
    if(Trigger.isAfter)
    {
        if(Trigger.isUpdate)
        {
            final String template = 'EmailDemoSendSingleTemplate';
            Id templateId; 
            
            try
            {
                templateId = [select id from EmailTemplate where Name = :template].id;
                
                List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
                
                for (Leave__c tempLeave : [select Employee__c, Status__c, Employee__r.Email__c from Leave__c where Id in :Trigger.new and Status__c IN ('Approved by Direct Manager','Rejected by Direct Manager')]) {

                  Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                
                  message.setTemplateId(templateId);                
                  message.setWhatId(tempLeave.Id);
                  message.setToAddresses(new String[] {tempLeave.Employee__r.Email__c});
                  messages.add(message);
                }
            
                Messaging.sendEmail(messages);
            
            }
            catch(QueryException e)
            {
               system.debug('e:::::::::::::::::::::'+e); 
            }
        }
    }
}

// message.setPlainTextBody('Your Case: ' + tempLeave.Id +' has been updated.');
                 // message.setTargetObjectId(tempLeave.Id);