public with sharing class PrimaryContactCheckHelper {
  public static void primarycheck(List<contact> newContacts,Map<Id,Contact>oldMap){
    Set<Id> parentIds = New Set<Id>();
    Map<id,Integer> contactCount = New Map<Id,Integer>();
    if(!newContacts.isEmpty()){
        
            for(Contact con : newContacts){
                if(oldMap!=null){
                    if(
                        con.AccountId!=oldMap.get(con.id).AccountId
                    ){
                        parentIds.add(oldMap.get(con.id).AccountId);
                        parentIds.add(con.AccountId);
                    }
                    parentIds.add(con.AccountId);
                }
                parentIds.add(con.AccountId);
            }
 

    }

    List<Contact>conList =[Select id,Primary_contact__c,AccountId from Contact where AccountId IN : parentIds and Primary_contact__c=true];
    for(contact acc : conList){
        contactCount.put(acc.AccountId,conList.size());
    }

    For(contact cont : newContacts){
        if(cont.Primary_contact__c==true && contactCount.containsKey(cont.AccountId) && contactCount.get(cont.AccountId) >1 ){
            cont.addError('you can not add more then 1 primary contact on your account');
        }
    }

  }
}