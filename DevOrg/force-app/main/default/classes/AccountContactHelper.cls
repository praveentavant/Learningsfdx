public with sharing class AccountContactHelper {
   Public static void updateActiveContacts(Set<Id> AccountIds){
    List<aggregateResult> contactList =[select AccountId,COUNT(Id) totalContacts from contact where Active__c =true AND AccountId=:AccountIds group by AccountId ];
    Map<Id,Account> Accounts = new Map<Id,Account>();
    // we are using aggregateResult instead of sObject name bcz in the query we are using a method COUNT(Id) due to which it can not be stored in a single list.
    for(aggregateResult results : contactList){
        string relatedAccount = String.valueOf(results.get('AccountId'));
        Integer totalContact = Integer.valueOf(results.get('totalContacts'));
        Account acc = new Account(Id=relatedAccount,Active_Contacts__c=totalContact);
        Accounts.Put(relatedAccount,acc);
    }
    for(Id accId :AccountIds ){
        if(!Accounts.containsKey(accId)){
            Accounts.put(accId, New Account(Id=accId, Active_Contacts__c=0));
        }
    }
    
    update Accounts.values();
   }
}