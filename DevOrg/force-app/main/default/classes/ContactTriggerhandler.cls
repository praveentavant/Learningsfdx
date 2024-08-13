public with sharing class ContactTriggerhandler {
    Public static void AfterInsertContact(List<contact> conList) {
        Set<id> AccountIds = new Set<Id>();
    
        for(Contact con : conList){
            if(string.isNotBlank(con.AccountId)){
                AccountIds.add(con.AccountId);
            }
            }
            AccountContactHelper.updateActiveContacts(AccountIds);

    }
    public static void afterUpdateContact(List<contact> newContactList, Map<Id,contact> oldContactMap){
        Set<id> AccountIds = new Set<Id>();
    
        for(Contact con : newContactList){
            if(string.isNotBlank(con.AccountId) && oldContactMap.get(con.Id).Active__c != con.Active__c){
                AccountIds.add(con.AccountId);
            }else if(oldContactMap.get(con.Id).AccountId !=con.AccountId){
                AccountIds.add(con.AccountId);  
                AccountIds.add(oldContactMap.get(con.Id).AccountId); 
            }
            }
            AccountContactHelper.updateActiveContacts(AccountIds);
    }
    Public static void afterDeleteContact(List<contact> oldContacts){
        Set<id> AccountIds = new Set<Id>();
    
        for(Contact con : oldContacts){
            if(string.isNotBlank(con.AccountId)){
                AccountIds.add(con.AccountId);
            }
            }
            AccountContactHelper.updateActiveContacts(AccountIds);

    }
    Public static void afterUndeleteContact(List<contact> newContacts){
        Set<id> AccountIds = new Set<Id>();
    
        for(Contact con : newContacts){
            if(string.isNotBlank(con.AccountId)){
                AccountIds.add(con.AccountId);
            }
            }
            AccountContactHelper.updateActiveContacts(AccountIds);


}
}