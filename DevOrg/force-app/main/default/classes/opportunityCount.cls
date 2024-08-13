public class opportunityCount {
    public static Map<Id,List<opportunity>> oppCount(Id recordId){
       List<Opportunity> oppList = new List<Opportunity>(); 
        Map<Id,List<opportunity>> mapAccToListOpp = new Map<Id,List<opportunity>>();
        Map<Id,Opportunity> accToOppMap = New Map<Id,Opportunity>();
        oppList = [SELECT id,Name,AccountId FROM opportunity WHERE AccountId =:recordId ];
        for(opportunity opp :oppList){
            if(mapAccToListOpp.containsKey(opp.AccountId)){
			  mapAccToListOpp.get(opp.AccountId).add(opp);
                
            }
            mapAccToListOpp.put(opp.AccountId,new List<opportunity>());

            
            
        }
        for(Id acc : mapAccToListOpp.keySet()){
            system.debug('size==> ' +mapAccToListOpp.get(acc).Size());
        }
       return mapAccToListOpp;
    }
}