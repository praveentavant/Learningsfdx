trigger MaxorMinSalaryUpdate on Employee__c (after insert,after update,after delete,after undelete) {
    if(trigger.isAfter && (trigger.isUpdate || trigger.isInsert)){
        MinMaxSalarytriggerhelper.trgMethod(trigger.new, trigger.oldMap);
    }
    if(trigger.isAfter && trigger.isDelete){
         MinMaxSalarytriggerhelper.trgMethod(trigger.old, null);
    }
    
}