public with sharing class SendEmailWithAttachmentsController {
    

    public static void sendWithDocumentAttachment()
    {
        try{
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses( new String[] { 'chamil.madusanka@gmail.com'});
            mail.setSubject('Message from Apex!');
            mail.setPlainTextBody('This is the message body');
            mail.setDocumentAttachments(new Id[] {[select Id from Document where Name = 'eLeaveForce logo'][0].Id });
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }catch(Exception e){
           ApexPages.addMessages(e);

             Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
             String[] toAddresses = new String[] {'chamil.madusanka@gmail.com'};
             mail.setToAddresses(toAddresses);
             mail.setReplyTo('chamil.madusanka@gmail.com');
             mail.setSenderDisplayName('Apex error message');
             mail.setSubject('Error from Org : ' + UserInfo.getOrganizationName());
             mail.setPlainTextBody(e.getMessage());
             Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
        }
    }
    
    public static void sendWithDynamicAttachment()
    {
        try{
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses( new String[] { 'chamil.madusanka@gmail.com' });
            mail.setSubject('Message from Apex!');
            mail.setPlainTextBody('This is the message body');
            Messaging.EmailFileAttachment mailAttachment;
            mailAttachment = new Messaging.EmailFileAttachment();
            mailAttachment.setFileName('readme.txt');
            mailAttachment.setBody(Blob.valueOf('This is an Apex-generated attachment'));
            mail.setFileAttachments(new Messaging.EmailFileAttachment[]{mailAttachment});
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }catch(Exception e){
           ApexPages.addMessages(e);

             Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
             String[] toAddresses = new String[] {'chamil.madusanka@gmail.com'};
             mail.setToAddresses(toAddresses);
             mail.setReplyTo('chamil.madusanka@gmail.com');
             mail.setSenderDisplayName('Apex error message');
             mail.setSubject('Error from Org : ' + UserInfo.getOrganizationName());
             mail.setPlainTextBody(e.getMessage());
             Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
        }
    }
}