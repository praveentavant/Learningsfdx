trigger CTPersonTrigger on Person__c (before insert,after insert, before Update, After Update,before delete, After delete, after Undelete){
    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            CTPersonTriggerHandler.beforeInsert(trigger.new);
        }
        when AFTER_UPDATE{
            CTPersonTriggerHandler.afterupdate(Trigger.new,Trigger.oldMap);
        }
      
    }
   
}