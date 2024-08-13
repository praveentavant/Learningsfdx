trigger primaryContactTrigger on Contact (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert){
        PrimaryContactCheckHelper.primarycheck(trigger.new,null);
    }
    if(trigger.isBefore && trigger.isUpdate){
        PrimaryContactCheckHelper.primarycheck(trigger.new,trigger.oldMap);
    }
}