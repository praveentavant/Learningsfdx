trigger OpportunityCount on Opportunity (after update,after insert,after delete) {
    switch on trigger.operationType{
        when AFTER_INSERT{
            set<id> AccountIds = new set<Id>();
            for(opportunity opptyList : trigger.new ){
                if(String.isNotBlank(opptyList.AccountId)){
                    AccountIds.add(opptyList.AccountId);
                    
                }
                List<aggregateResult> optyList = [SELECT AccountId,count(Id) relatedAccount FROM Opportunity WHERE AccountId IN : AccountIds GROUP BY AccountId ];
                Map<id,Account> accountMap = new Map<Id,Account>();
                for(AggregateResult opp : optyList){
                    string relatedAccountid = string.valueOf(opp.get('AccountId'));
                    Integer opportunityCount = Integer.valueOf(opp.get('relatedAccount'));
                    Account newAccount = new Account(id=relatedAccountid, OpportunityCount__c=opportunityCount);
                    accountMap.put(relatedAccountid,newAccount);
                } update accountMap.values();
            }
        }
        when AFTER_DELETE{
            set<id> AccountIds = new set<Id>();
            for(opportunity oldOppty : trigger.old){
                if(String.isNotBlank(oldOppty.AccountId)){
                    AccountIds.add(oldOppty.AccountId);
                }
            }
            List<aggregateResult> optyList = [SELECT AccountId,count(Id) relatedAccount FROM Opportunity WHERE AccountId IN : AccountIds GROUP BY AccountId ];
                Map<id,Account> accountMap = new Map<Id,Account>();
                for(AggregateResult opp : optyList){
                    string relatedAccountid = string.valueOf(opp.get('AccountId'));
                    Integer opportunityCount = Integer.valueOf(opp.get('relatedAccount'));
                    Account newAccount = new Account(id=relatedAccountid, OpportunityCount__c=opportunityCount);
                    accountMap.put(relatedAccountid,newAccount);
                }
            for(id accid :AccountIds ){
                if(!accountMap.containsKey(accid)){
                    accountMap.put(accid, new Account(id=accid,OpportunityCount__c=0));
                }
            }
            
            update accountMap.values();
        }
    }
    

}