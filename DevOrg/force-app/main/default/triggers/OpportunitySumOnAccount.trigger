trigger OpportunitySumOnAccount on Opportunity (after insert,after update,after delete,after undelete) {
    Set<id> accIds = new Set<id>();

    if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete)){
        for(opportunity opp : trigger.new){
            accIds.add(opp.AccountId);
        }
    }
    if(trigger.isAfter && trigger.isUpdate){
        
        for(opportunity op: trigger.new){
            if(op.AccountId!=trigger.oldMap.get(op.id).AccountId){
                accIds.add(op.AccountId);
                accIds.add(trigger.oldMap.get(op.id).AccountId);
            }
            else{
                accIds.add(op.AccountId);
            }
        }
    }

    if(trigger.isAfter && trigger.isDelete){
        if(!trigger.old.isEmpty()){
            for(opportunity opp : trigger.new){
                accIds.add(opp.AccountId);
            }
        }
    }
    List<AggregateResult> result = [SELECT AccountId ids,SUM(Amount)totalsum FROM Opportunity WHERE AccountId IN :accIds GROUP BY AccountId ];
    Map<id,Account> accMap = new Map<Id,Account>();
   if(!result.isEmpty()){
    for(AggregateResult agr : result){
        Account acc = new Account();
        acc.Id=(Id)agr.get('ids');
        acc.Total_Opp_Sum__c = (Decimal)agr.get('totalsum');
        accMap.put(acc.id,acc);
    }update accMap.values();
   }
}