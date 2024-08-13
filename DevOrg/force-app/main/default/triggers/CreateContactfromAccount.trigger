trigger CreateContactfromAccount on Account (After insert,After update) {

if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
    List<Contact> conToInsert = New List<Contact>();
    if(trigger.isUpdate){
        for(Account acc : trigger.new){
        
            if(acc.Create_contact__c!=trigger.oldMap.get(acc.id).Create_contact__c && acc.Create_contact__c){
                Contact newCon = new Contact();
                newCon.AccountId=acc.id;
                newCon.LastName=acc.name;
                conToInsert.add(newCon);
        }
    }
    
    }
    if(trigger.isInsert){
        for(Account acc : trigger.new){
        
            if(acc.Create_contact__c){
                Contact newCon = new Contact();
                newCon.AccountId=acc.id;
                newCon.LastName=acc.name;
                conToInsert.add(newCon);
    }
    
}
    
}
if(!conToInsert.isEmpty())
    insert conToInsert;
}
}