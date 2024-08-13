public with sharing class CTPersonController {
    Public static String gettoken(String mobileNo){
        blob value = blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value); // crpto is a standard class of salesforce 
        // get a string value of hash blob

        return EncodingUtil.base64Encode(hash);
    }
    //get recent list of person having health status change
    
    public static List<Person__C> getRecentHealthChanges(){
        Return [SELECT id,Name,Health_Status__c, Status_Update_Date__c, Mobile__c, Token__c  FROM Person__c ORDER BY Status_Update_Date__c DESC limit 100];
    }
    public static List<Person__c> searchpeople(String searchTerm){
        searchTerm = searchTerm +'%';
        return [select id,Name,Health_Status__c, Status_Update_Date__c, Mobile__c, Token__c from Person__c 
        WHERE Name like :searchTerm 
        OR Mobile__c like :searchTerm 
        OR Token__c like :searchTerm 
        ORDER BY Status_Update_Date__c DESC NULLS LAST];

    }

    public static Person__C getPersonById(id personId){
      List<Person__c> personList =  [select id,Name,Health_Status__c, Status_Update_Date__c, Mobile__c, Token__c from Person__c WHERE id =:personId];
      if(personList!=Null && personList.size()>0){
        return personList[0];
      }
      return Null;

    }
}