trigger CountContactOnAccount on Contact (after insert,after update,after undelete,after delete) {
    Set<Id> accIds = new Set<Id>();
    list<contact> newContacts = trigger.new ; 
    
        if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete) ){
            if(!newContacts.isEmpty()){
                for(Contact con : newContacts ){
                    if(con.AccountId!= null){
                        accIds.add(con.AccountId);
                    }
                   
                }
            }
         
    
        }
    
 
    if(trigger.isAfter && trigger.isUpdate ){
        system.debug('update called');
        //if(!newContacts.isEmpty()){
            for(contact con : trigger.new ){
                if(con.AccountId != trigger.oldMap.get(con.id).AccountId ){

                    accIds.add(trigger.oldMap.get(con.id).AccountId);
                    accIds.add(con.AccountId);
                    system.debug('contactrecords'+con.Name);
                }
            }
       // }
    }
    if(trigger.isAfter && trigger.isDelete ){
        if(!trigger.old.isEmpty()){
            for(contact con : trigger.old){
                accIds.add(con.AccountId);
            }
        }
    }

    List<AggregateResult> result = [SELECT AccountId account , COUNT(Id) contacts FROM Contact where AccountId IN : accIds GROUP BY AccountId ];
    list<Account> accList = new list<Account>();
    if(!result.isEmpty()){
        for(AggregateResult ag : result ){
            Account acc = new Account();
            acc.id = (Id)ag.get('account');
            acc.Active_Contacts__c = (Integer)ag.get('contacts');
            accList.add(acc);
        }if(!accList.isEmpty()){
            update accList;
        }
    }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    // if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete)){
    
    //     if(!trigger.new.isEmpty()){
    //         for(contact con : trigger.new){
    //             if(con.AccountId != null || con.AccountId!=''){
    //                 accIds.add(con.AccountId);
    //             }
    //         }
    //     }
    // }
    // else if(trigger.isAfter && trigger.isUpdate){
    //     if(!trigger.new.isEmpty()){
    //         for(Contact con : trigger.new){
    //             if(con.AccountId!=trigger.oldMap.get(con.Id).AccountId){
    //                 accIds.add(con.AccountId);
    //             }
    //         }
    //     }
    // }
    // else if(trigger.isAfter && trigger.isDelete){
    //     system.debug('==Afterdete==>'+trigger.old);
    //     if(!trigger.old.isEmpty()){
    //         for(contact con : trigger.old){
    //             if(con.AccountId != null || con.AccountId!=''){
    //                 if(con.AccountId!=null){
    //                     accIds.add(con.AccountId);
                        
    //                 }system.debug('==AfterdeleteAccountids==>'+accIds);
    //             }
                
    //         }
    //     }
      
    // }

    // if(!accIds.isEmpty()){
        
    //     list<Account> accounts = [Select id,Active_Contacts__c,(Select id,AccountId from contacts) FROM Account WHERE id IN :accIds];
    //     List<Account> acctoUpdate = new List<Account>();
    //     if(!accounts.isEmpty()){
    //         for(Account Acc : accounts){
    //             Acc.Active_Contacts__c=Acc.Contacts.size();
    //             acctoUpdate.add(acc);
    //         }update acctoUpdate;
    //     }
        

    // }

}