trigger Only2Contacts on Contact (before insert) {
    Set<id> accIds = new Set<id>();
    if(trigger.isBefore && trigger.isInsert){
        if(!trigger.new.isEmpty()){
            for(contact con : trigger.new){
                accIds.add(con.AccountId);
            }
        }
      Map<id,integer> acctoContactMap = New Map<id,Integer>();
      for(AggregateResult aggrContacts : [SELECT AccountId,COUNT(id) NumOfContacts 
                                            FROM Contact 
                                            WHERE AccountId IN :accIds 
                                            GROUP BY AccountId 
                                            ])
      {
       acctoContactMap.put((Id)aggrContacts.get('AccountId'), (Integer)aggrContacts.get('NumOfContacts'));
       }
        
        if(!Trigger.new.isEmpty()){
            for(contact con : trigger.new){
                if(con.AccountId!=null && acctoContactMap.get(con.AccountId) >= 2){
                    con.addError('Sorry! you can not add more then 2 contacts for an account');
                }
            }
        }                                    
                                            
    
      
    } 
   
}