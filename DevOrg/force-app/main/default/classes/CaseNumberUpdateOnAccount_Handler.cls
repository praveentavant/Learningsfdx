public with sharing class CaseNumberUpdateOnAccount_Handler {
    public static void UpdateCaseNumber(List<Case> caseList) {
        Set<Id> accountids = new Set<Id>();
        Map<id,Account> mapToUpdate = New Map<Id,Account>();
        if(!caseList.isEmpty()){
        
                for(case cs :caseList ){
                    accountids.add(cs.AccountId);
                }
                Map<id,Account> accMap = new Map<id,Account>([SELECT id, Latest_case_Inserted__c FROM Account where id IN :accountids]);
                if(trigger.isInsert && Trigger.isafter){
                    for(case cs :caseList){
                       if(accMap.containsKey(cs.AccountId)){
                            Account acc = accMap.get(cs.AccountId);
                            if(acc.Latest_case_Inserted__c != cs.CaseNumber){
                                acc.Latest_case_Inserted__c = cs.CaseNumber;
                                mapToUpdate.put(acc.Id,acc);
                            }
                       }
                    }
                    update mapToUpdate.values();
                }
            
        }
     

    }
}