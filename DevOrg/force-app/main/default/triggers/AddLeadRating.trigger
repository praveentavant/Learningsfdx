trigger AddLeadRating on Lead (before insert,after insert, before Update,after update) {
    switch on Trigger.operationType{
        when BEFORE_INSERT {
  				LeadTriggerHandler.beforeInsertHandler(trigger.new);
           
        }
        when BEFORE_UPDATE {
           LeadTriggerHandler.beforeUpdateHandler(trigger.new,Trigger.oldMap);
        }
        when AFTER_INSERT{
            
     LeadTriggerHandler.afterInsertHandler(trigger.new);
    } 
    }
}