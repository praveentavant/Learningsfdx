public with sharing class CTLocationController {
    public static list<Location__c> getRecentStatusChanges(){
        return [SELECT Id, OwnerId, Name, CreatedDate, Address__c, Pincode__c, Status_Update_Date__c, Status__c, CreatedById FROM Location__c ORDER BY Status_Update_Date__c DESC Limit 100 ];
    }
    public static List<Location__c> searchLocations(string searchTerm){
        searchTerm = searchTerm + '%';
       return [SELECT Id, OwnerId, Name, CreatedDate, Address__c, Pincode__c, Status_Update_Date__c, Status__c, CreatedById FROM Location__c 
        WHERE Name LIKE :searchTerm 
        OR Pincode__c LIKE :searchTerm 
        OR Address__c LIKE :searchTerm ORDER BY Status_Update_Date__c DESC
         ];
    }
    public static Location__c getLocationById(String locationId){
      List<Location__c> LocationList =  [SELECT Id, OwnerId, Name, CreatedDate, Address__c, Pincode__c, Status_Update_Date__c, Status__c, CreatedById FROM Location__c 
        WHERE Id =:locationId];
        if(LocationList !=null && LocationList.size()>0){
            Return LocationList[0];
        }return null;
    }
}