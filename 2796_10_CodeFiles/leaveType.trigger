trigger leaveType on Leave_Type__c (after insert) {

    Id[] targetObjectIds = new Id[] {};
    Id[] whatIds = new Id[] {};
    final String template = 'EmailDemoSendMassTemplate';
    Messaging.MassEmailMessage message = new Messaging.MassEmailMessage();
    message.setTemplateId([select Id from EmailTemplate where Name = :template].Id);
    
    Map<Id,Employee__c> allEmployees = new Map<Id,Employee__c>([SELECT Id FROM Employee__c LIMIT 50000]);
    
    Contact[] contacts = [select Id from Contact where Employee__c IN:allEmployees.keyset()];
     
    for (Contact c : contacts) {
      targetObjectIds.add(c.Id);      
    }
    
    message.setTargetObjectIds(targetObjectIds);    
    Messaging.sendEmail(new Messaging.Email[] {message});    
}