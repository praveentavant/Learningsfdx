public with sharing class CTLocationTracingController {
   public static List<Location_Tracing__c> getVisitors(String locationId){
    return [SELECT Id, Name, Person__c,Person__r.token__c,Person__r.Health_status__c, Location__c, Visit_Date__c FROM Location_Tracing__c ORDER BY Visit_Date__c DESC ];
   }

   public static List<Location_Tracing__c>getLocationByPersonId(Set<Id> personIds){
    return [SELECT Id, Name, Person__c, Location__c, Visit_Date__c FROM Location_Tracing__c WHERE Person__c IN:personIds AND Visit_Date__c = LAST_N_DAYS:10  ];
   }
   public static List<Location_Tracing__c> getLocationByLocationIds(Set<Id> locationIds){
    return [SELECT Id, Name, Person__c, Location__c, Visit_Date__c FROM Location_Tracing__c
     WHERE Location__c=:locationIds
     AND Person__r.Health_status__c ='Green'
     AND Visit_Date__c =LAST_N_DAYS:10 ];
   }

   public static List<Location_Tracing__c>checkDuplicates(List<Location_Tracing__c> locationTraces){
    set<Id>LocationIds = new set<id>();
    set<Id>PersonIds = new Set<Id>();
    for(Location_Tracing__c trace : locationTraces){
        LocationIds.add(trace.Location__c);
        PersonIds.add(trace.Person__c);
    }
    //Map of existing records which will be used to store the data of the below query
    Map<Id,Set<Id>> mapOfExistingRecords = New Map<Id,Set<Id>>();
    
    List<Location_Tracing__c> duplicates = New List<Location_Tracing__c>();

    List<Location_Tracing__c> existingRecords = [SELECT Id,Person__c,Location__c FROM Location_Tracing__c
            WHERE Person__c IN :PersonIds
                    and Location__c IN :LocationIds  ];

     if(existingRecords!=null && existingRecords.size()>0){  //null check to check existingRecords does have any value or not otherwise it would through a derefrence null of error.
        for(Location_Tracing__c trace : existingRecords ){
            if(! mapOfExistingRecords.containsKey(trace.Location__c)){  
                mapOfExistingRecords.put(trace.Location__c, new Set<Id>());
            }
            mapOfExistingRecords.get(trace.Location__c).add(trace.Person__c);
        }
        
        for(Location_Tracing__c trace : locationTraces ){
           if(mapOfExistingRecords.containsKey(trace.Location__c) && mapOfExistingRecords.get(trace.Location__c).contains(trace.Person__c)){
               duplicates.add(trace);
           }
        }
     }
    
     return duplicates;
   } 
   

   

}